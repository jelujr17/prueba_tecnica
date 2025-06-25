import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica/utils/filters.dart';
import 'package:prueba_tecnica/models/evento.dart';
import 'package:prueba_tecnica/data/mock_data.dart';

void main() {
  group('Tests de Lógica de Filtrado Avanzado', () {
    late List<Evento> testEvents;

    setUp(() {
      // Eventos de prueba con datos específicos
      testEvents = [
        Evento(
          id: 1,
          hijoId: 1,
          categoriaId: 1,
          descripcion: 'Desayuno con cereales',
          hora: '08:00',
        ),
        Evento(
          id: 2,
          hijoId: 1,
          categoriaId: 2,
          descripcion: 'Juegos en el parque',
          hora: '10:30',
        ),
        Evento(
          id: 3,
          hijoId: 2,
          categoriaId: 1,
          descripcion: 'Almuerzo con verduras',
          hora: '12:00',
        ),
        Evento(
          id: 4,
          hijoId: 2,
          categoriaId: 3,
          descripcion: 'Siesta de la tarde',
          hora: '15:00',
        ),
        Evento(
          id: 5,
          hijoId: 3,
          categoriaId: 2,
          descripcion: 'Actividad de pintura',
          hora: '16:00',
        ),
        Evento(
          id: 6,
          hijoId: 1,
          categoriaId: 4,
          descripcion: 'Cambio de pañal',
          hora: '14:00',
        ),
      ];
    });

    group('Filtrado por Hijo', () {
      test('Filtra correctamente eventos por hijo específico', () {
        final resultado = filterEvents(eventos: testEvents, hijoId: 1);

        expect(resultado.length, equals(3));
        expect(resultado.every((e) => e.hijoId == 1), isTrue);
        
        // Verificar IDs específicos
        final ids = resultado.map((e) => e.id).toList();
        expect(ids, containsAll([1, 2, 6]));
      });

      test('Devuelve lista vacía para hijo inexistente', () {
        final resultado = filterEvents(eventos: testEvents, hijoId: 999);

        expect(resultado.isEmpty, isTrue);
      });

      test('Filtra múltiples hijos si se implementa en el futuro', () {
        // Test preparado para funcionalidad futura
        final hijoIdsValidos = [1, 2, 3];
        final todosLosEventos = filterEvents(eventos: testEvents);
        
        expect(
          todosLosEventos.every((e) => hijoIdsValidos.contains(e.hijoId)),
          isTrue,
        );
      });
    });

    group('Filtrado por Categoría', () {
      test('Filtra eventos de alimentación correctamente', () {
        final resultado = filterEvents(eventos: testEvents, categoriaId: 1);

        expect(resultado.length, equals(2));
        expect(resultado.every((e) => e.categoriaId == 1), isTrue);
        
        // Verificar que contiene descripciones de alimentación
        final descripciones = resultado.map((e) => e.descripcion).toList();
        expect(descripciones, contains('Desayuno con cereales'));
        expect(descripciones, contains('Almuerzo con verduras'));
      });

      test('Filtra eventos de actividades correctamente', () {
        final resultado = filterEvents(eventos: testEvents, categoriaId: 2);

        expect(resultado.length, equals(2));
        expect(resultado.every((e) => e.categoriaId == 2), isTrue);
      });

      test('Filtra eventos de siestas correctamente', () {
        final resultado = filterEvents(eventos: testEvents, categoriaId: 3);

        expect(resultado.length, equals(1));
        expect(resultado.first.descripcion, equals('Siesta de la tarde'));
      });

      test('Filtra eventos de higiene correctamente', () {
        final resultado = filterEvents(eventos: testEvents, categoriaId: 4);

        expect(resultado.length, equals(1));
        expect(resultado.first.descripcion, equals('Cambio de pañal'));
      });
    });

    group('Filtrado Combinado', () {
      test('Filtra por hijo y categoría simultáneamente', () {
        final resultado = filterEvents(
          eventos: testEvents,
          hijoId: 1,
          categoriaId: 1,
        );

        expect(resultado.length, equals(1));
        expect(resultado.first.id, equals(1));
        expect(resultado.first.descripcion, equals('Desayuno con cereales'));
      });

      test('Devuelve vacío cuando no hay coincidencias en filtro combinado', () {
        final resultado = filterEvents(
          eventos: testEvents,
          hijoId: 1,
          categoriaId: 3, // Hijo 1 no tiene eventos de categoría 3
        );

        expect(resultado.isEmpty, isTrue);
      });

      test('Filtro combinado con múltiples resultados', () {
        final resultado = filterEvents(
          eventos: testEvents,
          hijoId: 2,
          categoriaId: 1,
        );

        expect(resultado.length, equals(1));
        expect(resultado.first.descripcion, equals('Almuerzo con verduras'));
      });
    });

    group('Casos Edge', () {
      test('Maneja lista vacía de eventos', () {
        final resultado = filterEvents(eventos: []);

        expect(resultado.isEmpty, isTrue);
      });

      test('Sin filtros devuelve todos los eventos', () {
        final resultado = filterEvents(eventos: testEvents);

        expect(resultado.length, equals(testEvents.length));
        expect(resultado, equals(testEvents));
      });

      test('Filtros nulos se ignoran correctamente', () {
        final resultado = filterEvents(
          eventos: testEvents,
          hijoId: null,
          categoriaId: null,
        );

        expect(resultado.length, equals(testEvents.length));
      });
    });

    group('Búsqueda por Texto', () {
      test('Busca eventos por descripción', () {
        final resultado = searchEvents(
          eventos: testEvents,
          searchText: 'cereales',
        );

        expect(resultado.length, equals(1));
        expect(resultado.first.descripcion, contains('cereales'));
      });

      test('Búsqueda case-insensitive', () {
        final resultado = searchEvents(
          eventos: testEvents,
          searchText: 'PARQUE',
        );

        expect(resultado.length, equals(1));
        expect(resultado.first.descripcion.toLowerCase(), contains('parque'));
      });

      test('Búsqueda con texto vacío devuelve todos', () {
        final resultado = searchEvents(
          eventos: testEvents,
          searchText: '',
        );

        expect(resultado.length, equals(testEvents.length));
      });

      test('Búsqueda sin coincidencias devuelve lista vacía', () {
        final resultado = searchEvents(
          eventos: testEvents,
          searchText: 'inexistente',
        );

        expect(resultado.isEmpty, isTrue);
      });
    });

    group('Filtrado por Tiempo', () {
      test('Filtra eventos por rango de tiempo', () {
        final resultado = filterEventsByTimeRange(
          eventos: testEvents,
          startTime: '10:00',
          endTime: '15:00',
        );

        // Debugear el resultado
        print('Eventos en rango 10:00-15:00:');
        for (var evento in resultado) {
          print('  ${evento.hora}: ${evento.descripcion}');
        }

        // Los eventos en el rango son: 10:30, 12:00, 14:00, 15:00
        expect(resultado.length, equals(4));
        
        // Verificar que todas las horas están en el rango
        final horas = resultado.map((e) => e.hora).toList();
        expect(horas, containsAll(['10:30', '12:00', '14:00', '15:00']));
      });

      test('Filtra desde hora específica', () {
        final resultado = filterEventsByTimeRange(
          eventos: testEvents,
          startTime: '15:00',
        );

        expect(resultado.length, equals(2));
        
        final horas = resultado.map((e) => e.hora).toList();
        expect(horas, containsAll(['15:00', '16:00']));
      });

      test('Filtra hasta hora específica', () {
        final resultado = filterEventsByTimeRange(
          eventos: testEvents,
          endTime: '10:30',
        );

        expect(resultado.length, equals(2));
        
        final horas = resultado.map((e) => e.hora).toList();
        expect(horas, containsAll(['08:00', '10:30']));
      });
    });
  });

  group('Tests con Datos Reales de MockData', () {
    test('Filtrado funciona con datos reales de la aplicación', () {
      final eventosAlimentacion = filterEvents(
        eventos: MockData.events,
        categoriaId: 1, // Alimentación
      );

      expect(eventosAlimentacion.isNotEmpty, isTrue);
      expect(
        eventosAlimentacion.every((e) => e.categoriaId == 1),
        isTrue,
      );
    });

    test('Cada categoría tiene al menos un evento', () {
      for (var categoria in MockData.categorias) {
        final eventosCategoria = filterEvents(
          eventos: MockData.events,
          categoriaId: categoria.id,
        );

        expect(
          eventosCategoria.isNotEmpty,
          isTrue,
          reason: 'Categoría ${categoria.nombre} no tiene eventos',
        );
      }
    });

    test('Cada hijo tiene al menos un evento', () {
      for (var hijo in MockData.children) {
        final eventosHijo = filterEvents(
          eventos: MockData.events,
          hijoId: hijo.id,
        );

        expect(
          eventosHijo.isNotEmpty,
          isTrue,
          reason: 'Hijo ${hijo.nombre} no tiene eventos',
        );
      }
    });

    test('Análisis de distribución de eventos por hora', () {
      final Map<String, int> eventosPorHora = {};
      
      for (var evento in MockData.events) {
        final hora = evento.hora.split(':')[0]; // Solo la hora
        eventosPorHora[hora] = (eventosPorHora[hora] ?? 0) + 1;
      }

      print('Distribución de eventos por hora: $eventosPorHora');
      
      // Verificar que hay eventos distribuidos a lo largo del día
      expect(eventosPorHora.isNotEmpty, isTrue);
    });
  });
}
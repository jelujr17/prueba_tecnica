import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_tecnica/data/mock_data.dart';
import 'package:prueba_tecnica/widgets/menu_categorias.dart';

void main() {
  group('🎨 Widget Tests - UI Components', () {
    

    testWidgets('MenuCategorias muestra todas las categorías', (
      WidgetTester tester,
    ) async {
      int? selectedCategoryId;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuCategorias(
              selectedCategoryId: selectedCategoryId,
              onCategorySelected: (id) {
                selectedCategoryId = id;
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verificar elementos del menú
      expect(find.text('Todos'), findsOneWidget);
      expect(find.text('Alimentacion'), findsOneWidget);
      expect(find.text('Actividades'), findsOneWidget);
      expect(find.text('Siestas'), findsOneWidget);
      expect(find.text('Higiene'), findsOneWidget);
    });
  });

  group('🔄 Interaction Tests - User Experience', () {
    testWidgets('MenuCategorias responde a taps', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                int? selectedCategoryId;
                return MenuCategorias(
                  selectedCategoryId: selectedCategoryId,
                  onCategorySelected: (id) {
                    setState(() {
                      selectedCategoryId = id;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Tocar categoría "Alimentacion"
      await tester.tap(find.text('Alimentacion'));
      await tester.pumpAndSettle();

      // Verificar que el tap no causa errores
      expect(find.text('Alimentacion'), findsOneWidget);
    });
  });

  group('📊 Data Consistency Tests', () {
    test('Datos de MockData son consistentes', () {
      // Test solo de datos, sin renderizar UI
      expect(MockData.events.isNotEmpty, isTrue);
      expect(MockData.children.isNotEmpty, isTrue);
      expect(MockData.categorias.isNotEmpty, isTrue);

      // Verificar relaciones
      for (final evento in MockData.events) {
        final hijoExiste = MockData.children.any((h) => h.id == evento.hijoId);
        final categoriaExiste = MockData.categorias.any(
          (c) => c.id == evento.categoriaId,
        );

        expect(
          hijoExiste,
          isTrue,
          reason:
              'Evento ${evento.id} referencia hijo inexistente ${evento.hijoId}',
        );
        expect(
          categoriaExiste,
          isTrue,
          reason:
              'Evento ${evento.id} referencia categoría inexistente ${evento.categoriaId}',
        );
      }
    });

    test('Cada evento tiene datos válidos', () {
      // Test solo de validación de datos, sin UI
      for (final evento in MockData.events) {
        expect(
          evento.descripcion.isNotEmpty,
          isTrue,
          reason: 'Evento ${evento.id} tiene descripción vacía',
        );
        expect(
          evento.hora.isNotEmpty,
          isTrue,
          reason: 'Evento ${evento.id} tiene hora vacía',
        );
        expect(
          evento.hijoId,
          greaterThan(0),
          reason: 'Evento ${evento.id} tiene hijoId inválido',
        );
        expect(
          evento.categoriaId,
          greaterThan(0),
          reason: 'Evento ${evento.id} tiene categoriaId inválido',
        );

        // Verificar formato de hora
        final RegExp horaRegex = RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$');
        expect(
          horaRegex.hasMatch(evento.hora),
          isTrue,
          reason:
              'Evento ${evento.id} tiene formato de hora inválido: ${evento.hora}',
        );
      }
    });

    test('Relaciones entre datos son válidas', () {
      // Verificar que todos los IDs de hijos referenciados existen
      final hijosIds = MockData.children.map((h) => h.id).toSet();
      final categoriasIds = MockData.categorias.map((c) => c.id).toSet();

      for (final evento in MockData.events) {
        expect(
          hijosIds.contains(evento.hijoId),
          isTrue,
          reason:
              'Evento ${evento.id} referencia hijo ID ${evento.hijoId} que no existe',
        );
        expect(
          categoriasIds.contains(evento.categoriaId),
          isTrue,
          reason:
              'Evento ${evento.id} referencia categoría ID ${evento.categoriaId} que no existe',
        );
      }
    });

    test('Datos de hijos son válidos', () {
      for (final hijo in MockData.children) {
        expect(
          hijo.nombre.isNotEmpty,
          isTrue,
          reason: 'Hijo ${hijo.id} tiene nombre vacío',
        );
        expect(
          hijo.id,
          greaterThan(0),
          reason: 'Hijo tiene ID inválido: ${hijo.id}',
        );
      }
    });

    test('Datos de categorías son válidos', () {
      for (final categoria in MockData.categorias) {
        expect(
          categoria.nombre.isNotEmpty,
          isTrue,
          reason: 'Categoría ${categoria.id} tiene nombre vacío',
        );
        expect(
          categoria.id,
          greaterThan(0),
          reason: 'Categoría tiene ID inválido: ${categoria.id}',
        );
      }
    });
  });
}

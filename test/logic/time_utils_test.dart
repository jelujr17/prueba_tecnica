import 'package:flutter_test/flutter_test.dart';

/// Utilidades para manejo de tiempo en la aplicación
class TimeUtils {
  /// Convierte una hora en formato HH:MM a minutos desde medianoche
  static int timeToMinutes(String time) {
    final parts = time.split(':');
    if (parts.length != 2) throw ArgumentError('Formato de hora inválido: $time');
    
    final hours = int.tryParse(parts[0]);
    final minutes = int.tryParse(parts[1]);
    
    if (hours == null || minutes == null) {
      throw ArgumentError('Formato de hora inválido: $time');
    }
    
    if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) {
      throw ArgumentError('Hora fuera de rango: $time');
    }
    
    return hours * 60 + minutes;
  }

  /// Convierte minutos desde medianoche a formato HH:MM
  static String minutesToTime(int minutes) {
    if (minutes < 0 || minutes >= 1440) {
      throw ArgumentError('Minutos fuera de rango: $minutes');
    }
    
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    
    return '${hours.toString().padLeft(2, '0')}:${mins.toString().padLeft(2, '0')}';
  }

  /// Compara dos horas en formato HH:MM
  static int compareTime(String time1, String time2) {
    final minutes1 = timeToMinutes(time1);
    final minutes2 = timeToMinutes(time2);
    
    return minutes1.compareTo(minutes2);
  }

  /// Verifica si una hora está en un rango específico
  static bool isTimeInRange(String time, String startTime, String endTime) {
    final timeMinutes = timeToMinutes(time);
    final startMinutes = timeToMinutes(startTime);
    final endMinutes = timeToMinutes(endTime);
    
    // Manejar el caso de cruzar medianoche
    if (startMinutes <= endMinutes) {
      return timeMinutes >= startMinutes && timeMinutes <= endMinutes;
    } else {
      return timeMinutes >= startMinutes || timeMinutes <= endMinutes;
    }
  }

  /// Calcula la diferencia en minutos entre dos horas
  static int timeDifferenceInMinutes(String startTime, String endTime) {
    final startMinutes = timeToMinutes(startTime);
    final endMinutes = timeToMinutes(endTime);
    
    int diff = endMinutes - startMinutes;
    
    // Manejar el caso de cruzar medianoche
    if (diff < 0) {
      diff += 1440; // 24 horas en minutos
    }
    
    return diff;
  }

  /// Categoriza una hora en período del día
  static String getTimeOfDay(String time) {
    final minutes = timeToMinutes(time);
    
    if (minutes >= 360 && minutes < 720) { // 6:00 - 12:00
      return 'Mañana';
    } else if (minutes >= 720 && minutes < 1080) { // 12:00 - 18:00
      return 'Tarde';
    } else if (minutes >= 1080 || minutes < 360) { // 18:00 - 6:00
      return 'Noche';
    }
    
    return 'Desconocido';
  }

  /// Formatea una hora para mostrar (elimina ceros innecesarios)
  static String formatTimeForDisplay(String time) {
    final parts = time.split(':');
    if (parts.length != 2) return time;
    
    final hours = int.tryParse(parts[0]);
    final minutes = int.tryParse(parts[1]);
    
    if (hours == null || minutes == null) return time;
    
    final hourStr = hours.toString();
    final minuteStr = minutes.toString().padLeft(2, '0');
    
    return '$hourStr:$minuteStr';
  }

  /// Obtiene la siguiente hora disponible (incrementa 30 minutos)
  static String getNextAvailableTime(String currentTime) {
    final currentMinutes = timeToMinutes(currentTime);
    final nextMinutes = (currentMinutes + 30) % 1440;
    return minutesToTime(nextMinutes);
  }
}

void main() {
  group('Tests de Utilidades de Tiempo', () {
    group('Conversión Tiempo a Minutos', () {
      test('Convierte hora válida correctamente', () {
        expect(TimeUtils.timeToMinutes('08:30'), equals(510));
        expect(TimeUtils.timeToMinutes('12:00'), equals(720));
        expect(TimeUtils.timeToMinutes('23:59'), equals(1439));
        expect(TimeUtils.timeToMinutes('00:00'), equals(0));
      });

      test('Maneja horas con un dígito', () {
        expect(TimeUtils.timeToMinutes('8:30'), equals(510));
        expect(TimeUtils.timeToMinutes('9:05'), equals(545));
      });

      test('Lanza excepción para formato inválido', () {
        expect(() => TimeUtils.timeToMinutes('25:00'), throwsArgumentError);
        expect(() => TimeUtils.timeToMinutes('12:60'), throwsArgumentError);
        expect(() => TimeUtils.timeToMinutes('abc:def'), throwsArgumentError);
        expect(() => TimeUtils.timeToMinutes('12'), throwsArgumentError);
        expect(() => TimeUtils.timeToMinutes('12:30:45'), throwsArgumentError);
      });
    });

    group('Conversión Minutos a Tiempo', () {
      test('Convierte minutos válidos correctamente', () {
        expect(TimeUtils.minutesToTime(510), equals('08:30'));
        expect(TimeUtils.minutesToTime(720), equals('12:00'));
        expect(TimeUtils.minutesToTime(0), equals('00:00'));
        expect(TimeUtils.minutesToTime(1439), equals('23:59'));
      });

      test('Lanza excepción para minutos inválidos', () {
        expect(() => TimeUtils.minutesToTime(-1), throwsArgumentError);
        expect(() => TimeUtils.minutesToTime(1440), throwsArgumentError);
        expect(() => TimeUtils.minutesToTime(2000), throwsArgumentError);
      });
    });

    group('Comparación de Horas', () {
      test('Compara horas correctamente', () {
        expect(TimeUtils.compareTime('08:00', '09:00'), lessThan(0));
        expect(TimeUtils.compareTime('12:30', '12:30'), equals(0));
        expect(TimeUtils.compareTime('15:45', '10:20'), greaterThan(0));
      });

      test('Compara con diferentes formatos', () {
        expect(TimeUtils.compareTime('8:00', '08:00'), equals(0));
        expect(TimeUtils.compareTime('9:30', '10:00'), lessThan(0));
      });
    });

    group('Verificación de Rango', () {
      test('Verifica correctamente si hora está en rango', () {
        expect(
          TimeUtils.isTimeInRange('10:30', '09:00', '12:00'),
          isTrue,
        );
        expect(
          TimeUtils.isTimeInRange('08:00', '09:00', '12:00'),
          isFalse,
        );
        expect(
          TimeUtils.isTimeInRange('09:00', '09:00', '12:00'),
          isTrue,
        );
        expect(
          TimeUtils.isTimeInRange('12:00', '09:00', '12:00'),
          isTrue,
        );
      });

      test('Maneja rangos que cruzan medianoche', () {
        expect(
          TimeUtils.isTimeInRange('00:00', '23:30', '01:30'),
          isTrue,
        );
        expect(
          TimeUtils.isTimeInRange('23:45', '23:30', '01:30'),
          isTrue,
        );
        expect(
          TimeUtils.isTimeInRange('02:00', '23:30', '01:30'),
          isFalse,
        );
      });
    });

    group('Diferencia de Tiempo', () {
      test('Calcula diferencia correctamente', () {
        expect(
          TimeUtils.timeDifferenceInMinutes('08:00', '10:30'),
          equals(150), // 2.5 horas
        );
        expect(
          TimeUtils.timeDifferenceInMinutes('12:00', '12:00'),
          equals(0),
        );
      });

      test('Maneja cruce de medianoche', () {
        expect(
          TimeUtils.timeDifferenceInMinutes('23:00', '01:00'),
          equals(120), // 2 horas
        );
        expect(
          TimeUtils.timeDifferenceInMinutes('22:30', '02:15'),
          equals(225), // 3 horas 45 minutos
        );
      });
    });

    group('Categorización por Período', () {
      test('Categoriza correctamente mañana', () {
        expect(TimeUtils.getTimeOfDay('08:00'), equals('Mañana'));
        expect(TimeUtils.getTimeOfDay('11:59'), equals('Mañana'));
        expect(TimeUtils.getTimeOfDay('06:00'), equals('Mañana'));
      });

      test('Categoriza correctamente tarde', () {
        expect(TimeUtils.getTimeOfDay('12:00'), equals('Tarde'));
        expect(TimeUtils.getTimeOfDay('15:30'), equals('Tarde'));
        expect(TimeUtils.getTimeOfDay('17:59'), equals('Tarde'));
      });

      test('Categoriza correctamente noche', () {
        expect(TimeUtils.getTimeOfDay('18:00'), equals('Noche'));
        expect(TimeUtils.getTimeOfDay('22:30'), equals('Noche'));
        expect(TimeUtils.getTimeOfDay('02:00'), equals('Noche'));
        expect(TimeUtils.getTimeOfDay('05:59'), equals('Noche'));
      });
    });

    group('Formateo para Display', () {
      test('Formatea hora para mostrar', () {
        expect(TimeUtils.formatTimeForDisplay('08:30'), equals('8:30'));
        expect(TimeUtils.formatTimeForDisplay('12:00'), equals('12:00'));
        expect(TimeUtils.formatTimeForDisplay('09:05'), equals('9:05'));
      });

      test('Mantiene formato inválido sin cambios', () {
        expect(TimeUtils.formatTimeForDisplay('25:70'), equals('25:70'));
        expect(TimeUtils.formatTimeForDisplay('abc'), equals('abc'));
      });
    });

    group('Siguiente Hora Disponible', () {
      test('Incrementa 30 minutos correctamente', () {
        expect(TimeUtils.getNextAvailableTime('08:00'), equals('08:30'));
        expect(TimeUtils.getNextAvailableTime('08:30'), equals('09:00'));
        expect(TimeUtils.getNextAvailableTime('12:15'), equals('12:45'));
      });

      test('Maneja cruce de medianoche', () {
        expect(TimeUtils.getNextAvailableTime('23:30'), equals('00:00'));
        expect(TimeUtils.getNextAvailableTime('23:45'), equals('00:15'));
      });
    });
  });

  group('Tests de Integración con Datos Reales', () {
    test('Todas las horas de eventos son válidas', () {
      // Simulamos horas que podrían venir de MockData
      final horasEjemplo = ['08:00', '10:30', '12:00', '15:00', '16:00'];
      
      for (var hora in horasEjemplo) {
        expect(
          () => TimeUtils.timeToMinutes(hora),
          returnsNormally,
          reason: 'Hora inválida encontrada: $hora',
        );
      }
    });

    test('Los eventos están ordenados cronológicamente', () {
      final horas = ['08:00', '10:30', '12:00', '15:00', '16:00'];
      
      for (int i = 0; i < horas.length - 1; i++) {
        expect(
          TimeUtils.compareTime(horas[i], horas[i + 1]),
          lessThan(0),
          reason: 'Eventos no están ordenados: ${horas[i]} después de ${horas[i + 1]}',
        );
      }
    });

    test('Validación de horarios de guardería', () {
      final horariosGuarderia = ['07:00', '08:30', '12:00', '15:30', '17:00'];
      
      for (var horario in horariosGuarderia) {
        final periodo = TimeUtils.getTimeOfDay(horario);
        expect(
          ['Mañana', 'Tarde'].contains(periodo),
          isTrue,
          reason: 'Horario de guardería $horario está en período incorrecto: $periodo',
        );
      }
    });
  });
}
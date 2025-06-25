import '../models/evento.dart';

/// Filtra una lista de eventos basado en criterios opcionales
List<Evento> filterEvents({
  required List<Evento> eventos,
  int? hijoId,
  int? categoriaId,
}) {
  List<Evento> result = eventos;

  // Filtrar por hijo si se especifica
  if (hijoId != null) {
    result = result.where((evento) => evento.hijoId == hijoId).toList();
  }

  // Filtrar por categoría si se especifica
  if (categoriaId != null) {
    result = result
        .where((evento) => evento.categoriaId == categoriaId)
        .toList();
  }

  return result;
}

/// Busca eventos por texto en la descripción
List<Evento> searchEvents({
  required List<Evento> eventos,
  required String searchText,
}) {
  if (searchText.isEmpty) return eventos;

  return eventos
      .where(
        (evento) =>
            evento.descripcion.toLowerCase().contains(searchText.toLowerCase()),
      )
      .toList();
}

/// Filtra eventos por rango de tiempo
List<Evento> filterEventsByTimeRange({
  required List<Evento> eventos,
  String? startTime,
  String? endTime,
}) {
  if (startTime == null && endTime == null) return eventos;

  return eventos.where((evento) {
    // Implementación básica - en un caso real usaríamos DateTime
    if (startTime != null && evento.hora.compareTo(startTime) < 0) {
      return false;
    }
    if (endTime != null && evento.hora.compareTo(endTime) > 0) {
      return false;
    }
    return true;
  }).toList();
}

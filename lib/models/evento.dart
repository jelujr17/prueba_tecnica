
class Evento {
  final int id;
  final int hijoId;
  final int categoriaId;
  final String descripcion;
  final String hora;

  Evento({
    required this.id,
    required this.hijoId,
    required this.categoriaId,
    required this.descripcion,
    required this.hora,
  });
}

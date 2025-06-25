import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/evento.dart';
import 'package:prueba_tecnica/models/hijo.dart';
import 'package:prueba_tecnica/models/categoria.dart';

class CartaEvento extends StatelessWidget {
  final Evento evento;
  final Hijo hijo;
  final Categoria categoria;

  const CartaEvento({
    super.key,
    required this.evento,
    required this.hijo,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Barra superior con gradiente
          Container(
            height: 6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  categoria.color,
                  categoria.color.withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          
          // Contenido principal
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Avatar con estado online
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: categoria.color.withOpacity(0.1),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(hijo.imagenUrl),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16),
                
                // Contenido del evento
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header con nombre y hora
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hijo.nombre,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 14,
                                  color: Colors.grey[600],
                                ),
                                SizedBox(width: 4),
                                Text(
                                  evento.hora,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      
                      // Categoría con chip mejorado
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: categoria.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _getCategoryIcon(categoria.nombre),
                              size: 16,
                              color: categoria.color,
                            ),
                            SizedBox(width: 6),
                            Text(
                              categoria.nombre,
                              style: TextStyle(
                                fontSize: 12,
                                color: categoria.color,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      
                      // Descripción con mejor tipografía
                      Text(
                        evento.descripcion,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          height: 1.4,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'alimentacion':
        return Icons.restaurant_rounded;
      case 'actividades':
        return Icons.sports_esports_rounded;
      case 'siestas':
        return Icons.bedtime_rounded;
      case 'higiene':
        return Icons.cleaning_services_rounded;
      case 'deposiciones':
        return Icons.baby_changing_station_rounded;
      case 'observaciones':
        return Icons.visibility_rounded;
      default:
        return Icons.category_rounded;
    }
  }
}
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/selector_hijos.dart';

class HeaderPersonalizado extends StatelessWidget {
  final int? selectedChildId;
  final Function(int?) onChildSelected;

  const HeaderPersonalizado({
    super.key,
    required this.selectedChildId,
    required this.onChildSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF6C5CE7),
            Color(0xFF74B9FF),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar del padre
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage('https://robohash.org/Luis?set=set4&size=200x200'),
            ),
          ),
          SizedBox(width: 16),
          
          // Información del padre
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¡Hola, Luis! 👋',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Seguimiento diario de tus hijos',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          
          // Selector de hijos mejorado
          SelectorHijos(
            selectedChildId: selectedChildId,
            onChildSelected: onChildSelected,
          ),
        ],
      ),
    );
  }
}
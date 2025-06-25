import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/mock_data.dart';
import 'package:prueba_tecnica/models/hijo.dart';

class SelectorHijos extends StatelessWidget {
  final int? selectedChildId;
  final Function(int?) onChildSelected;

  const SelectorHijos({
    super.key,
    required this.selectedChildId,
    required this.onChildSelected,
  });

  String _getSelectedChildName() {
    if (selectedChildId == null || selectedChildId == -1) {
      return 'Todos';
    }
    final child = MockData.children.firstWhere(
      (child) => child.id == selectedChildId,
    );
    return child.nombre;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: (int value) {
        final childId = value == -1 ? null : value;
        onChildSelected(childId);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.people_outline, size: 18, color: Colors.white),
            SizedBox(width: 6),
            Text(
              _getSelectedChildName(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
          ],
        ),
      ),
      itemBuilder: (BuildContext context) {
        List<PopupMenuEntry<int>> items = [
          PopupMenuItem<int>(
            value: -1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: (selectedChildId == null || selectedChildId == -1)
                          ? Colors.blue.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.people_outline,
                      size: 20,
                      color: (selectedChildId == null || selectedChildId == -1)
                          ? Colors.blue
                          : Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Todos los niños',
                      style: TextStyle(
                        fontWeight: (selectedChildId == null || selectedChildId == -1)
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: (selectedChildId == null || selectedChildId == -1)
                            ? Colors.blue
                            : Colors.black87,
                      ),
                    ),
                  ),
                  if (selectedChildId == null || selectedChildId == -1)
                    Icon(Icons.check_circle, color: Colors.blue, size: 20),
                ],
              ),
            ),
          ),
          PopupMenuDivider(),
        ];

        for (Hijo child in MockData.children) {
          final isSelected = selectedChildId == child.id;
          items.add(
            PopupMenuItem<int>(
              value: child.id,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage(child.imagenUrl),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        child.nombre,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.blue : Colors.black87,
                        ),
                      ),
                    ),
                    if (isSelected)
                      Icon(Icons.check_circle, color: Colors.blue, size: 20),
                  ],
                ),
              ),
            ),
          );
        }

        return items;
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/mock_data.dart';

class MenuCategorias extends StatelessWidget {
  final int? selectedCategoryId;
  final Function(int?) onCategorySelected;

  const MenuCategorias({
    super.key,
    required this.selectedCategoryId,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Reducido de 140 a 120
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20),
        physics: BouncingScrollPhysics(),
        itemCount: MockData.categorias.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            final isSelected = selectedCategoryId == null;
            return Container(
              margin: EdgeInsets.only(right: 12), // Reducido de 18 a 12
              child: GestureDetector(
                onTap: () => onCategorySelected(null),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: 90, // Reducido de 120 a 90
                  padding: EdgeInsets.all(12), // Reducido de 20 a 12
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE)],
                          )
                        : null,
                    color: isSelected ? null : Colors.white,
                    borderRadius: BorderRadius.circular(20), // Reducido de 28 a 20
                    boxShadow: [
                      BoxShadow(
                        color: isSelected
                            ? Color(0xFF6C5CE7).withOpacity(0.3)
                            : Colors.grey.withOpacity(0.1),
                        blurRadius: isSelected ? 8 : 4, // Reducido
                        offset: Offset(0, isSelected ? 4 : 2), // Reducido
                      ),
                    ],
                    border: isSelected
                        ? null
                        : Border.all(color: Colors.grey[200]!),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8), // Reducido de 16 a 8
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white.withOpacity(0.2)
                              : Colors.grey[100],
                          borderRadius: BorderRadius.circular(12), // Reducido de 20 a 12
                        ),
                        child: Icon(
                          Icons.grid_view_rounded,
                          size: 24, // Reducido de 32 a 24
                          color: isSelected ? Colors.white : Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 6), // Reducido de 12 a 6
                      Flexible( // Añadido Flexible para evitar overflow
                        child: Text(
                          'Todos',
                          style: TextStyle(
                            fontSize: 12, // Reducido de 14 a 12
                            color: isSelected ? Colors.white : Colors.grey[700],
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          final categoria = MockData.categorias[index - 1];
          final isSelected = selectedCategoryId == categoria.id;

          return Container(
            margin: EdgeInsets.only(right: 12), // Reducido de 18 a 12
            child: GestureDetector(
              onTap: () => onCategorySelected(categoria.id),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 95, // Reducido de 130 a 95
                padding: EdgeInsets.all(12), // Reducido de 20 a 12
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            categoria.color,
                            categoria.color.withOpacity(0.8),
                          ],
                        )
                      : null,
                  color: isSelected ? null : Colors.white,
                  borderRadius: BorderRadius.circular(20), // Reducido de 28 a 20
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? categoria.color.withOpacity(0.3)
                          : Colors.grey.withOpacity(0.1),
                      blurRadius: isSelected ? 8 : 4, // Reducido
                      offset: Offset(0, isSelected ? 4 : 2), // Reducido
                    ),
                  ],
                  border: isSelected
                      ? null
                      : Border.all(color: Colors.grey[200]!),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8), // Reducido de 16 a 8
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white.withOpacity(0.2)
                            : categoria.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12), // Reducido de 20 a 12
                      ),
                      child: Icon(
                        _getCategoryIcon(categoria.nombre),
                        size: 24, // Reducido de 32 a 24
                        color: isSelected ? Colors.white : categoria.color,
                      ),
                    ),
                    SizedBox(height: 6), // Reducido de 12 a 6
                    Flexible( // Añadido Flexible para evitar overflow
                      child: Text(
                        categoria.nombre,
                        style: TextStyle(
                          fontSize: 11, // Reducido de 13 a 11
                          color: isSelected ? Colors.white : Colors.grey[700],
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
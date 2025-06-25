import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/mock_data.dart';
import 'package:prueba_tecnica/models/evento.dart';
import 'package:prueba_tecnica/widgets/header_personalizado.dart';
import 'package:prueba_tecnica/widgets/menu_categorias.dart';
import 'package:prueba_tecnica/widgets/carta_evento.dart';
import 'package:prueba_tecnica/widgets/seccionTitulo.dart';

class AgendaScreen extends StatefulWidget {
  const AgendaScreen({super.key});

  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  List<Evento> filteredEvents = [];
  int? selectedChildId = -1;
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _applyFilters();
  }

  void _filterEventsByChild(int? childId) {
    setState(() {
      selectedChildId = childId;
      _applyFilters();
    });
  }

  void _filterEventsByCategory(int? categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
      _applyFilters();
    });
  }

  void _applyFilters() {
    List<Evento> events = MockData.events;

    if (selectedChildId != null && selectedChildId != -1) {
      events = events.where((event) => event.hijoId == selectedChildId).toList();
    }

    if (selectedCategoryId != null) {
      events = events.where((event) => event.categoriaId == selectedCategoryId).toList();
    }

    filteredEvents = events;
  }

  String _getSelectedChildName() {
    if (selectedChildId == null || selectedChildId == -1) {
      return 'todos los niños';
    }
    final child = MockData.children.firstWhere((child) => child.id == selectedChildId);
    return child.nombre;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: Column(
        children: [
          // Header con gradiente
          HeaderPersonalizado(
            selectedChildId: selectedChildId,
            onChildSelected: _filterEventsByChild,
          ),
          
          // Sección de título
          SeccionTitulo(
            eventCount: filteredEvents.length,
            selectedChildName: _getSelectedChildName(),
          ),
          
          // Menú de categorías
          MenuCategorias(
            selectedCategoryId: selectedCategoryId,
            onCategorySelected: _filterEventsByCategory,
          ),
          
          SizedBox(height: 8),
          
          // Lista de eventos
          Expanded(
            child: filteredEvents.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: 20),
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      final event = filteredEvents[index];
                      
                      final child = MockData.children.firstWhere(
                        (child) => child.id == event.hijoId,
                        orElse: () => MockData.children.first,
                      );
                      
                      final categoria = MockData.categorias.firstWhere(
                        (cat) => cat.id == event.categoriaId,
                      );

                      return CartaEvento(
                        evento: event,
                        hijo: child,
                        categoria: categoria,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.event_note_rounded,
              size: 64,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'No hay eventos',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'No se encontraron eventos para\nlos filtros seleccionados',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
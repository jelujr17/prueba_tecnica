import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/categoria.dart';

import '../models/hijo.dart';
import '../models/evento.dart';

class MockData {
  static List<Hijo> children = [
    Hijo(
      id: 1,
      nombre: 'Lucía',
      imagenUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    ),
    Hijo(
      id: 2,
      nombre: 'Carlos',
      imagenUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
    ),
    Hijo(
      id: 3,
      nombre: 'Emma',
      imagenUrl: 'https://randomuser.me/api/portraits/women/3.jpg',
    ),
    Hijo(
      id: 4,
      nombre: 'Diego',
      imagenUrl: 'https://randomuser.me/api/portraits/men/4.jpg',
    ),
    Hijo(
      id: 5,
      nombre: 'Sofia',
      imagenUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
    ),
    Hijo(
      id: 6,
      nombre: 'Mateo',
      imagenUrl: 'https://randomuser.me/api/portraits/men/6.jpg',
    ),
    Hijo(
      id: 7,
      nombre: 'Valentina',
      imagenUrl: 'https://randomuser.me/api/portraits/women/7.jpg',
    ),
    Hijo(
      id: 8,
      nombre: 'Santiago',
      imagenUrl: 'https://randomuser.me/api/portraits/men/8.jpg',
    ),
    Hijo(
      id: 9,
      nombre: 'Isabella',
      imagenUrl: 'https://randomuser.me/api/portraits/women/9.jpg',
    ),
    Hijo(
      id: 10,
      nombre: 'Alejandro',
      imagenUrl: 'https://randomuser.me/api/portraits/men/10.jpg',
    ),
  ];

  static List<Categoria> categorias = [
    Categoria(id: 1, nombre: "Alimentacion", color: Colors.green),
    Categoria(id: 2, nombre: "Actividades", color: Colors.blue),
    Categoria(id: 3, nombre: "Siestas", color: Colors.orange),
    Categoria(id: 4, nombre: "Higiene", color: Colors.purple),
  ];

  static List<Evento> events = [
    // Eventos de Lucía (id: 1)
    Evento(
      id: 1,
      hijoId: 1,
      categoriaId: 1,
      descripcion: 'Desayunó leche con cereales',
      hora: '08:30',
    ),
    Evento(
      id: 2,
      hijoId: 1,
      categoriaId: 2,
      descripcion: 'Pintó con témperas',
      hora: '10:00',
    ),
    Evento(
      id: 3,
      hijoId: 1,
      categoriaId: 3,
      descripcion: 'Siesta de la mañana - 45 minutos',
      hora: '11:30',
    ),
    Evento(
      id: 4,
      hijoId: 1,
      categoriaId: 1,
      descripcion: 'Almorzó pollo con arroz',
      hora: '12:30',
    ),

    // Eventos de Carlos (id: 2)
    Evento(
      id: 5,
      hijoId: 2,
      categoriaId: 3,
      descripcion: 'Durmió 1 hora',
      hora: '12:00',
    ),
    Evento(
      id: 6,
      hijoId: 2,
      categoriaId: 1,
      descripcion: 'Comió puré de verduras',
      hora: '13:00',
    ),
    Evento(
      id: 7,
      hijoId: 2,
      categoriaId: 2,
      descripcion: 'Jugó con bloques de construcción',
      hora: '14:00',
    ),
    Evento(
      id: 8,
      hijoId: 2,
      categoriaId: 4,
      descripcion: 'Cambio de pañal',
      hora: '15:30',
    ),

    // Eventos de Emma (id: 3)
    Evento(
      id: 9,
      hijoId: 3,
      categoriaId: 1,
      descripcion: 'Desayunó yogur con frutas',
      hora: '08:45',
    ),
    Evento(
      id: 10,
      hijoId: 3,
      categoriaId: 2,
      descripcion: 'Tiempo de lectura - cuentos',
      hora: '09:30',
    ),
    Evento(
      id: 11,
      hijoId: 3,
      categoriaId: 2,
      descripcion: 'Jugó en el patio exterior',
      hora: '10:30',
    ),
    Evento(
      id: 12,
      hijoId: 3,
      categoriaId: 4,
      descripcion: 'Lavado de manos y cara',
      hora: '11:00',
    ),

    // Eventos de Diego (id: 4)
    Evento(
      id: 13,
      hijoId: 4,
      categoriaId: 1,
      descripcion: 'Desayunó tostadas con mermelada',
      hora: '08:15',
    ),
    Evento(
      id: 14,
      hijoId: 4,
      categoriaId: 2,
      descripcion: 'Clase de música - instrumentos',
      hora: '09:00',
    ),
    Evento(
      id: 15,
      hijoId: 4,
      categoriaId: 3,
      descripcion: 'Descanso corto - 30 minutos',
      hora: '11:00',
    ),
    Evento(
      id: 16,
      hijoId: 4,
      categoriaId: 1,
      descripcion: 'Merienda - galletas y leche',
      hora: '15:00',
    ),

    // Eventos de Sofia (id: 5)
    Evento(
      id: 17,
      hijoId: 5,
      categoriaId: 4,
      descripcion: 'Cambio de ropa - actividad artística',
      hora: '09:15',
    ),
    Evento(
      id: 18,
      hijoId: 5,
      categoriaId: 2,
      descripcion: 'Modelado con plastilina',
      hora: '09:45',
    ),
    Evento(
      id: 19,
      hijoId: 5,
      categoriaId: 1,
      descripcion: 'Almorzó pasta con salsa de tomate',
      hora: '12:15',
    ),
    Evento(
      id: 20,
      hijoId: 5,
      categoriaId: 3,
      descripcion: 'Siesta de la tarde - 1.5 horas',
      hora: '13:30',
    ),

    // Eventos de Mateo (id: 6)
    Evento(
      id: 21,
      hijoId: 6,
      categoriaId: 1,
      descripcion: 'Desayunó papilla de avena',
      hora: '08:00',
    ),
    Evento(
      id: 22,
      hijoId: 6,
      categoriaId: 2,
      descripcion: 'Gateo y exploración sensorial',
      hora: '09:30',
    ),
    Evento(
      id: 23,
      hijoId: 6,
      categoriaId: 4,
      descripcion: 'Cambio de pañal y limpieza',
      hora: '10:15',
    ),
    Evento(
      id: 24,
      hijoId: 6,
      categoriaId: 3,
      descripcion: 'Siesta matutina - 2 horas',
      hora: '10:30',
    ),
    Evento(
      id: 25,
      hijoId: 6,
      categoriaId: 1,
      descripcion: 'Comió puré de frutas',
      hora: '14:00',
    ),

    // Eventos de Valentina (id: 7)
    Evento(
      id: 26,
      hijoId: 7,
      categoriaId: 1,
      descripcion: 'Desayunó cereales con leche',
      hora: '08:20',
    ),
    Evento(
      id: 27,
      hijoId: 7,
      categoriaId: 2,
      descripcion: 'Dibujó con crayones',
      hora: '09:15',
    ),
    Evento(
      id: 28,
      hijoId: 7,
      categoriaId: 4,
      descripcion: 'Cepillado de dientes',
      hora: '10:00',
    ),
    Evento(
      id: 29,
      hijoId: 7,
      categoriaId: 3,
      descripcion: 'Siesta corta - 1 hora',
      hora: '11:45',
    ),

    // Eventos de Santiago (id: 8)
    Evento(
      id: 30,
      hijoId: 8,
      categoriaId: 1,
      descripcion: 'Desayunó panqueques',
      hora: '08:10',
    ),
    Evento(
      id: 31,
      hijoId: 8,
      categoriaId: 2,
      descripcion: 'Juegos de construcción',
      hora: '09:45',
    ),
    Evento(
      id: 32,
      hijoId: 8,
      categoriaId: 1,
      descripcion: 'Merienda de media mañana',
      hora: '10:30',
    ),
    Evento(
      id: 33,
      hijoId: 8,
      categoriaId: 4,
      descripcion: 'Lavado de cara y manos',
      hora: '11:15',
    ),

    // Eventos de Isabella (id: 9)
    Evento(
      id: 34,
      hijoId: 9,
      categoriaId: 1,
      descripcion: 'Desayunó avena con frutas',
      hora: '08:25',
    ),
    Evento(
      id: 35,
      hijoId: 9,
      categoriaId: 2,
      descripcion: 'Baile y movimiento',
      hora: '09:20',
    ),
    Evento(
      id: 36,
      hijoId: 9,
      categoriaId: 3,
      descripcion: 'Descanso tranquilo - 45 min',
      hora: '11:20',
    ),
    Evento(
      id: 37,
      hijoId: 9,
      categoriaId: 1,
      descripcion: 'Almuerzo completo',
      hora: '12:45',
    ),

    // Eventos de Alejandro (id: 10)
    Evento(
      id: 38,
      hijoId: 10,
      categoriaId: 1,
      descripcion: 'Desayunó tostadas francesas',
      hora: '08:05',
    ),
    Evento(
      id: 39,
      hijoId: 10,
      categoriaId: 2,
      descripcion: 'Experimentos con agua',
      hora: '09:10',
    ),
    Evento(
      id: 40,
      hijoId: 10,
      categoriaId: 4,
      descripcion: 'Cambio de ropa completo',
      hora: '10:45',
    ),
    Evento(
      id: 41,
      hijoId: 10,
      categoriaId: 3,
      descripcion: 'Siesta reparadora - 1.5 horas',
      hora: '13:15',
    ),
  ];
}

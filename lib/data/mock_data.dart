import 'package:flutter/material.dart';
import 'package:prueba_tecnica/models/categoria.dart';

import '../models/hijo.dart';
import '../models/evento.dart';

class MockData {
  static List<Hijo> children = [
    Hijo(
      id: 1,
      nombre: 'Lucía',
      imagenUrl: 'https://robohash.org/Lucia?set=set4&size=200x200',
    ),
    Hijo(
      id: 2,
      nombre: 'Carlos',
      imagenUrl: 'https://robohash.org/Carlos?set=set4&size=200x200',
    ),
    Hijo(
      id: 3,
      nombre: 'Emma',
      imagenUrl: 'https://robohash.org/Emma?set=set4&size=200x200',
    ),
    Hijo(
      id: 4,
      nombre: 'Diego',
      imagenUrl: 'https://robohash.org/Diego?set=set4&size=200x200',
    ),
    Hijo(
      id: 5,
      nombre: 'Sofia',
      imagenUrl: 'https://robohash.org/Sofia?set=set4&size=200x200',
    ),
    Hijo(
      id: 6,
      nombre: 'Mateo',
      imagenUrl: 'https://robohash.org/Mateo?set=set4&size=200x200',
    ),
    Hijo(
      id: 7,
      nombre: 'Valentina',
      imagenUrl: 'https://robohash.org/Valentina?set=set4&size=200x200',
    ),
    Hijo(
      id: 8,
      nombre: 'Santiago',
      imagenUrl: 'https://robohash.org/Santiago?set=set4&size=200x200',
    ),
    Hijo(
      id: 9,
      nombre: 'Isabella',
      imagenUrl: 'https://robohash.org/Isabella?set=set4&size=200x200',
    ),
    Hijo(
      id: 10,
      nombre: 'Alejandro',
      imagenUrl: 'https://robohash.org/Alejandro?set=set4&size=200x200',
    ),
  ];

  static List<Categoria> categorias = [
    Categoria(id: 1, nombre: "Alimentacion", color: Colors.green),
    Categoria(id: 2, nombre: "Actividades", color: Colors.blue),
    Categoria(id: 3, nombre: "Siestas", color: Colors.orange),
    Categoria(id: 4, nombre: "Higiene", color: Colors.purple),
  ];

  static List<Evento> events = [
    // Eventos para Lucía (id: 1)
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
      descripcion: 'Jugó con bloques de construcción',
      hora: '10:15',
    ),
    Evento(
      id: 3,
      hijoId: 1,
      categoriaId: 3,
      descripcion: 'Siesta de la mañana',
      hora: '11:30',
    ),
    Evento(
      id: 4,
      hijoId: 1,
      categoriaId: 1,
      descripcion: 'Almorzó puré de verduras y pollo',
      hora: '12:45',
    ),
    Evento(
      id: 5,
      hijoId: 1,
      categoriaId: 4,
      descripcion: 'Cambio de pañal',
      hora: '13:15',
    ),

    // Eventos para Carlos (id: 2)
    Evento(
      id: 6,
      hijoId: 2,
      categoriaId: 1,
      descripcion: 'Desayunó tostadas con mermelada',
      hora: '08:45',
    ),
    Evento(
      id: 7,
      hijoId: 2,
      categoriaId: 2,
      descripcion: 'Pintó con acuarelas',
      hora: '10:30',
    ),
    Evento(
      id: 8,
      hijoId: 2,
      categoriaId: 4,
      descripcion: 'Lavado de manos y cara',
      hora: '11:00',
    ),
    Evento(
      id: 9,
      hijoId: 2,
      categoriaId: 1,
      descripcion: 'Merienda: yogur y fruta',
      hora: '11:45',
    ),
    Evento(
      id: 10,
      hijoId: 2,
      categoriaId: 3,
      descripcion: 'Descanso en la colchoneta',
      hora: '14:00',
    ),

    // Eventos para Emma (id: 3)
    Evento(
      id: 11,
      hijoId: 3,
      categoriaId: 1,
      descripcion: 'Bebió biberón de leche',
      hora: '09:00',
    ),
    Evento(
      id: 12,
      hijoId: 3,
      categoriaId: 2,
      descripcion: 'Exploró juguetes sensoriales',
      hora: '10:45',
    ),
    Evento(
      id: 13,
      hijoId: 3,
      categoriaId: 4,
      descripcion: 'Cambio de ropa después del almuerzo',
      hora: '13:30',
    ),
    Evento(
      id: 14,
      hijoId: 3,
      categoriaId: 3,
      descripcion: 'Siesta larga de 2 horas',
      hora: '15:00',
    ),

    // Eventos para Diego (id: 4)
    Evento(
      id: 15,
      hijoId: 4,
      categoriaId: 2,
      descripcion: 'Corrió en el patio',
      hora: '09:30',
    ),
    Evento(
      id: 16,
      hijoId: 4,
      categoriaId: 1,
      descripcion: 'Desayunó frutas variadas',
      hora: '10:00',
    ),
    Evento(
      id: 17,
      hijoId: 4,
      categoriaId: 4,
      descripcion: 'Cepillado de dientes',
      hora: '12:30',
    ),
    Evento(
      id: 18,
      hijoId: 4,
      categoriaId: 2,
      descripcion: 'Jugó al fútbol',
      hora: '16:30',
    ),

    // Eventos para Sofia (id: 5)
    Evento(
      id: 19,
      hijoId: 5,
      categoriaId: 1,
      descripcion: 'Almorzó pasta con salsa de tomate',
      hora: '13:00',
    ),
    Evento(
      id: 20,
      hijoId: 5,
      categoriaId: 2,
      descripcion: 'Leyó cuentos ilustrados',
      hora: '14:30',
    ),
    Evento(
      id: 21,
      hijoId: 5,
      categoriaId: 4,
      descripcion: 'Baño completo',
      hora: '17:00',
    ),

    // Eventos para Mateo (id: 6)
    Evento(
      id: 22,
      hijoId: 6,
      categoriaId: 1,
      descripcion: 'Merienda de galletas y leche',
      hora: '16:00',
    ),
    Evento(
      id: 23,
      hijoId: 6,
      categoriaId: 2,
      descripcion: 'Armó rompecabezas',
      hora: '11:15',
    ),
    Evento(
      id: 24,
      hijoId: 6,
      categoriaId: 3,
      descripcion: 'Descanso breve',
      hora: '15:30',
    ),

    // Eventos para Valentina (id: 7)
    Evento(
      id: 25,
      hijoId: 7,
      categoriaId: 2,
      descripcion: 'Cantó canciones infantiles',
      hora: '10:00',
    ),
    Evento(
      id: 26,
      hijoId: 7,
      categoriaId: 1,
      descripcion: 'Probó nuevos sabores de comida',
      hora: '12:15',
    ),
    Evento(
      id: 27,
      hijoId: 7,
      categoriaId: 4,
      descripcion: 'Limpieza nasal',
      hora: '14:45',
    ),

    // Eventos para Santiago (id: 8)
    Evento(
      id: 28,
      hijoId: 8,
      categoriaId: 2,
      descripcion: 'Jugó con arena kinética',
      hora: '11:00',
    ),
    Evento(
      id: 29,
      hijoId: 8,
      categoriaId: 1,
      descripcion: 'Bebió mucha agua durante el día',
      hora: '15:45',
    ),
    Evento(
      id: 30,
      hijoId: 8,
      categoriaId: 3,
      descripcion: 'Siesta reparadora',
      hora: '13:45',
    ),

    // Eventos para Isabella (id: 9)
    Evento(
      id: 31,
      hijoId: 9,
      categoriaId: 1,
      descripcion: 'Comió vegetales cortados en bastones',
      hora: '12:00',
    ),
    Evento(
      id: 32,
      hijoId: 9,
      categoriaId: 2,
      descripcion: 'Bailó música clásica',
      hora: '16:15',
    ),
    Evento(
      id: 33,
      hijoId: 9,
      categoriaId: 4,
      descripcion: 'Aplicación de crema hidratante',
      hora: '17:30',
    ),

    // Eventos para Alejandro (id: 10)
    Evento(
      id: 34,
      hijoId: 10,
      categoriaId: 2,
      descripcion: 'Construyó torres con cubos',
      hora: '09:45',
    ),
    Evento(
      id: 35,
      hijoId: 10,
      categoriaId: 1,
      descripcion: 'Snack saludable de frutas secas',
      hora: '15:15',
    ),
    Evento(
      id: 36,
      hijoId: 10,
      categoriaId: 3,
      descripcion: 'Momento de relajación',
      hora: '14:15',
    ),
  ];
}

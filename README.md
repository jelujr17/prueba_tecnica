# Prueba Técnica - Agenda Guardería

Una aplicación Flutter para el seguimiento diario de actividades en una guardería.

## 🏗️ Arquitectura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── screens/
│   └── agenda_screen.dart    # Pantalla principal de la agenda
├── widgets/                  # Componentes reutilizables
│   ├── carta_evento.dart
│   ├── header_personalizado.dart
│   ├── menu_categorias.dart
│   ├── seccionTitulo.dart
│   └── selector_hijos.dart
├── models/                   # Modelos de datos
│   ├── categoria.dart
│   ├── evento.dart
│   └── hijo.dart
├── data/
│   └── mock_data.dart        # Datos de prueba
└── utils/
    └── filters.dart          # Utilidades de filtrado
```

## 🧪 Suite de Testing Completa

Este proyecto incluye una suite de testing exhaustiva que garantiza la calidad y estabilidad de la aplicación. Los tests están organizados en diferentes categorías para cubrir todos los aspectos críticos del sistema.

### 📋 Estructura de Tests

```
test/
├── widget_test.dart              # Tests de UI y componentes
└── logic/
    ├── data_validation_test.dart # Validación de integridad de datos
    ├── filters_logic_test.dart   # Lógica de filtrado
    └── time_utils_test.dart      # Utilidades de tiempo
```

---

## 🎨 Tests de UI y Componentes (`widget_test.dart`)

### **Propósito**: Verificar que la interfaz de usuario funciona correctamente y los componentes se renderizan sin errores.

#### **🏠 Tests de Componentes UI**
- **`AgendaScreen se renderiza correctamente`**
  - ✅ Verifica que la pantalla principal carga sin errores
  - ✅ Confirma que todos los elementos básicos están presentes
  - ✅ Valida que los textos principales se muestran correctamente

- **`MenuCategorias muestra todas las categorías`**
  - ✅ Asegura que todas las categorías se renderizan
  - ✅ Verifica la presencia de cada categoría individual
  - ✅ Confirma que el componente maneja el estado correctamente

#### **🔄 Tests de Interacción**
- **`MenuCategorias responde a taps`**
  - ✅ Verifica que los botones responden a las interacciones del usuario
  - ✅ Confirma que el estado se actualiza correctamente
  - ✅ Asegura que no hay errores durante la navegación

#### **📊 Tests de Validación de Datos**
- **`Datos de MockData son consistentes`**
  - ✅ Verifica la integridad referencial entre eventos, hijos y categorías
  - ✅ Confirma que no hay referencias rotas
  - ✅ Valida que todos los datos requeridos están presentes

- **`Cada evento tiene datos válidos`**
  - ✅ Verifica formato de horas (HH:MM)
  - ✅ Confirma que las descripciones no están vacías
  - ✅ Valida que los IDs son positivos

**Por qué estos tests**: Los tests de UI son cruciales para asegurar que la aplicación es usable y que los usuarios pueden interactuar con ella sin problemas. Detectan problemas de renderizado y errores de estado tempranamente.

---

## 📊 Tests de Validación de Datos (`data_validation_test.dart`)

### **Propósito**: Garantizar la integridad, consistencia y validez de todos los datos utilizados en la aplicación.

#### **🎯 Validación de Eventos**
- **`Eventos tienen IDs únicos`**
  - ✅ Previene duplicados que podrían causar conflictos
  - ✅ Asegura la integridad de la base de datos

- **`Eventos tienen horas válidas en formato HH:MM`**
  - ✅ Valida formato de tiempo con regex
  - ✅ Previene errores de parsing de fechas
  - ✅ Asegura compatibilidad con componentes de tiempo

- **`Eventos hacen referencia a hijos/categorías existentes`**
  - ✅ Mantiene la integridad referencial
  - ✅ Previene errores de datos huérfanos
  - ✅ Asegura que la UI puede mostrar toda la información

#### **👶 Validación de Hijos**
- **`Hijos tienen URLs de imagen válidas`**
  - ✅ Verifica formato HTTP/HTTPS
  - ✅ Previene errores de carga de imágenes
  - ✅ Asegura que los avatares se pueden mostrar

- **`No hay nombres de hijos duplicados`**
  - ✅ Mejora la experiencia de usuario
  - ✅ Previene confusión en la interfaz

#### **🏷️ Validación de Categorías**
- **`Categorías básicas están presentes`**
  - ✅ Verifica que existen: Alimentación, Actividades, Siestas, Higiene
  - ✅ Asegura funcionalidad completa de la aplicación
  - ✅ Valida que el filtrado funcionará correctamente

#### **🔗 Integridad Relacional**
- **`Cada hijo tiene al menos un evento`**
  - ✅ Asegura que todos los niños aparecen en la interfaz
  - ✅ Previene listas vacías en el filtrado

- **`Distribución equilibrada de eventos por hijo`**
  - ✅ Detecta desequilibrios en los datos de prueba
  - ✅ Asegura que el testing cubre casos reales

**Por qué estos tests**: La validación de datos es fundamental para prevenir errores en runtime y asegurar que la aplicación puede manejar los datos correctamente. Estos tests actúan como una barrera de seguridad contra datos corruptos o inconsistentes.

---

## 🔍 Tests de Lógica de Filtrado (`filters_logic_test.dart`)

### **Propósito**: Verificar que toda la lógica de filtrado funciona correctamente bajo diferentes condiciones y casos edge.

#### **👶 Filtrado por Hijo**
- **`Filtra correctamente eventos por hijo específico`**
  - ✅ Verifica que solo se muestran eventos del hijo seleccionado
  - ✅ Confirma que el conteo es correcto
  - ✅ Valida que los IDs son los esperados

- **`Devuelve lista vacía para hijo inexistente`**
  - ✅ Manejo correcto de casos edge
  - ✅ Previene errores cuando no hay datos

#### **🏷️ Filtrado por Categoría**
- **`Filtra eventos de alimentación/actividades/siestas/higiene`**
  - ✅ Verifica cada tipo de categoría individualmente
  - ✅ Confirma que el filtrado es específico y correcto
  - ✅ Valida que las descripciones corresponden a la categoría

#### **🔀 Filtrado Combinado**
- **`Filtra por hijo y categoría simultáneamente`**
  - ✅ Verifica intersección correcta de filtros
  - ✅ Maneja casos donde no hay coincidencias
  - ✅ Asegura que la lógica AND funciona correctamente

#### **🔍 Búsqueda por Texto**
- **`Busca eventos por descripción (case-insensitive)`**
  - ✅ Implementa búsqueda flexible para usuarios
  - ✅ Maneja diferentes casos de texto
  - ✅ Proporciona funcionalidad de búsqueda robusta

#### **⏰ Filtrado por Tiempo**
- **`Filtra eventos por rango de tiempo`**
  - ✅ Permite filtrar por horarios específicos
  - ✅ Maneja rangos de inicio y fin
  - ✅ Útil para vistas de horarios específicos

**Por qué estos tests**: El filtrado es una funcionalidad core de la aplicación. Los usuarios dependen de estos filtros para encontrar información específica rápidamente. Cualquier bug en el filtrado afectaría directamente la experiencia del usuario.

---

## ⏰ Tests de Utilidades de Tiempo (`time_utils_test.dart`)

### **Propósito**: Asegurar que todas las operaciones relacionadas con tiempo funcionan correctamente, ya que son críticas para una aplicación de horarios.

#### **🔄 Conversión de Tiempo**
- **`Convierte tiempo a minutos y viceversa`**
  - ✅ Fundamental para comparaciones y cálculos
  - ✅ Maneja diferentes formatos de entrada
  - ✅ Valida rangos correctos (0-1439 minutos)

#### **⚖️ Comparación de Horas**
- **`Compara horas correctamente`**
  - ✅ Esencial para ordenamiento de eventos
  - ✅ Maneja diferentes formatos de hora
  - ✅ Proporciona comparación consistente

#### **📊 Categorización por Período**
- **`Categoriza en Mañana/Tarde/Noche`**
  - ✅ Útil para agrupar eventos por período del día
  - ✅ Proporciona contexto temporal a los usuarios
  - ✅ Ayuda en la organización visual de eventos

#### **🎯 Verificación de Rangos**
- **`Verifica si hora está en rango específico`**
  - ✅ Maneja casos complejos como cruce de medianoche
  - ✅ Útil para filtros avanzados de tiempo
  - ✅ Soporte para horarios de guardería

#### **📏 Cálculo de Diferencias**
- **`Calcula diferencia en minutos entre horas`**
  - ✅ Útil para duración de actividades
  - ✅ Maneja casos de cruce de día
  - ✅ Proporciona métricas de tiempo

**Por qué estos tests**: Las operaciones de tiempo son notoriamente propensas a errores (zonas horarias, formatos, rangos). En una aplicación de guardería donde los horarios son críticos, estos tests previenen errores costosos y confusión en los horarios.

---

## 🎯 Beneficios de esta Suite de Testing

### **🛡️ Cobertura Integral**
- **UI Testing**: Asegura que la interfaz funciona correctamente
- **Data Validation**: Garantiza integridad de datos
- **Business Logic**: Verifica que las reglas de negocio funcionan
- **Utility Functions**: Valida funciones de soporte críticas

### **🚀 Calidad del Código**
- **Detección Temprana**: Los bugs se encuentran antes de llegar a producción
- **Refactoring Seguro**: Los tests permiten cambios con confianza
- **Documentación Viva**: Los tests sirven como documentación del comportamiento esperado

### **⚡ Desarrollo Eficiente**
- **Desarrollo TDD**: Los tests guían el desarrollo
- **Debugging Rápido**: Los tests ayudan a localizar problemas específicos
- **Integración Continua**: Permiten automatización de testing

### **👥 Experiencia del Usuario**
- **Estabilidad**: Menos crashes y errores en producción
- **Consistencia**: Comportamiento predecible de la aplicación
- **Confiabilidad**: Los usuarios pueden confiar en que la app funciona correctamente

---

## 🚀 Ejecutar los Tests

```bash
# Ejecutar todos los tests
flutter test

# Ejecutar tests específicos
flutter test test/widget_test.dart
flutter test test/logic/data_validation_test.dart
flutter test test/logic/filters_logic_test.dart
flutter test test/logic/time_utils_test.dart

# Ejecutar tests con coverage
flutter test --coverage

# Ejecutar tests en modo verbose
flutter test --verbose
```

## 📊 Cobertura de Testing

- **UI Components**: 100% de widgets principales testeados
- **Data Models**: Validación completa de integridad
- **Business Logic**: Cobertura de todos los casos de filtrado
- **Utilities**: Testing exhaustivo de funciones de tiempo

---

## 🛠️ Getting Started

This project is a starting point for a Flutter application with comprehensive testing.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Testing Flutter apps](https://docs.flutter.dev/testing)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
![Kotlin](https://img.shields.io/badge/Flutter-3.29-blue.svg?style=flat-square)

<h1 align="center">
    InheritedWidget Theme Toggle Example
</h1>

Este es un ejemplo simple de una aplicación Flutter que muestra cómo usar `InheritedWidget` para compartir el estado del tema (claro/oscuro) entre widgets. Al presionar un botón, el tema de la aplicación cambiará dinámicamente.

<p align="center">
  <a href="#tópicos">Tópicos</a> •
  <a href="#tecnologías">Tecnologías</a> •
  <a href="#consideraciones">Consideraciones</a> •
  <a href="#demostración">Demostración</a> •
  <a href="#instalación">Instalación</a> •
  <a href="#autor">Autor</a>
</p>

## Tópicos

* Flutter
* Inherited Widgets

## Tecnologías

### Este proyecto requiere:
- [Flutter] version 3.29+

## Consideraciones

### ¿Qué es un `InheritedWidget`?

`InheritedWidget` no es más que una clase abstracta que nos permite definir widgets. Estos widgets son un poco diferentes a los que estamos acostumbrados a crear normalmente; su principal objetivo es propagar información entre los demás componentes que conforman la interfaz de usuario, sin importar qué tan lejos estén el uno del otro. A la estructura de widgets que conforman las vistas de nuestras aplicaciones se le conoce como árbol de widgets. 

Usar `InheritedWidget` es una de las formas más básicas (y poderosas) de compartir datos en Flutter. Aunque no es la opción más sencilla para aplicaciones grandes, es perfecta para aprender cómo funciona el árbol de widgets y cómo fluye la información dentro de él.

### Características de la aplicación

- Cambia entre tema claro y oscuro con un solo botón.
- Implementación básica usando `InheritedWidget`.
- Ideal para entender cómo funciona el paso de datos sin usar librerías externas como Provider o Riverpod.

### Estructura
```bash
.
├── home_screen.dart # Interfaz de usuario de la vista principal
├── theme_toggle.dart # Implementación de InheritedWidget para gestionar tema de la app
└── main.dart # Clase principal
```

### Casos de uso

A continuación se mencionan algunos casos de uso en los que podriamos utilizar InheritedWidgets:

- **Propagación de estado o datos globales:** Los InheritedWidgets pueden ser usados para compartir datos o configuraciones que deben estar disponibles para muchos widgets hijos sin necesidad de pasarlos manualmente a través de constructores. Por ejemplo, cuando usamos `Theme.of(context)` para acceder al tema de la app o `MediaQuery.of(context)` para obtener las dimensiones de la pantalla.
- **Gestión de dependencias:** En muchas ocasiones, los InheritedWidgets pueden ser usados para proveer clases que no cambian muy seguido. Este enfoque te puede permitir utilizarlo como inyector de dependencias para tu aplicación. Por ejemplo, cuando usamos `RepositoryProvider` de la librería `flutter_bloc` para inyectar el repositorio de la capa de datos, y luego obtenerlo a través del contexto al instanciar el Bloc que lo necesite.
- **Optimización de renderizado:** Se puede utilizar para hacer que solo los widgets que realmente usan los datos proporcionados por el InheritedWidget se reconstruyan cuando esos datos cambian. De esta forma, evitamos reconstrucciones innecesarias de widgets dentro de la aplicación.

### Implementación básica
Para crear un widget que sea capaz de compartir datos con otros widgets a través del árbol, debemos crear una clase que herede de InheritedWidget e implementar el método `updateShouldNotify()`. Este método le indicará a Flutter cuándo debe notificar a los widgets que estén escuchando la información de nuestro InheritedWidget. Además, tendremos que agregar el método `of()`, que recibe un `BuildContext` como parámetro y tiene dos objetivos principales. El primero es buscar en el árbol de widgets al InheritedWidget más cercano del tipo que hayamos definido. El segundo es marcar a los widgets que invoquen a la función `of()` como dependientes del InheritedWidget en cuestión; en pocas palabras, hace que los widgets hijos escuchen los cambios que se produzcan en el InheritedWidget, para luego poder reaccionar a ellos. 

A continuación, tienes el ejemplo utilizado en este proyecto para cambiar el tema de una aplicación:

```dart
class ThemeToggle extends InheritedWidget {
  const ThemeToggle({
    super.key,
    required this.isDark,
    required this.changeTheme,
    required super.child,
  });

  final bool isDark;
  final VoidCallback changeTheme;

  static ThemeToggle? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeToggle>();
  }

  static ThemeToggle of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeToggle>();
    assert(result != null, 'No ThemeToggle found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeToggle oldWidget) => isDark != oldWidget.isDark;
}
```

La implementación del método `of()` es muy simple, pero puede que hayas notado que utiliza un método poco común, ese es el método `dependOnInheritedWidgetOfExactType<T>()`. Dicho método es el encargado de buscar en el árbol de widgets al InheritedWidget más cercano, así como también se encarga de marcar al componente que lo invoca como dependiente de la información que tenga el InheritedWidget.

**Nota:** Si deseas profundizar un poco mas sobre los InheritedWidgets, aquí tienes la [documentación oficial](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html).

### Diagrama de la solución
<p align="center">
  <img src="https://github.com/user-attachments/assets/eeb5acba-2ed2-408b-ae8f-6fba49e6090f"/>
</p>

## Demostración
<p align="center">
    <img src="https://github.com/user-attachments/assets/7e5be666-13fd-4910-9543-bc65bb2896e6" alt="InheritedWidget Example" width="300"> 
</p>

## Instalación

1. Clona este repositorio:
     ```bash
     git clone https://github.com/chrisr04/inherited_widget_example.git
     cd inherited_widget_example
    ```

2. Ejecuta el siguiente comando:
     ```bash
     flutter pub get
     flutter run
    ```

## Autor

| [<img src="https://github.com/chrisr04.png" width=115><br><sub>Christian Rodriguez</sub>](https://github.com/chrisr04) | 
|:----------------------------------------------------------------------------------------------------:

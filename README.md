![Kotlin](https://img.shields.io/badge/Flutter-3.29-blue.svg?style=flat-square)

<h1 align="center">
    InheritedWidget Theme Toggle Example
</h1>

<p align="center">
  <a href="#tópicos">Tópicos</a> •
  <a href="#tecnologías">Tecnologías</a> •
  <a href="#consideraciones">Consideraciones</a> •
  <a href="#demostración">Demostración</a> •
  <a href="#instalación">Instalación</a> •
  <a href="#autor">Autor</a> •
  <a href="#aprende-más">Aprende más</a>
</p>

## Tópicos

* Flutter
* Inherited Widgets

## Tecnologías
### Este proyecto requiere:
- [Flutter] version 3.29+

## Consideraciones

Este es un ejemplo simple de una aplicación Flutter que muestra cómo usar `InheritedWidget` para compartir el estado del tema (claro/oscuro) entre widgets. Al presionar un botón, el tema de la aplicación cambiará dinámicamente.

### Características

- Cambia entre tema claro y oscuro con un solo botón.
- Implementación básica usando `InheritedWidget`.
- Ideal para entender cómo funciona el paso de datos sin usar librerías externas como Provider o Riverpod.

### ¿Por qué `InheritedWidget`?

`InheritedWidget` es una de las formas más básicas (y poderosas) de compartir datos en Flutter. Aunque no es la opción más sencilla para apps grandes, es perfecta para aprender cómo funciona el árbol de widgets y cómo fluye la información dentro de él.

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
|:----------------------------------------------------------------------------------------------------:|

## Aprende más
- Documentación oficial de [InheritedWidgets](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)

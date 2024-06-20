import 'dart:io';

void main(List<String> args) {
  int opcion;
  do {
    print("bienvenido a la app de creacion de exposiciones");
    print("1. crear grupos");
    print("2. reorganizar grupos");
    print("3. utilizar datos guardados");
    print("4. ");
    print("5. salir");
    print("digite la opcion deseada");
    opcion = int.parse(stdin.readLineSync()!);
    if (opcion >= 1 && opcion < 5) {}
    switch (opcion) {
      case 1:
        int cantTemas;
        String temas, complejidad;
        List<String> tema = [];
        List<String> complejidadTema = [];
        List<String> nombres = [];
        int cantNombres;
        String nombre;
        List<int> grupo = [];
        int contNombres;

        print("ingrese la cantidad de temas ");
        cantTemas = int.parse(stdin.readLineSync()!);
        for (var i = 0; i < cantTemas; i++) {
          print("ingrese el tema #${i + 1}");
          temas = stdin.readLineSync()!;
          tema.add(temas); //se agrega el tema a la lista
        }
        for (var i = 0; i < cantTemas; i++) {
          print("ingrese la complejidad del tema (baja-media-alta) #${i + 1}");
          complejidad = stdin.readLineSync()!;
          complejidadTema.add(complejidad); //se agrega el tema a la lista
        }
        print("ingrese la cantidad de alumnos");
        cantNombres = int.parse(stdin.readLineSync()!);
        for (var i = 0; i < cantNombres; i++) {
          print("ingrese el nombre #${i + 1}");
          nombre = stdin.readLineSync()!;
          nombres.add(nombre); //se agrega el tema a la lista
        }
        print(nombres);
        if (cantTemas == "baja") {
          if (cantNombres < 2) {
            print(cantNombres);
          }
        }
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        print("adios");
        break;
      default:
        print("opcion incorrecta");
    }
  } while (opcion != 5);
}

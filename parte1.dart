import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int opcion;
  do {
    print("Bienvenido a la app de creación de exposiciones");
    print("1. Crear grupos");
    print("2. Reorganizar grupos");
    print("3. Utilizar datos guardados");
    print("4. Otra opción (por implementar)");
    print("5. Salir");
    print("Digite la opción deseada:");
    opcion = int.parse(stdin.readLineSync()!);
    
    if (opcion >= 1 && opcion < 5) {}
    switch (opcion) {
      case 1:
        int cantGrupos;
        String temas, complejidad;
        List<String> tema = [];
        List<String> dificultadTema = [];
        List<String> nombres = [];
        int cantNombres;
        String nombre;
        List<int> grupo = [];
        int contNombres;
        String dificultad;
        //-------------------------------------------------------------//
        
        print("ingrese la cantidad de grupos ");
        cantGrupos = int.parse(stdin.readLineSync()!);
        for (var i = 0; i < cantGrupos; i++) {
          print("ingrese el tema #${i + 1}");
          temas = stdin.readLineSync()!;
          tema.add(temas); //se agrega el tema a la lista
        }
        //------------------------------------------------------------//
        for (var i = 1; i <= cantGrupos; i++) {
        print('Ingrese la dificultad del tema $i (facil, medio, alto):');
        dificultad = stdin.readLineSync()!;
        if (dificultad != null && dificultad.isNotEmpty) {
          dificultadTema.add(dificultad.toLowerCase());
        }
      }
      //-------------------------------------------------------------//
        print("ingrese la cantidad de alumnos");
        cantNombres = int.parse(stdin.readLineSync()!);
        for (var i = 0; i < cantNombres; i++) {
          print("ingrese el nombre #${i + 1}");
          nombre = stdin.readLineSync()!;
          nombres.add(nombre); //se agrega los nombres a la lista
        }
        print(nombres);

        // Distribuir las personas en los grupos 
        var grupos = <List<String>>[];
        var personasRestantes = [...nombres]; 

        for (var dificultad in dificultadTema) {
          var grupo = <String>[];
          var cantidadPersonasGrupo = (dificultad);

          // Asegurar que el grupo tenga la cantidad correcta de personas
          while (grupo.length < cantNombres && personasRestantes.isNotEmpty) {
            var indiceAleatorio = Random().nextInt(personasRestantes.length);
            grupo.add(personasRestantes.removeAt(indiceAleatorio));
          }

          grupos.add(grupo);
  }
        // Mostrar los grupos formados
        print('\nGrupos formados:');
        for (var i = 0; i < cantGrupos; i++) {
          print('Grupo ${i + 1}: ${grupos[i]}');
        }
        //-----------------------------------------------------------//
        int _calcularCantidadPersonas(String dificultad) {
        switch (dificultad) {
          case 'facil':
            return Random().nextInt(1) + 2;
          case 'medio':
            return Random().nextInt(2) + 3;
          case 'alto':
            return Random().nextInt(4) + 5; 
          default:
            return 0;
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

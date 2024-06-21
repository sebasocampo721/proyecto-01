import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int opcion;
  List<List<String>> grupos = [];
  //--------------------------------------------------------//
  do {
    print("Bienvenido a la app de creación de exposiciones");
    print("1. Crear grupos");
    print("2. Reorganizar grupos");
    print("3. Utilizar datos guardados");
    print("4. ");
    print("5. Salir");
    print("Digite la opción deseada:");
    
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        grupos = crearGrupos();
        break;
      case 2:
        if (grupos.isNotEmpty) {
          reorganizarGrupos(grupos);
        } else {
          print("No hay grupos creados todavía.");
        }
        break;
      case 3:
        break;
      case 4:
        print("");
        break;
      case 5:
        print("Adiós");
        break;
      default:
        print("Opción incorrecta, por favor elija una opción válida.");
    }
  } while (opcion != 5);
}
//-----------------------------------------------------------------------//

List<List<String>> crearGrupos() {
  int cantGrupos;
  List<String> temas = [];
  List<String> dificultadTema = [];
  List<String> nombres = [];
  int cantNombres;
  String nombre;
//--------------------------------------------------------------------//
  print("Ingrese la cantidad de grupos:");
  cantGrupos = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < cantGrupos; i++) {
    print("Ingrese el tema del grupo #${i + 1}:");
    var tema = stdin.readLineSync()!;
    temas.add(tema);

    print('Ingrese la dificultad del tema $tema (facil, medio, alto):');
    var dificultad = stdin.readLineSync()!.toLowerCase();
    dificultadTema.add(dificultad);
  }

  print("Ingrese la cantidad de alumnos:");
  cantNombres = int.parse(stdin.readLineSync()!);

  for (var i = 0; i < cantNombres; i++) {
    print("Ingrese el nombre #${i + 1}:");
    nombre = stdin.readLineSync()!;
    nombres.add(nombre);
  }

  // Distribuir las personas en los grupos
  var grupos = <List<String>>[];
  var personasRestantes = [...nombres];

  for (var i = 0; i < cantGrupos; i++) {
    var grupo = <String>[];
    var dificultad = dificultadTema[i];
    var cantidadPersonasGrupo = _calcularCantidadPersonas(dificultad);

    // Asegurar que el grupo tenga al menos una persona
    if (personasRestantes.isNotEmpty) {
      var indiceAleatorio = Random().nextInt(personasRestantes.length);
      grupo.add(personasRestantes.removeAt(indiceAleatorio));
    }

    // Llenar el grupo con el resto de personas necesarias
    while (grupo.length < cantidadPersonasGrupo && personasRestantes.isNotEmpty) {
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

  return grupos;
}

int _calcularCantidadPersonas(String dificultad) {
  switch (dificultad) {
    case 'facil':
      return 3;
    case 'medio':
      return 4;
    case 'alto':
      return Random().nextInt(2) + 4; // Entre 4 y 5 personas
    default:
      return 0; // valor por defecto
  }
}

void reorganizarGrupos(List<List<String>> grupos) {
  print("Reorganización de Grupos:");

  // Mostrar los grupos actuales
  for (var i = 0; i < grupos.length; i++) {
    print('Grupo ${i + 1}: ${grupos[i]}');
  }

  // Permitir al usuario seleccionar un grupo y reorganizarlo
  print("Ingrese el número de grupo que desea reorganizar (1-${grupos.length}):");
  var grupoSeleccionado = int.parse(stdin.readLineSync()!) - 1;

  if (grupoSeleccionado >= 0 && grupoSeleccionado < grupos.length) {
    print("Grupo seleccionado: ${grupos[grupoSeleccionado]}");
    print("Ingrese los nuevos nombres del grupo separados por coma:");
    var nuevosnombres = stdin.readLineSync()!.split(',').map((e) => e.trim()).toList();

    grupos[grupoSeleccionado] = nuevosnombres;
    
    print("Grupo actualizado:");
    print('Grupo ${grupoSeleccionado + 1}: ${grupos[grupoSeleccionado]}');
  } else {
    print("Número de grupo inválido.");
  }
}

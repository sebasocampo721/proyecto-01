import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int opcion;
  List<List<String>> grupos = [];

  do {
    print("Bienvenido a la app de creación de exposiciones");
    print("1. Crear grupos");
    print("2. Reorganizar grupos");
    print("3. Mostrar grupos");
    print("4. Eliminar grupo");
    print("5. Salir");
    print("Digite la opción deseada:");

    opcion = int.tryParse(stdin.readLineSync()!) ?? 0;

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
        if (grupos.isNotEmpty) {
          mostrarGrupos(grupos);
        } else {
          print("No hay grupos creados todavía.");
        }
        break;
      case 4:
        if (grupos.isNotEmpty) {
          eliminarGrupo(grupos);
        } else {
          print("No hay grupos creados todavía.");
        }
        break;
      case 5:
        print("Adiós");
        break;
      default:
        print("Opción incorrecta, por favor elija una opción válida.");
    }
  } while (opcion != 5);
}

List<List<String>> crearGrupos() {
  int cantGrupos;
  List<String> temas = [];
  List<String> dificultadTema = [];
  List<String> nombres = [];
  int cantNombres;
  String nombre;

  print("Ingrese la cantidad de grupos:");
  cantGrupos = int.tryParse(stdin.readLineSync()!) ?? 0;

  for (var i = 0; i < cantGrupos; i++) {
    print("Ingrese el tema del grupo #${i + 1}:");
    var tema = stdin.readLineSync()!;
    temas.add(tema);

    print('Ingrese la dificultad del tema $tema (facil, medio, alto):');
    var dificultad = stdin.readLineSync()!.toLowerCase();
    dificultadTema.add(dificultad);
  }

  print("Ingrese la cantidad de alumnos:");
  cantNombres = int.tryParse(stdin.readLineSync()!) ?? 0;

  for (var i = 0; i < cantNombres; i++) {
    print("Ingrese el nombre #${i + 1}:");
    nombre = stdin.readLineSync()!;
    nombres.add(nombre);
  }

  var grupos = <List<String>>[];
  var personasRestantes = [...nombres];

  for (var i = 0; i < cantGrupos; i++) {
    var grupo = <String>[];
    var dificultad = dificultadTema[i];
    var cantidadPersonasGrupo = _calcularCantidadPersonas(dificultad);

    if (personasRestantes.isNotEmpty) {
      var indiceAleatorio = Random().nextInt(personasRestantes.length);
      grupo.add(personasRestantes.removeAt(indiceAleatorio));
    }

    while (grupo.length < cantidadPersonasGrupo && personasRestantes.isNotEmpty) {
      var indiceAleatorio = Random().nextInt(personasRestantes.length);
      grupo.add(personasRestantes.removeAt(indiceAleatorio));
    }

    grupos.add(grupo);
  }

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
  var grupoSeleccionado = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (grupoSeleccionado > 0 && grupoSeleccionado <= grupos.length) {
    print("Tema actual del Grupo ${grupoSeleccionado}: ${grupos[grupoSeleccionado - 1][0]}");
    print("Ingrese el nuevo tema para el grupo:");
    var nuevoTema = stdin.readLineSync()!;

    grupos[grupoSeleccionado - 1][0] = nuevoTema;

    print("Tema actualizado del Grupo ${grupoSeleccionado}: $nuevoTema");
  } else {
    print("Número de grupo inválido.");
  }
}

void mostrarGrupos(List<List<String>> grupos) {
  print('\nGrupos existentes:');
  for (var i = 0; i < grupos.length; i++) {
    print('Grupo ${i + 1}: ${grupos[i]}');
  }
}

void eliminarGrupo(List<List<String>> grupos) {
  print("Eliminar Grupo:");

  mostrarGrupos(grupos);

  print("Ingrese el número de grupo que desea eliminar (1-${grupos.length}):");
  var grupoSeleccionado = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (grupoSeleccionado > 0 && grupoSeleccionado <= grupos.length) {
    var grupoEliminado = grupos.removeAt(grupoSeleccionado - 1);
    print("Grupo $grupoSeleccionado: $grupoEliminado eliminado correctamente.");
  } else {
    print("Número de grupo inválido.");
  }
}
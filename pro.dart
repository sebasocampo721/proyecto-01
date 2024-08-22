import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  List<List<dynamic>> grupos = []; // Lista de listas: [tema, nombres]

  int opcion;
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

List<List<dynamic>> crearGrupos() {
  int cantGrupos;
  List<String> temas = [];
  List<String> dificultadTema = [];
  List<String> nombres = []; // Lista global para almacenar nombres
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

  var opcion1;
  do {
    print("¿Desea utilizar los nombres predeterminados o ingresarlos manualmente?");
    print("1. Utilizar los nombres predefinidos");
    print("2. Ingresar los nombres manualmente");
    print("Digite la opción deseada:");

    opcion1 = int.tryParse(stdin.readLineSync()!) ?? 0;

    switch (opcion1) {
      case 1:
        nombres = [
          "ANDRES FELIPE SANCHEZ HURTADO",
          "ANGIE DAHIANA RIOS QUINTERO",
          "CRISTIAN ALVAREZ ARANZAZU",
          "DANIEL ESTIVEN ARBOLEDA DUQUE",
          "DAVID ANDRES MORALES GUAPACHA",
          "DAVID STIVEN OCAMPO LONDONNO",
          "ESTEBAN REYES AGUDELO",
          "JACOBO GALVIS JIMENEZ",
          "JAIME ANDRES CALLE SALAZAR",
          "JEFERSON MAURICIO HERNANDEZ LADINO",
          "JHON ALEXANDER PINEDA OSORIO",
          "JOSE MIGUEL SIERRA ARISTIZABAL",
          "JOSE SEBASTIAN OCAMPO LOPEZ",
          "JUAN ANDRES OSORIO GOMEZ",
          "JUAN DIEGO CALVO OSORIO",
          "JUAN ESTEBAN LOPEZ CALLE",
          "JUAN PABLO RIOS ARISTIZABAL",
          "MARIA PAULA MELO SOLANO",
          "MIGUEL ANGEL PENNA JIMENEZ",
          "SAMUEL CASTANNO CARDONA",
          "JUAN JOSE POSADA PEREZ",
          "ALEJANDRO SERNA LONDONNO",
          "JUAN MANUEL ZULUAGA RINCON",
          "JUAN DANIEL GOMEZ LASERNA",
          "YERSON STIVEN HERRERA OBANDO",
          "MATEO HERRERA VARGAS",
          "ALEJANDRO VALLEJO ESCOBAR"
        ];
        break;
      case 2:
        print("Ingrese la cantidad de alumnos:");
        cantNombres = int.tryParse(stdin.readLineSync()!) ?? 0;
        for (var i = 0; i < cantNombres; i++) {
          print("Ingrese el nombre #${i + 1}:");
          nombre = stdin.readLineSync()!;
          nombres.add(nombre);
        }
        break;
      default:
        print("Opción incorrecta, por favor elija una opción válida.");
    }
  } while (opcion1 != 1 && opcion1 != 2);

  var grupos = <List<dynamic>>[];
  var personasRestantes = [...nombres];

  for (var i = 0; i < cantGrupos; i++) {
    var grupo = <String>[];
    var dificultad = dificultadTema[i];
    var cantidadPersonasGrupo = _calcularCantidadPersonas(dificultad);

    while (grupo.length < cantidadPersonasGrupo && personasRestantes.isNotEmpty) {
      var indiceAleatorio = Random().nextInt(personasRestantes.length);
      grupo.add(personasRestantes.removeAt(indiceAleatorio));
    }

    grupos.add([temas[i], grupo]);
  }

  print('\nGrupos formados:');
  for (var i = 0; i < cantGrupos; i++) {
    print('Grupo ${i + 1}: Tema: ${grupos[i][0]}, Miembros: ${grupos[i][1]}');
  }

  return grupos;
}

int _calcularCantidadPersonas(String dificultad) {
  switch (dificultad) {
    case 'facil':
      return 2;
    case 'medio':
      return 3;
    case 'alto':
      return Random().nextInt(2) + 4;
    default:
      return 0;
  }
}

void reorganizarGrupos(List<List<dynamic>> grupos) {
  print("Reorganización de Grupos:");

  for (var i = 0; i < grupos.length; i++) {
    print('Grupo ${i + 1}: Tema: ${grupos[i][0]}, Miembros: ${grupos[i][1]}');
  }

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

void mostrarGrupos(List<List<dynamic>> grupos) {
  print('\nGrupos existentes:');
  for (var i = 0; i < grupos.length; i++) {
    print('Grupo ${i + 1}: Tema: ${grupos[i][0]}, Miembros: ${grupos[i][1]}');
  }
}

void eliminarGrupo(List<List<dynamic>> grupos) {
  print("Eliminar Grupo:");

  mostrarGrupos(grupos);

  print("Ingrese el número de grupo que desea eliminar (1-${grupos.length}):");
  var grupoSeleccionado = int.tryParse(stdin.readLineSync()!) ?? 0;

  if (grupoSeleccionado > 0 && grupoSeleccionado <= grupos.length) {
    var grupoEliminado = grupos.removeAt(grupoSeleccionado - 1);
    print("Grupo ${grupoSeleccionado}: Tema: ${grupoEliminado[0]}, Miembros: ${grupoEliminado[1]} eliminado correctamente.");
  } else {
    print("Número de grupo inválido.");
  }
}

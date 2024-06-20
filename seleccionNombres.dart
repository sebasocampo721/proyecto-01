import 'dart:io';

void main() {
  List<String> nombres = []; // Lista para almacenar los nombres
  
  // Ciclo para ingresar nombres hasta que el usuario decida terminar
  while (true) {
    // Solicitar al usuario que ingrese un nombre
    stdout.write('Ingrese un nombre (o escriba "fin" para terminar): ');
    String nombre = stdin.readLineSync()!.trim(); // Obtener la entrada del usuario
    
    if (nombre.toLowerCase() == 'fin') {
      break; // Terminar el ciclo si el usuario escribe "fin"
    }
    
    nombres.add(nombre); // Agregar el nombre a la lista
  }
  
  // Imprimir la lista de nombres ingresados
  print('\nLista de nombres ingresados:');
  nombres.forEach((nombre) => print(nombre));
}
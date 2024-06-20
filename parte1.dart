import 'dart:io';
void main(List<String> args) {
  int opcion;
   do{
    print("bienvenido a la app de creacion de exposiciones");
    print("1. crear grupos");
    print("2. reorganizar grupos");
    print("3. utilizar datos guardados");
    print("4. ");
    print("5. salir");
    print("digite la opcion deseada");
    opcion=int.parse(stdin.readLineSync()!);
    if(opcion>=1 && opcion< 5){
    
    }
   switch(opcion){
      case 1:
      int cantTemas; 
      String temas, complejidad;
      List<String> tema= [];
      List<String> complejidadTema= [];
      print("ingrese la cantidad de temas ");
      cantTemas=int.parse(stdin.readLineSync()!);
      for (var i = 0; i< cantTemas; i++){
      print("ingrese el tema #${i+1}");
      temas=stdin.readLineSync()!;
      tema.add(temas);//se agrega el tema a la lista

      for (var i = 0; i< cantTemas; i++){
      print("ingrese la complejidad del tema (baja-media-alta) #${i+1}");
      complejidad=stdin.readLineSync()!;
      complejidadTema.add(complejidad);//se agrega el tema a la lista

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
  } while (opcion!=5);
   
}
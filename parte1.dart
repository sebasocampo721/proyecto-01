import 'dart:io';
void main(List<String> args) {
  int opcion;
   do{
    print("bienvenido ");
    print("1. ");
    print("2. ");
    print("3. ");
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
      print("ingrese la cantidad de temas ");
      cantTemas=int.parse(stdin.readLineSync()!);
      for (var i = 0; i< cantTemas; i++){
      print("ingrese el tema #${i+1}");
      temas=stdin.readLineSync()!;
      tema.add(temas);//se agrega el tema a la lista
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
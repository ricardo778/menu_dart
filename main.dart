import 'dart:io';

void main() {
  String? cedula;
  String? nombre;
  String? login;
  String? clave;
  String? ciudad;

  String? codigo;
  String? correo;
  String? fechaNacimiento;
  String? lugarNacimiento;
  String? autoevaluacion;

  List<String> menu = [
    "1. Datos de Usuario",
    "2. Cambiar Clave",
    "3. Tabla de Multiplicar",
    "4. Saber si un numero ingresado es primo o no",
    "5. Elegir opcion de menu favorita",
    "6. Salir"
  ];

  int? opcion;

  do {
    print("\n**********************************");
    print("* Menu Principal          *");
    print("**********************************");
    for (var i = 0; i < menu.length; i++) {
      print("* ${menu[i]}");
    }
    print("**********************************");
    stdout.write("Selecciona una opcion: ");
    String? input = stdin.readLineSync();
    opcion = int.tryParse(input ?? '');

    if (opcion == null) {
      print("Error: Ingresa un numero valido.\n");
      continue;
    }

    switch (opcion) {
      case 1:
        stdout.write("Ingrese su cedula: ");
        cedula = stdin.readLineSync();
        stdout.write("Ingrese su nombre: ");
        nombre = stdin.readLineSync();
        stdout.write("Ingrese el login: ");
        login = stdin.readLineSync();
        stdout.write("Ingrese la clave: ");
        clave = stdin.readLineSync();
        stdout.write("Ingrese su ciudad: ");
        ciudad = stdin.readLineSync();
        stdout.write("Ingrese su codigo: ");
        codigo = stdin.readLineSync();
        stdout.write("Ingrese su correo: ");
        correo = stdin.readLineSync();
        stdout.write("Ingrese su fecha de nacimiento: ");
        fechaNacimiento = stdin.readLineSync();
        stdout.write("Ingrese su lugar de nacimiento: ");
        lugarNacimiento = stdin.readLineSync();
        stdout.write("Ingrese su autoevaluacion: ");
        autoevaluacion = stdin.readLineSync();
        print("Datos guardados exitosamente.\n");
        break;

      case 2:
        if (login == null || clave == null) {
          print("Error: Primero debes ingresar tus datos en la opcion 1.\n");
          break;
        }
        stdout.write("Ingrese su login: ");
        String? loginPrueba = stdin.readLineSync();
        stdout.write("Ingrese la clave: ");
        String? clavePrueba = stdin.readLineSync();

        if (loginPrueba == login && clavePrueba == clave) {
          stdout.write("Ingrese la nueva clave: ");
          clave = stdin.readLineSync();
          print("Clave actualizada exitosamente.\n");
        } else {
          print("Credenciales invalidas. Intente de nuevo.\n");
        }
        break;

      case 3:
        stdout.write("Ingrese el numero de la tabla: ");
        int? numTabla = int.tryParse(stdin.readLineSync()!);
        stdout.write("Ingrese el numero minimo: ");
        int? numMinimo = int.tryParse(stdin.readLineSync()!);
        stdout.write("Ingrese el numero maximo (hasta 10): ");
        int? numMaximo = int.tryParse(stdin.readLineSync()!);

        if (numTabla == null || numMinimo == null || numMaximo == null || numMaximo > 10) {
          print("Error: Datos invalidos. Asegurese de ingresar numeros y que el maximo no sea mayor a 10.\n");
          break;
        }

        print("Tabla de multiplicar del $numTabla desde $numMinimo hasta $numMaximo:");
        for (int i = numMinimo; i <= numMaximo; i++) {
          print("$numTabla x $i = ${numTabla * i}");
        }
        print("");
        break;

      case 4:
        stdout.write("Ingrese un numero entero: ");
        int? numPrimo = int.tryParse(stdin.readLineSync()!);

        if (numPrimo == null || numPrimo <= 1) {
          print("Error: El numero debe ser un entero y mayor a 1.\n");
          break;
        }

        bool esPrimo = true;
        for (int i = 2; i <= numPrimo ~/ 2; i++) {
          if (numPrimo % i == 0) {
            esPrimo = false;
            break;
          }
        }
        print(esPrimo ? "$numPrimo es un numero primo.\n" : "$numPrimo no es un numero primo.\n");
        break;

      case 5:
        stdout.write("Seleccione su opcion preferida (1, 2 o 3): ");
        int? opcionPreferida = int.tryParse(stdin.readLineSync()!);

        if (opcionPreferida == null || opcionPreferida < 1 || opcionPreferida > 3) {
          print("Error: Seleccion invalida. Solo puedes elegir entre 1, 2 o 3.\n");
          break;
        }

        String opcionSeleccionada = menu.removeAt(opcionPreferida - 1);
        menu.insert(0, opcionSeleccionada);
        print("Menu reorganizado exitosamente.\n");
        break;

      case 6:
        print("**********************************");
        print("* Datos Personales       *");
        print("**********************************");
        print("Nombre Completo: ${nombre ?? 'No ingresado'}");
        print("Cedula: ${cedula ?? 'No ingresada'}");
        print("Login: ${login ?? 'No ingresado'}");
        print("Clave: ${clave ?? 'No ingresada'}");
        print("Ciudad: ${ciudad ?? 'No ingresada'}");
        print("Codigo: ${codigo ?? 'No ingresado'}");
        print("Correo: ${correo ?? 'No ingresado'}");
        print("Fecha de Nacimiento: ${fechaNacimiento ?? 'No ingresada'}");
        print("Lugar de Nacimiento: ${lugarNacimiento ?? 'No ingresado'}");
        print("Autoevaluacion: ${autoevaluacion ?? 'No ingresada'}");
        print("**********************************");
        print("Saliendo del programa...");
        break;

      default:
        print("Opcion invalida. Intente de nuevo.\n");
    }
  } while (opcion != 6);
}
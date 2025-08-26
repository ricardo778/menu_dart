import 'dart:io';

void main() {
  String? cedulaUsuario;
  String? nombreUsuario;
  String? loginUsuario;
  String? claveUsuario;
  String? ciudadUsuario;

  final String cedula = "3145939";
  final String nombre = "Ricardo Andres Vega Perez";
  final String login = "Ricardo";
  final String clave = "12345";
  final String ciudad = "Medellin";
  final String codigo = "3145939";
  final String correo = "av164702@example.com";
  final String fechaNacimiento = "14/10/25";
  final String lugarNacimiento = "Colombia";
  final String autoevaluacion = "3.5";

  List<String> menu = [
    "1. Datos de Usuario",
    "2. Cambiar Clave",
    "3. Tabla de Multiplicar",
    "4. Saber si un numero ingresado es primo o no",
    "5. Elegir opcion de menu favorita",
    "6. Salir",
  ];

  int? opcion;

  do {
    print("\n**********************************");
    print("* Menu Principal           *");
    print("**********************************");
    for (var item in menu) {
      print("* $item");
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
        cedulaUsuario = stdin.readLineSync();
        stdout.write("Ingrese su nombre: ");
        nombreUsuario = stdin.readLineSync();
        stdout.write("Ingrese el login: ");
        loginUsuario = stdin.readLineSync();
        stdout.write("Ingrese la clave: ");
        claveUsuario = stdin.readLineSync();
        stdout.write("Ingrese su ciudad: ");
        ciudadUsuario = stdin.readLineSync();
        print("Datos guardados exitosamente.\n");
        break;

      case 2:
        if (loginUsuario == null || claveUsuario == null) {
          print("Error: Primero debes ingresar tus datos en la opcion 1.\n");
          break;
        }
        stdout.write("Ingrese su login: ");
        String? loginPrueba = stdin.readLineSync();
        stdout.write("Ingrese la clave: ");
        String? clavePrueba = stdin.readLineSync();

        if (loginPrueba == loginUsuario && clavePrueba == claveUsuario) {
          stdout.write("Ingrese la nueva clave: ");
          claveUsuario = stdin.readLineSync();
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

        if (numTabla == null ||
            numMinimo == null ||
            numMaximo == null ||
            numMaximo > 10) {
          print(
            "Error: Datos invalidos. Asegurese de ingresar numeros y que el maximo no sea mayor a 10.\n",
          );
          break;
        }

        print(
          "Tabla de multiplicar del $numTabla desde $numMinimo hasta $numMaximo:",
        );
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
        print(
          esPrimo
              ? "$numPrimo es un numero primo.\n"
              : "$numPrimo no es un numero primo.\n",
        );
        break;

      case 5:
        stdout.write("Seleccione su opcion preferida (1, 2 o 3): ");
        int? opcionPreferida = int.tryParse(stdin.readLineSync()!);

        if (opcionPreferida == null ||
            opcionPreferida < 1 ||
            opcionPreferida > 3) {
          print(
            "Error: Seleccion invalida. Solo puedes elegir entre 1, 2 o 3.\n",
          );
          break;
        }

        String opcionSeleccionada = menu.removeAt(opcionPreferida - 1);
        menu.insert(0, opcionSeleccionada);
        print("Menu reorganizado exitosamente.\n");
        break;

      case 6:
        print("**********************************");
        print("* Datos del Creador del Programa *");
        print("**********************************");
        print("Nombre Completo: $nombre");
        print("Cedula: $cedula");
        print("Login: $login");
        print("Clave: $clave");
        print("Ciudad: $ciudad");
        print("Codigo: $codigo");
        print("Correo: $correo");
        print("Fecha de Nacimiento: $fechaNacimiento");
        print("Lugar de Nacimiento: $lugarNacimiento");
        print("Autoevaluacion: $autoevaluacion");
        print("**********************************");
        print("Saliendo del programa...");
        break;

      default:
        print("Opcion invalida. Intente de nuevo.\n");
    }
  } while (opcion != 6);
}

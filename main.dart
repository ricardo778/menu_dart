import 'dart:io';

void main() {
  String? clave;
  String? login;
  String? nombre;
  String? ciudad;
  String? cedula;

  List<String> menu = [
    "1. Datos de Usuario",
    "2. Cambiar Clave",
    "3. Tabla de Multiplicar",
    "4. Saber si un número ingresado es primo o no",
    "5. Elegir opción de menú favorita",
    "6. Salir"
  ];
  int opcion = 0;
  do {
    print("**********************************");
    print("*        Menú Principal          *");
    print("**********************************");
    for (var item in menu) {
      print("* $item");
    }
    print("**********************************");
    opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        print("Ingrese su nombre");
        nombre = stdin.readLineSync();
        print("Ingrese su cédula");
        cedula = stdin.readLineSync();
        print("Ingrese el login");
        login = stdin.readLineSync();
        print("Ingrese la contraseña");
        clave = stdin.readLineSync();
        print("Ingrese su ciudad");
        ciudad = stdin.readLineSync();
        print("Datos guardados exitosamente\n");
        break;

      case 2:
        print("Ingrese su usuario");
        String? loginPrueba = stdin.readLineSync();
        print("Por favor digite la contraseña");
        String? clavePrueba = stdin.readLineSync();
        if (clavePrueba == clave && loginPrueba == login) {
          print("Ingrese la contraseña nueva");
          clave = stdin.readLineSync();
          print("Clave guardada exitosamente\n");
        } else {
          print("Credenciales inválidas, intente de nuevo\n");
        }
        break;

      case 3:
        print("Ingrese el número de la tabla de multiplicar");
        int num = int.parse(stdin.readLineSync()!);
        print("La tabla del número: $num");
        for (int i = 1; i <= 12; i++) {
          print("$num X $i = ${i * num}");
        }
        break;

      case 4:
        print("Ingrese un número entero:");
        int num = int.parse(stdin.readLineSync()!);
        if (num <= 1) {
          print("Error: el número debe ser mayor a 1.\n");
        } else {
          bool primo = true;
          for (int i = 2; i <= num ~/ 2; i++) {
            if (num % i == 0) {
              primo = false;
              break;
            }
          }
          print(primo ? "Es primo\n" : "No es primo\n");
        }
        break;

      case 5:
        print("Selecciona tu opción preferida (1, 2 o 3):");
        int opcion2 = int.parse(stdin.readLineSync()!);

        if (opcion2 >= 1 && opcion2 <= 3) {
          String preferida = menu[opcion2 - 1];
          menu.removeAt(opcion2 - 1);
          menu.insert(0, preferida);

          print("\nMenú reorganizado:");
          for (var item in menu) {
            print("* $item");
          }
          print("");
        } else {
          print("Error: solo puedes elegir entre 1, 2 o 3.\n");
        }
        break;

      case 6:
        print("Saliendo del programa...");
        break;

      default:
        print("Opción inválida, intenta de nuevo\n");
    }
  } while (opcion != 6);
}
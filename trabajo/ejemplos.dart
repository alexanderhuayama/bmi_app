void main() {
  int multiplicar(int valor1, int valor2) {
    return valor1 * valor2;
  }

  int calculadora({int valor1, int valor2, Function operacion}) {
    return operacion(valor1, valor2);
  }

  int resultado = calculadora(valor1: 1, valor2: 4, operacion: multiplicar);

  print(resultado);
}


float valor;

void setup(){
  size (500, 500);
  background (0);
  stroke (0, 255, 0,50);
  strokeWeight (1);
  smooth ();
  valor = 100;
  frameRate (5);
}

void draw (){
  background (0);
  valor = valor + 20; // essa expressao é igual a valor += 10
  line (valor,10,valor,250);
  println (valor);
}

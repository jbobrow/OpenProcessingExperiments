
float valor;
float r;
float b;
float g;

void setup(){
  size (500, 500);
  background (0);
  strokeWeight (1);
  smooth ();
  valor = 100;
  frameRate (5);
}

void draw (){
  valor = random(300);
  r = random (255);
  g = random (255);
  b = random (255);
  stroke (r, g, b, 120);
  strokeWeight (random (5));
  line (valor+valor, valor, valor+120, valor+valor);
}

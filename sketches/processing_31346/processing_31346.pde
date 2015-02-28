
float altura;
float incremento;

void setup() {
  altura = 0;
  incremento = 1;
}

void draw() {
  background(255);
  ellipse(width/2, altura, 10,10);
  if (altura==0) incremento=1;
  if (altura == height) incremento=-1;
  altura = altura + incremento;
}


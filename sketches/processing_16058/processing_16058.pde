
PImage foto;
float tam;
float x;
float y;

void setup() {
  size(800,600);
  background(255);
  smooth();    
  foto = loadImage ("logo.png");
}

void draw() {
  tam = random(+100);
  x = random(width);
  y = random(height);
  image(foto, x, y, tam, tam);
}






PImage bg;
PImage carro;
int x,y;
/* @pjs preload="cenario.png"; */ 
void setup() {
  size(800, 480);
  bg = loadImage("cenario.png");
  carro = loadImage("carro.png");
  x = 0; y = 297;
}
void draw() {
  background(bg);
  image(carro,x++,y);
}



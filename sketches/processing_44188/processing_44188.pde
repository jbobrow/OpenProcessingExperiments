



PFont fontA;
  float t=0;
void setup() 
{
  size(200, 150);
  fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
  textFont(fontA, 32);
}

void draw() {
  t+=0.01;
  background(102);
  fill(0);
  text("Hola", noise(t)*60, 60);
  fill(255);
  text("Mundo!!",noise(t+0.1)*30, 105);
}


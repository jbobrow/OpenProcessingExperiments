
int counter;

float x = -100;float y = 0;int valor = 5;
void setup()
{
  noStroke();
  size(205, 205);
  background(51);
}
void draw() {
  
  funcionCuadratica();
}
void funcionCuadratica() {
x=x+0.9;
  if (x < 100) {
    y =(x*x)/10;
  }
  fill(245);
  ellipse(x+105, y, 6,6);
}

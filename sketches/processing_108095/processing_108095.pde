
float x =-100;float y = 0; int valor = 5;
void setup()
{
  noStroke();
  size(200, 200);
}
void draw() {
  background(51);
  funcionCuadratica();
}
void funcionCuadratica() {
  x=x+0.5;
  if (x<100) {
    y =(x*x)/50;
  }
  fill(255);
  ellipse(x+100, y, 20, 20);
}

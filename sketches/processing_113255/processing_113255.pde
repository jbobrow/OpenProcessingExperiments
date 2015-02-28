
float x = -100;float y = 0;int valor = 3;
void setup()
{
  noStroke();
  size(400, 400);
  background(0, 110, 155);
}
void draw() {
    
  funcionCuadratica();
}
void funcionCuadratica() {
x=x+0.5;
  if (x < 100) {
    y =(x*x)/22;
  }
  fill(255);
  ellipse(x+200, y, 10,10);
}


float x = -100;float y = 0;int valor = 5;
void setup()
{
  noStroke();
  size(200, 200);
  background(0, 255, 0);
}
void draw() {
   
  funcionCuadratica();
}
void funcionCuadratica() {
x=x+0.9;
  if (x < 100) {
    y =(x*x)/20;
  }
  fill(255);
  ellipse(x+100, y, 5,5);
}

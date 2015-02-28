
float x = -300;float y = 0;int valor = 3;
void setup()
{
  noStroke();
  size(200, 200);
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
  fill(255);
  ellipse(x+100, y, 5,5);
}

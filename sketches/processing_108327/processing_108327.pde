
int x = 0;int y = 0; int valor=100;
void setup()
{
  noStroke();
  size(200, 200);
}
void draw() {
  background(0, 255, 0);
  funcionCuadratica();
}
void funcionCuadratica() {
for(int x = -valor; x < valor; x++) {
  y=(x*x)/20;
    fill(255);
  ellipse(x+100, y, 6, 6);
  }
}

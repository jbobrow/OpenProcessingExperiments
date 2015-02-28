
int x = 0;int y = 0; int valor=100;
void setup()
{
  noStroke();
  size(400, 400);
}
void draw() {
  background(255, 204, 0);
  funcionCuadratica();
}
void funcionCuadratica() {
for(int x = -valor; x < valor; x++) {
  y=(x*x)/22;
    fill(255);
  ellipse(x+200, y, 10, 10);
}
}

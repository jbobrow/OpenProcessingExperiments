
int counter;

int x = 0;int y = 0; int valor=100;
void setup()
{
  noStroke();
  size(208, 208);
}
void draw() {
  background(51);
  funcionCuadratica();
}
void funcionCuadratica() {
for(int x = -valor; x < valor; x++) {
  y=(x*x)/10;
    fill(240);
  ellipse(x+108, y, 7, 7);
}
}

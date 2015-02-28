
float x = 50; float y = 50; int valor = 50;
void setup()
{
  noStroke();
  size(200,200);
}
void draw() {
  background(51);
  funcionCuadratica();
}
void funcionCuadratica() {
  for(int x = -valor; x < valor; x++){
    y=(x*x)/10;
    fill(255);
    ellipse(x+100, y-1, 5,5);
     }
}


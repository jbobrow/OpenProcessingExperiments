
float x = -100;float y = 0;int valor = 5;
void setup()
{
  noStroke();
  size(500, 300);
} 
  void draw() {
  background(0);
  funcionCuadratica();
  }
void funcionCuadratica() {
  x+y<0.5;
  if (x < 100){
  y =(x++)/50;
  }
  fill(255);
  ellipse(x+100, y, 20, 20);
}

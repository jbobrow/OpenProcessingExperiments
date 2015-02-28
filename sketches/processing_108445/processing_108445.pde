
float x = 0; float y = 0; int valor = 100; 
void setup()
{
  noStroke();
  size(200, 200);
}
void draw(){
  background(51);
  funcionCuadratica();
  }
void funcionCuadratica(){
  for(int x = -valor; x < valor; x++){
  y=(x*x)/50;
  fill(255);
  ellipse(x+100, y, 8, 8);
  }
}

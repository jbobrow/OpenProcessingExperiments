
float x=0; float y=0; int valor = 100;
void setup()
{
  noStroke();
  size(200, 300);
  background(51);
}
void draw(){
  
 
  funcionCuadratica();
}
void funcionCuadratica(){
  for(int x =-valor; x < valor; x++){ 
  
    y=(x*x)/10;
  
  fill(255);
  ellipse(x+100, y, 5, 5);
  }
}

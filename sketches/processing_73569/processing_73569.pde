
float x = 0;
float y = 0;
float a = 1;
float b = 2;
float c = 3;
void setup()
{
  size(800,600,P3D);
  smooth();
}
void draw()
{
  stroke(255);
  frameRate(50);
  background(170,167,167);
  translate(mouseX,mouseY,20);
  rotateX(x+10);
  rotateY(y-50);
  pointLight(a+252,b+46,c+46,-235,-240,-275); 
  box(200);
  if(x<x+100)
  {
    x = x- 10;
    y = y + 15;
  }
  if(a-b<5)
  {
    a = a-1;
    b= b+5;
    c = c-2;
  }
}

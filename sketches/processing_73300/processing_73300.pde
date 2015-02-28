
//Polly Lesaguis, CP1, RotatingCube, mods 6/7


float x=1;
float y=2;
void setup()
{
  size(500,500,P3D);
}
void draw()
{
  background(0);
  fill(86,160,178);
  translate(mouseX,mouseY,2);
  rotateX(x);
  rotateY(y);
  lights();
  pointLight(255,0,255,-235,-240,275);
  box(50);
  x = x + -15;
  y = y + -15;

  fill(255);
  translate(100,100,10);
  rotateX(x);
  rotateY(y);
  box(15);
  x = x + - 2;
  y = y + -2;
  
  fill(255);
  translate(10,100,10);
  rotateX(x);
  rotateY(y);
  box(30);
    x = x + -2;
  y = y + -2;
  
  fill(255);
  translate(50,100,10);
  rotateY(y);
  box(35);
  x = x + -2;
  y = y + -2;
  
  
  fill(255);
  translate(15,40,2);
  rotateX(x);
  rotateY(x);
  box(15);
  pointLight(0,255,255,243,345,24);
  x = x + 10;
  y = y + 10;

}

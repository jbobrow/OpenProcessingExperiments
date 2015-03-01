
int x, y, xvel, yvel;
void setup()
{
  x=200;
  y=200;
  xvel=5;
  yvel=3;
  size(400,400);
  smooth();
 
  
  

}
void draw()
{
   background(0);
  x=mouseX;
  y=mouseY;

  ellipse(x, y, 40, 40);
}





//Polly Lesaguis, CP 1, mods 4/5, Animation


//shape 1
int a = 0;
int change = 1;
int x = 0;
int y = 0;
int xChange = 5;
int ychange= 1;
int diameter = 10;
void setup()
{
  size(300,300);
  size(500,300);
  background(0,0,0);
  size(500,500);
  noFill();
 
}
void draw()
{ 
 
  ellipse (2,x,y,2);
  ellipse(150,150,diameter,diameter);
  stroke(255);
  ellipse(diameter,diameter,150,150);
  diameter = diameter + 3;
  noFill();
  ellipse(10,30,a,a);
  a = a + change;

 
  x = x + xChange;
  y = y + 5;
  if(x < 250)
    if(a>300)
  {
    change = -1;
    xChange = xChange + 5;
  }
  if(x>250)
  if(x<0)
  {
    xChange = xChange - 5;
    change = 1;
  }
}

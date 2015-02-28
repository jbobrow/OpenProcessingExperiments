
//Abby zhang mod 4/5 CP1

int x=5;
int change= 10;

void setup()
{
 background(0);
 noFill(); 
 size(600,600);
}
void draw()
{
  stroke (136,56,142);
  ellipse(200-x,500-x,40,40);
  stroke (80,133,227);
  ellipse(300-x,500-x,40,40);
  stroke(x,x,x);
  ellipse(500-x,x,40,40);
  ellipse(600-x,-x,40,40);
  stroke (80,133,227);
  ellipse(500-x,400-x,40,40);
  x=x+change;
  if (x>600)
  {
    change=-8;
  }
  if (x<0)
  {
    change=8;
  }
}


//philip H CP1 4/15 Mr. SImon functions, and animations
// bounce 
//for crashsphere1
float x=0;
float changex=.1;
float y2=0;
float changey = .1;
int y=0;
// for backgroundcircle
int l=10;
int circle=0;
//BounceSphere2
float bouncex=0;
float BChangex=0;
float bounceY=0;
float BchangeY=0;


void setup()
{
  size(500, 500);
} 
void draw()
{
  background(0); 
  stroke(255);
  noFill();
  backgroundCircle();
  fill(255);
  stroke(255);
  crashSphere(); 
  BounceSphere1();
  BounceSphere2();
}  
void crashSphere()
{
  ellipse(250, y, 30, 30);
  y=y+5;
}  
void BounceSphere1()
{
  ellipse(249-x, 530-y2, 30, 30);
  x=x+0;
  y2=y2+0;
  if (y>480)
  {
    x=x+changex;
    y2=y2+changey;
    changex=changex+.01;
    changey=changey+.1;
  }

  if (x>249)
  {
    changex=-changex;
  }


  if (y2>530)
  {
    changey=-changey;
  }
}
void backgroundCircle()
{
  //actual  circle
  strokeWeight(3);
  stroke(35, 206, 162);
  ellipse(250, 250, 500-l, 500-l);
  l=l+circle;
  circle=circle+1;
  if (circle > 80)
  {
    circle=-circle;
  }
}
void BounceSphere2()
{
  ellipse(251+x, 530-y2, 30, 30);
  bouncex=bouncex+0;
  y2=y2+0;
  if (y>480)
  {
    bouncex=bouncex+BChangex;
    bounceY=bounceY+BchangeY;
    BChangex=BChangex+.001;
    BchangeY=BchangeY+.01;
  }
  if (BchangeY>3)
  {
    bounceY=-bounceY;
  }
}

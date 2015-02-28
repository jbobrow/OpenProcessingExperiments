
int i,n=5;// n is the number of segments
Circle[] circ=new Circle[n];
float targetX,targetY;
void setup()
{
  size(640,480);
  smooth();
  background(255);
  for(i=0;i<n;i++)
  {
    circ[i]=new Circle((n-i)*10,0.1);
  }
}

void draw()
{
  background(255);
  targetX=mouseX;
  targetY=mouseY;
  for(i=0;i<n;i++)
  {
  circ[i].drawIt();
  }
}
 
class Circle
{
int X,Y,Radius;
float Easing;
Circle(int r, float s)
{
X=0;
Y=0;
Easing=s;
Radius=r;
}
void drawIt()
{
X += (targetX - X) * Easing;
Y += (targetY - Y) * Easing;
ellipse(X,Y,Radius,Radius);
targetX=X;
targetY=Y;
}
}

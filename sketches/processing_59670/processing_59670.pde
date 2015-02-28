
  Circle c1=new Circle(140,40,255,5,2,5);
  Circle c2=new Circle(75,100,75,15,5,2);
  
void setup()
{
  size(300, 300);
  smooth();
  ellipseMode(CENTER);
  noStroke();
}

void draw()
{
  c1.action();
  c2.action();
}
  
class Circle {
int x,y,z,speed1,speed2;
int radiusss;

Circle(int x1,int y1,int z1, int r,int s1,int s2)
{
  x=x1;
  y=y1;
  z=z1;
  speed1=s1;
  speed2=s2;
  radiusss=r;
}
void action()
{
  fill(255,15);
  rect(0,0,width,height);
  x=x+speed1;
  y=y+speed2;
  if(y>=height-radiusss || y<=radiusss)
  {
    speed2=speed2*-1;
  }
  if (x>=width-radiusss || x<=radiusss)
  {
    speed1=speed1*-1;
  }
  fill(0,0,z);
  ellipse(x,y, radiusss*2, radiusss*2);
}

}


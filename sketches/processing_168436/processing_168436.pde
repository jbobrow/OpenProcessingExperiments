
class Point 
{

private float x; 
private float y;

public Point ()
{ x=y=0; }

public Point (float a, float b)
{ x=a; y=b; }

public float getx()
{ return x; }

public float gety()
{ return y; }

}


void setup()
{
size(500,500);
background(255);

Point p[]=new Point [4];

p[0]=new Point (100+112,100+112);
p[1]=new Point (200+112,100+112);
p[2]=new Point (200+112,300+112);
p[3]=new Point (100+112,300+112);

MyRect(p);
}

void MyRect(Point []p)
{
line(p[0].getx(),p[0].gety(),p[1].getx(),p[1].gety());
line(p[1].getx(),p[1].gety(),p[2].getx(),p[2].gety());
line(p[2].getx(),p[2].gety(),p[3].getx(),p[3].gety());
line(p[3].getx(),p[3].gety(),p[0].getx(),p[0].gety());
}

void scale(Point []p, int s)
{
p[0]=new Point (100,100);
p[1]=new Point (200,100);
p[2]=new Point (200,300);
p[3]=new Point (100,300);
}

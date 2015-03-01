

class Point 
{
private float x;
private float y;

public Point ()
{ x=y=0;}

pblic Point ( float a, float b )
{ x=a; y=b; }

public getx()
{ return x; }

public gety()
{ return y; }

}

void setup ()
{
size(250,250);
background(255);

Point p[]= new Point[8];

    p[0] = new Point(120,50);
    p[1] = new Point(100,80);
    p[2] = new Point(140,80);
    p[3] = new Point(220,50);
    p[4] = new Point(240,80);
    p[5] = new Point(240,130);
    p[6] = new Point(140,130);
    p[7] = new Point(100,130);

    
    line(p[0].getX(),p[0].getY(),p[1].getX(),p[1].getY());
    line(p[1].getX(),p[1].getY(),p[2].getX(),p[2].getY());
    line(p[2].getX(),p[2].getY(),p[0].getX(),p[0].getY());
    line(p[0].getX(),p[0].getY(),p[3].getX(),p[3].getY());
    line(p[3].getX(),p[3].getY(),p[4].getX(),p[4].getY());
    line(p[2].getX(),p[2].getY(),p[4].getX(),p[4].getY());
    line(p[1].getX(),p[1].getY(),p[7].getX(),p[7].getY());
    line(p[2].getX(),p[2].getY(),p[6].getX(),p[6].getY());
    line(p[4].getX(),p[4].getY(),p[5].getX(),p[5].getY());
    line(p[5].getX(),p[5].getY(),p[7].getX(),p[7].getY());
    
 }


/**
 *   fjenett, february 21st 2005, offenbach-germany
 *   updated 2009-04 for processing 1.0.3.
 *   .. and added centroid dragging.
 *
 *   calculates the centroid of a triangle, probably based on code by p bourke.
 */

XY a,b,c;
int rw = 5, xo, yo;

XY[] tri;
XY triDragged, centroid;

float twothird = 2.0/3.0;

void setup ()
{
    size(200,200);
    
    a = new XY(random(width),10);
    b = new XY(random(width),height/2);
    c = new XY(random(width),height-10);
    tri = new XY[]{a, b, c};
    
    centroid = new XY(-1,-1);
    
    rectMode( CENTER );
    smooth();
}

void draw ()
{
    background(120);
    beginShape(TRIANGLES);
    vertex(a.x,a.y);
    vertex(b.x,b.y);
    vertex(c.x,c.y);
    endShape();
    for (int i=0; i<tri.length; i++) rect(tri[i].x, tri[i].y, rw,rw);

    XY bc = new XY(b.x+(c.x-b.x)/2, b.y+(c.y-b.y)/2);
    centroid.set( int(a.x+(bc.x-a.x)*twothird) , int(a.y+(bc.y-a.y)*twothird) );

    ellipse(centroid.x, centroid.y, rw,rw);
}

void mousePressed ()
{
    triDragged = null;
    for (int i=0; i<tri.length; i++)
        if (tri[i].inside(mouseX, mouseY)) {
            triDragged = tri[i];
        }
    if ( triDragged == null && centroid.inside(mouseX, mouseY) )
        triDragged = centroid;
}

void mouseDragged()
{
    if ( triDragged != null )
    {
        triDragged.x = mouseX;
        triDragged.y = mouseY;
        if ( triDragged == centroid )
        {
            for (int i=0; i<tri.length; i++)
            {
                tri[i].x += mouseX-pmouseX;
                tri[i].y += mouseY-pmouseY;
            }
        }
    }
}

class XY
{
    float x, y;
    
    XY (float xx, float yy)
    {
        x=xx; 
        y=yy;
    }
    
    boolean inside (int xx, int yy)
    { 
        return (xx>x-5 && xx<x+5 && yy>y-5 && yy<y+5); 
    }
    
    void set ( int _x, int _y )
    {
        x=_x; 
        y=_y;
    }
}


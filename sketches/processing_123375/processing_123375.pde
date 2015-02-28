
/**
  * Point to Segment
  * A util class to, given a source point [p] calculate the closest point on a line segment [l] defined by its extremes [l1 and l2] 
  * Straight-forward port from Pieter Iserbyt's java implementation of linear algebra method 
  * I slightly changed the implementation and adapted the code to processing's PVector class
  * Method described by Paul Bourke and source here: [http://paulbourke.net/geometry/pointlineplane/].
**/

static class PointToSegment
{  
    static PVector getClosestPoint(float px, float py, float l1x, float l1y, float l2x, float l2y)
    {
        float dx = l2x - l1x;
        float dy = l2y - l1y;      
      
        if (dx == 0 && dy == 0) 
            throw new IllegalArgumentException("The line segment must be defined by two different points.");
        
        float u = ((px-l1x)*dx + (py-l1y)* dy) / (dx*dx + dy*dy);
        
        if      (u < 0) return new PVector(l1x, l1y);
        else if (u > 1) return new PVector(l2x, l2y);
                        return new PVector(l1x + u*dx, l1y + u*dy);   
    }
    
    static float squaredDistance(float px, float py, float l1x, float l1y, float l2x, float l2y)
    {
        PVector closestPoint = getClosestPoint(px, py, l1x, l1y, l2x, l2y);      
        return ((closestPoint.x - px)*(closestPoint.x - px) + (closestPoint.y - py)*(closestPoint.y - py)); 
    }  
  
    static float distance(float px, float py, float l1x, float l1y, float l2x, float l2y) 
    {    return sqrt(squaredDistance(px, py, l1x, l1y, l2x, l2y));    }    
}

/**
  * Point to Segment - Example
  * Move the mouse to draw ellipses centered in the mouse and tangent to given lines
**/

//Styling canvas
var csslink = document.getElementsByTagName("link")[0];
csslink.parentNode.removeChild(csslink);
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color: transparent; border: 0; padding: 0;");

int[] pal = new int[] {#f53a59, #001d2d, #15a88c, #b7d9c8, #f3f5f4};
int w2, h2;
float d;
PGraphics cShadow;
PImage def;

void setup()
{
    size(800, 800);
    w2 = width/2;
    h2 = height/2;
    externals.context.clearRect(0,0,width,height);
    cShadow = createCircleShadow(80, 80);
    stroke(0, 50);
    dashedLine(0, 0, width, height, 301);
    dashedLine(0, height, width, 0, 301);
    noStroke();
    imageMode(CENTER);
}

void draw()
{
    d  = 2 * min( PointToSegment.distance(mouseX, mouseY, 0, 0, width, height) ,
                  PointToSegment.distance(mouseX, mouseY, 0, height, width, 0) );
    if (d < 150 && !(d>mouseX || d>(width-mouseX) || d>mouseY || d>(height-mouseY))) 
    {
        fill(pal[int(d)%pal.length]);
        def = cShadow.get();
        def.resize(int(max(1,d*1.25)), 0);
        image(def, mouseX, mouseY);
        ellipse(mouseX, mouseY, d, d);    
    }
}

//A quite compact but not generic dashed line method
void dashedLine(float x1, float y1, float x2, float y2, int n)
{
    float a=1./n, b=1-a, x=(b*x1+a*x2)-x1, y=(b*y1+a*y2)-y1;    
    for (;x1<x2; x1+=x, y1+=y)   line(x1, y1, x1+=x, y1+=y); 
}

PGraphics createCircleShadow(int w, int h) {
    PGraphics dropShadow= createGraphics(w, h);
    dropShadow.beginDraw();
    dropShadow.noStroke();
    dropShadow.fill(0, 50);
    dropShadow.ellipse(w/2, h/2, w*.75, h*.75);
    dropShadow.filter(BLUR, 3);
    dropShadow.endDraw();
    return dropShadow;  
}


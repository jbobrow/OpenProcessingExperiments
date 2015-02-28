
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "border: 1px dashed #ccc;");

int S = 800, s = S/2;

size(800, 800); 
noFill();
stroke(0, 50);

void draw()
{
    background(-1);
    PVector[] points = LineDivider.divide(0, s, mouseX, s, mouseY/8);
    for (int i = 0, l = points.length; i < l; i++)
    {
      ellipse(points[i].x, points[i].y, S, S); 
      ellipse(points[i].y, points[i].x, S, S); 
      ellipse(S-points[i].x, points[i].y, S, S); 
      ellipse(points[i].y, S-points[i].x, S, S);
    }
}

/**
 * This class encapsulates a method to divide a line segment in equal parts.
 * 
 * @author Ale Gonzalez 
 * @version 1.0
 */
public class LineDivider 
{ 
    /**
     * @param x1    x-coordinate of the beginning of the segment
     * @param y1    y-coordinate of the beginning of the segment
     * @param x2    x-coordinate of the ending of the segment
     * @param y2    y-coordinate of the ending of the segment
     * @param n     number of parts to divide the segment
     * @return      a PVector array containing the positions of the division points, including the extreme points passed to the method
     */
    static PVector[] divide(float x1, float y1, float x2, float y2, int n)
    {           
        float dx = (x2-x1)/n, dy = (y2-y1)/n;
        PVector[] p = new PVector[n+1];
        p[0] = new PVector(x1, y1);
        for (int i = 0; i < n; i++) p[i+1] = new PVector(p[i].x+dx, p[i].y+dy);       

        return p;
    }
}

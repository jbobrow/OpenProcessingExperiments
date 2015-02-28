
/**
 *    fjenett 20090411
 */

Line2D lines[][];

void setup ()
{
    size( 300, 300 );
    
    lines = new Line2D[0][0];
}

void draw ()
{
    background( 255 );
    noStroke();
    
    loadPixels();
    for ( int i = 0, n = lines.length; i < n; i++ )
    {
        resetTriangles();
        for ( int ii = 0, nn = lines[i].length; ii < nn; ii++ )
        {
            lines[i][ii].drawLine();
        }
    }
    updatePixels();
}

Point2D[] currentTriangle;
void resetTriangles ()
{
    currentTriangle = new Point2D[3];
}

void drawNextTriangle ( Point2D pnt2d )
{
    currentTriangle[0] = currentTriangle[1];
    currentTriangle[1] = currentTriangle[2];
    currentTriangle[2] = pnt2d;
    if ( currentTriangle[0] != null )
    {
        Point2D[] tri = reorientTriangle( currentTriangle );
        rasterTriangle( tri[0], tri[1], tri[2] );
    }
}

void mousePressed ()
{
    lines = (Line2D[][])append(lines, new Line2D[0]);
}

Point2D pMouse;
void mouseDragged ()
{
    Point2D mouse = new Point2D( mouseX, mouseY );
    
    if ( pMouse != null )
    {
        lines[lines.length-1] = (Line2D[])append( lines[lines.length-1], 
                                                  new Line2D( pMouse, mouse ) );
    }
    pMouse = mouse;
}

void mouseReleased ()
{
    pMouse = null;
}


/* -------------------
    classes
 ------------------- */
 
class Line2D
{
    Point2D from, to;
    float distance, distance2;
    float angle;
    
    Line2D ( Point2D f, Point2D t )
    {
        from = f; to = t;
        distance = dist( from.x, from.y, to.x, to.y );
        distance2 = distance / 2;
        angle = atan2( to.y-from.y, to.x-from.x );
    }
    
    void drawLine ()
    {
        float xd = cos( angle-HALF_PI ) * distance2;
        float yd = sin( angle-HALF_PI ) * distance2;
        
        float x = from.x + xd;
        x = x > width-1  ? width-1  : (x < 1 ? 1 : x);
        float y = from.y + yd;
        y = y > height-1 ? height-1 : (y < 1 ? 1 : y);
        drawNextTriangle( new Point2D( x, y ) );
        
        x = from.x - xd;
        x = x > width-1  ? width-1  : (x < 1 ? 1 : x);
        y = from.y - yd;
        y = y > height-1 ? height-1 : (y < 1 ? 1 : y);
        drawNextTriangle( new Point2D( x, y ) );
    }
}

class Point2D
{
    float x, y;
    color fillColor;

    Point2D ( float xx, float yy )
    {
        x = xx; y = yy;
        fillColor = color( random(255), random(255), random(255) );
    }   
}


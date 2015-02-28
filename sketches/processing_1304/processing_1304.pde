

Line lines[] = new Line[0];
Point points[];

int grid = 5;

void setup ()
{
    size( 450, 450 );
    points = new Point[]{
        new Point(width/2, height/2)
    };
    background( 255 );
    frameRate( 5 );
}

void draw ()
{
    background( 255 );

    addRandomLine();

    fill( 255 );
    for ( int i = 0; i < lines.length; i++ )
    {
        lines[i].drawLine();
    }

    /*fill( 255, 0, 0 );
    for ( int i = 0; i < points.length; i++ )
    {
        ellipse( points[i].x, points[i].y, 3, 3 );
    }*/
}

void addRandomLine ()
{
    if ( points.length <= 0 ) return;

    for ( int p = 0; p < points.length; p++ )
    {
        Point pnt = points[p];

        int i = int( random(9) );
        while ( i == 4 )
        {
            i = int( random(9) );
        }

        Line new_line = new Line(pnt, new Point( pnt.x-grid+(i%3)*grid, pnt.y-grid+(i/3)*grid ));

        if ( new_line.p2.x > width || new_line.p2.x < 0 || 
             new_line.p2.y > height || new_line.p2.y < 0 )
        {
           points = new Point[]{
              new Point(width/2, height/2)
           };
           lines = new Line[0];
           return;
        }

        boolean occupied = false;
        for ( int l = 0; l < lines.length && occupied == false; l++ )
        {
            if ( lines[l].pointOccupied( new_line ) || lines[l].xIng( new_line )  )
            {
                occupied = true;
            }
        }
        
        if ( !occupied )
        {
            lines  = (Line[])append(lines, new_line);
            /*if ( points.length > 10 )
                points = (Point[])shorten( points );*/
            points = (Point[])append(points, new_line.p2);
        }
    }
}

class Point
{
    float x, y;

    Point ( float _x, float _y )
    {
        x = _x; 
        y = _y;
    }

    boolean equals( Point other )
    {
        return x == other.x && y == other.y;
    }

    String toString ()
    {
        return x + ", " + y;
    }
}

class Line
{
    Point p1, p2;

    Line( Point _p1, Point _p2 )
    {
        p1 = _p1;
        p2 = _p2;
    }

    void drawLine ()
    {
        line(p1.x,p1.y,p2.x,p2.y);
        //ellipse( p2.x, p2.y, 2, 2 );
    }

    boolean pointOccupied ( Line other )
    {
        if ( p1.equals( other.p2 ) || p2.equals( other.p2 ) ) return true;
        return false;
    }

    boolean xIng ( Line other )
    {
        Point pp = new Point(p1.x,p2.y), pp2 = new Point(p2.x,p1.y);
        if ( (pp.equals( other.p1 ) && pp2.equals( other.p2 )) ||
            (pp.equals( other.p2 ) && pp2.equals( other.p1 )) ) return true;
        return false;
    }

    String toString ()
    {
        return p1.toString() + " " + p2.toString();
    }
}



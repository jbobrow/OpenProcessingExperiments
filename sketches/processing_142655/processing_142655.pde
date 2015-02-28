
int numPoints = 28;

PVector[] points = new PVector[numPoints];

void setup()
{
    size( 450, 400 );
    
    for (int i = 0; i < numPoints; i++) {
        points[i] = new PVector( random(width), random(height) );
    }
    
    noLoop();
    
}

void draw()
{
    smooth();
    background(0);
    noFill();
    
    for (int i = 0; i < numPoints; i++) {
        for (int j = 0; j < numPoints; j++) {
            strokeWeight(1);
            if ( j != i ) {
                float dst = dist( points[i].x, points[i].y, points[j].x, points[j].y );
                if ( dst < 100 ) {
                    stroke( 255, 255 - dst );
                    line( points[i].x, points[i].y, points[j].x, points[j].y );
                }                
            }
        }
        stroke( 255 );
        strokeWeight(4);
        point( points[i].x, points[i].y );
    }    
}               


int numPoints = 18;

PVector[] points = new PVector[numPoints];

float radius = 150;

void setup()
{
    size( 500, 500 );
    
    float angle = TWO_PI / numPoints;
    
    for (int i = 0; i < numPoints; i++) {
        float x = cos( angle * i ) * radius;
        float y = sin( angle * i ) * radius;
        points[i] = new PVector( x, y );
    }
    
    noLoop();
    
}

void draw()
{
    smooth();
    background(0);
    fill(0);
    stroke(255, 64);
    
    translate( width/2, height/2);
    
    for (int i = 0; i < numPoints; i++) {
        for (int j = 0; j < numPoints; j++) {
            if ( j != i ) {
                line( points[i].x, points[i].y, points[j].x, points[j].y );        
            }
        }
    }    
}
                                

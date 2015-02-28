
int numPoints = 8;

PVector[] points = new PVector[numPoints];

float radius = 200;

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
    background(#058685);
    fill(#058685);
    stroke(#FAF367,50);
    
    translate( width/2, height/2);
    
    for (int i = 0; i < numPoints; i++) {
        for (int j = 0; j < numPoints; j++) {
            if ( j != i ) {
                line( points[i].x, points[i].y, points[j].x, points[j].y );        
            }
        }
    }
    
    saveFrame("images/circle-connections-"+numPoints+".png");
    
}




// The original code is from here http://vormplus.be/blog/article/processing-month-day-1-connecting-points-part-1

int numPoints = 24;

PVector[] points = new PVector[numPoints];

float radius = 150;

float randomLocation;

void setup()
{
    size( 1280, 720 );
    
    float angle = TWO_PI / numPoints;
    
    for (int i = 0; i < numPoints; i++) {
        float x = cos( angle * i ) * radius;
        float y = sin( angle * i ) * radius;
        points[i] = new PVector( x, y );
    }

    
}

void draw()
{
    smooth();
    background(0);
    fill(0);
    stroke(255, 64);
    randomLocation = random(0.000,0.099);
    translate( width/2, height/2);
    rotate((mouseX*randomLocation)/1000);
    for (int i = 0; i < numPoints; i++) {
        for (int j = 0; j < numPoints; j++) {
            if ( j != i ) {
                line( points[i].x + (randomLocation*mouseX)/width, points[i].y + (randomLocation*mouseY)/height, points[j].x + mouseX-width/2, points[j].y + mouseY-height/2);
 
            }

        }
    }
 
 
    // saveFrame("line-####.tif");  
    
}


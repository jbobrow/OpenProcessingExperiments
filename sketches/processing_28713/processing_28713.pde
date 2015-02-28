
void setup()
{
    size( 450, 400 );
    
    background(0);
    noFill();
    stroke(255);
    smooth();

    noLoop();
}

void draw()
{
    translate( width/2, height/2 );
    for (int i = 0; i < 18; i++) {
        regularPolygon( 10 + i * 10, 3 + i );
    }
}

void regularPolygon( float radius, int numPoints )
{
    float angle = TWO_PI / numPoints;
    
    beginShape();
    for (int i = 0; i < numPoints; i++) {
        float x = cos( i * angle ) * radius;
        float y = sin( i * angle ) * radius;
        vertex( x, y );
    }
    endShape(CLOSE);
}

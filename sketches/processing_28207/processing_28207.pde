
float innerRadius = 70;
float outerRadius = 180;

int numSpikes = 18;

PVector[] points = new PVector[ numSpikes * 2 ];

void setup()
{
    size( 450, 400 );
    
    float angle = TWO_PI / points.length;
    
    for ( int i = 0; i < points.length; i++ ) {
        
        float x, y;
        
        if ( i % 2 == 0 ) {
            x = cos( angle * i ) * outerRadius;
            y = sin( angle * i ) * outerRadius;
        } else {
            x = cos( angle * i ) * innerRadius;
            y = sin( angle * i ) * innerRadius;
        }
        
        points[i] = new PVector( x, y );
    }
    
    noLoop();
}

void draw()
{
    background( 0, 0, 32 );
    translate( width/2, height/2 );
    smooth();
    
    
    fill( 255, 128 ,0 );
    noStroke();
    
    beginShape();
    for (int i = 0; i < points.length; i++) {
        vertex( points[i].x, points[i].y );
    }
    endShape(CLOSE);
}               

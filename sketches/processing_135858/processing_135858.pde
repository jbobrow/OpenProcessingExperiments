
float radius = 50;

float x, y;
float prevX, prevY;

Boolean fade = true;

void setup()
{
    size( screen.width, screen.height );
    //stroke( 255 );
    
    x = width/2;
    y = height/2;
    
    prevX = x;
    prevY = y;

    stroke(255);
    strokeWeight( 2 );
    point( x, y );

}

void draw()
{
    noStroke();
    fill( 0, 20 );
    rect( 0, 0, width, height );
    
    float angle = (TWO_PI / 6) * floor( random( 6 ));
    x += cos( angle ) * radius;
    y += sin( angle ) * radius;
    
    if ( x < 0 || x > width ) {
        x = prevX;
        y = prevY;
    }
    
    if ( y < 0 || y > height) {
        x = prevX;
        y = prevY;
    }
    
    stroke(255);
    strokeWeight( 1 );
    line( x, y, prevX, prevY );
    
    strokeWeight( 3 );
    point( x, y );
    
    prevX = x;
    prevY = y;
        
}
              

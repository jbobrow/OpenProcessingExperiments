
void setup()
{
    size( 450, 400 );
    background( 0 );
    rectMode(CENTER);
    fill(0);
}

void draw()
{
    smooth();
    
    squareFlower();
    
}

void squareFlower()
{
    float x = random(width);
    float y = random(height);
    float steps = floor( random(10, 20) );
    float angle = random( 8, 20 );
    float startSize = random(80, 120);
    color c = color( 128 + random(128), 0, 0);
     
    stroke( c );
    
    pushMatrix();
    translate(x, y);
    
    for ( int i = 0; i < steps; i++ ) {
        rotate( radians( angle * i ) );
        rect( 0, 0, startSize - 5*i, startSize - 5*i);
    }
    popMatrix();
}               

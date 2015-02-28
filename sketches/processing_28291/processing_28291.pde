
float angle = 6;
int   steps = 50;
float flowerSize = 150;
float stepSize = 3;

void setup()
{
    size( 450, 400 );
    rectMode(CENTER);
    noLoop();
}

void draw()
{
    background(0);
    smooth();

    fill(0);
    stroke(255);

    translate( width/2, height/2 );
    for ( int i = 0; i < steps; i++ ) {
        rotate( radians( angle * i ) );
        rect( 0, 0, flowerSize - (stepSize * i), flowerSize - (stepSize * i) );
    }
}               

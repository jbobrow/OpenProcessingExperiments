
float angle = 8;
int   steps = 30;
float Size = 280;
float stepSize = 1;

void setup()
{
    size( 400, 600 );
    rectMode(CENTER);
    noLoop();
}

void draw()
{
    background(#192C76,213);
    smooth();

    noFill();
    stroke(#F5ED4A,150);

    translate( width/2, height/2 );
    for ( int i = 0; i < steps; i++ ) {
        rotate( radians( angle * i ) );
        rect( 0, 0,Size - (stepSize * i),Size - (stepSize * i) );
    }
}



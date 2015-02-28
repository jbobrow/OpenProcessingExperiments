

void setup ()
{
    size( 200, 200 );   
    frameRate(10);
    strokeWeight( 0.5 );
    smooth();
}

void draw ()
{
    background( 255 );

    spiral( width/2, height/2, 5, 90, (frameCount * 0.025) % 25 );
}

void spiral ( int x, int y, float radius_inner, float radius_outer, float turns )
{
    float res = 12;
    float r = 0.0;
    float d = 0.0;
    float dsteps = (360.0/res)*turns;
    int s = 0;

    beginShape();

    for ( float i = 0; i <= (360*turns); i+=res )
    {
        d = map( s, 0, dsteps, radius_inner, radius_outer );
        s++;
        r = -HALF_PI + radians( i );
        vertex( x + cos(r) * d, y + sin(r) * d );
    }

    endShape();
}




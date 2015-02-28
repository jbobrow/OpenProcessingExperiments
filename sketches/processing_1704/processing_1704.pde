

void setup ()
{
    size( 200, 200 );   
    frameRate(2);
    smooth();
    
    noStroke();
    fill( 0 );
}

void draw ()
{
    background( 255 );

    star( width/2, height/2, 45, 90, (frameCount%50)+2 );
}

void star ( int x, int y, float radius_inner, float radius_outer, int spikes )
{
    float r = 0.0;

    float res = 360.0/spikes;
    float res_half = res/2;

    beginShape();

    for ( float i = 0; i < 360; i+=res )
    {
        r = -HALF_PI + radians( i );
        vertex( x + cos(r) * radius_outer, y + sin(r) * radius_outer );
        r = -HALF_PI + radians( i+res_half );
        vertex( x + cos(r) * radius_inner, y + sin(r) * radius_inner );
    }

    endShape( CLOSE );   
}





/**
*    diese function malt eine spirale
*
*    fjenett 20090417
*/

boolean  flip = false;    

    void setup ()
    {
        size( 500, 500 );   
        strokeWeight( 0.5 );
        smooth();
    }
    
    void draw ()
    {
        background( 255 );
    
        spiral( width/2, height/2, 1, 500, 30);    //Hintere Zahl bestimmt Dichte
    }
    
    void spiral ( int x, int y, float radius_inner, float radius_outer, float turns )
    {    
        float res = 5;
        float r = 0.0;
        float d = 0.0;
        float dsteps = (360.0/res)*turns;
        int s = 0;
    
    
        for ( float i = 0; i <= (360*turns); i+=res )
        {
            d = map( s, 0, dsteps, radius_inner, radius_outer );
            s++;
            r = -HALF_PI + radians( i );
           
           ////FARBE
           fill( 255 );
           if(flip)
           fill(0);
           flip = !flip; 
           
            ellipse( x + cos(r) * d, y + sin(r) * d, 40, 40 );   //Vorderer Bereich macht die Drehung
        }
    
    noLoop();
    
    }


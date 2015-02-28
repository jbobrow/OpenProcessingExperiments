
/**
*    diese function malt eine spirale
*
*    fjenett 20090417
*/

    void setup ()
    {
        size( 500, 500 );   
        frameRate(10);
        strokeWeight( 0.5 );
        smooth();
    }
    

    void draw ()
    {
        background( 255 );
        spiral( width/2, height/2, 1, 500, 30 );

       
    }
    
    void spiral ( int x, int y, float radius_inner, float radius_outer, float turns )
    {
        float res = 5;
        float r = 0.0;
        float d = 0.0;
        float dsteps = (360.0/res)*turns;
        int s = 0;
        boolean flipflop = false;
      
    
        for ( float i = 0; i <= (360*turns); i+=res )
        {
            d = map( s, 0, dsteps, radius_inner, radius_outer );
            s++;
            r = -HALF_PI + radians( i );
            
            if ( flipflop )
            fill ( 0 );
            else
            fill( 255 );
     
            flipflop = !flipflop;
            ellipse(x + cos(r) * d, y + sin(r) * d,turns,turns);
        }
    
      
    }
    





/**
*    diese function malt eine spirale
*
*    fjenett 20090417
*/

    void setup ()
    {
        size( 800, 800 );   
        frameRate(10);
        strokeWeight( 0.5 );
        smooth();
    }
    
    void draw ()
    {
        background( 255 );

        spiral( width/2, height/2, 20, 600, 20 );
    }
    
    void spiral ( int x, int y, float radius_inner, float radius_outer, float turns )
    {  
         boolean flipflop = false;
        float res = 12;
        float r = 0.0;
        float d = 0.0;
        float dsteps = (360.0/res)*turns;
        int s = 0;
    
        beginShape();
    
        for ( float i = 0; i <= (360*turns); i+=res )
        {
            beginShape(); 
            if ( flipflop )
        fill ( 0 );
    else
        fill( 255 );
     
    flipflop = !flipflop;
            d = map( s, 0, dsteps, radius_inner, radius_outer );
            s++;
            r = -HALF_PI + radians( i );
            ellipse( x + cos(r) * d, y + sin(r) * d, 100, 100 );
            endShape(); 
            
           
        }
        
     
    
        endShape();
    }
    
    


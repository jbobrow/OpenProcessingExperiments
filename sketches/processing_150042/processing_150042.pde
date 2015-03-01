
void setup ()
{
    size( 1024, 800 /*P3D*/ ); /* , P3D */ 
    frameRate(30);
    strokeWeight( 0.5 );
    smooth();
}
 
void draw ()
{
    background( 255 );

    int SCALEDY = 255 * (pmouseY) / (height);
    int SCALEDX = 255 * (pmouseX) / (width);
//    println (SCALEDY, SCALEDX);

    int SIZE1 = SCALEDX + 125; //380;
    int SIZE2 = SCALEDX + 95; //350;
    int SIZE3 = SCALEDX + 545; //800;    
   
    int LIFECYCLE1 = SCALEDY - 180; //75;
    int LIFECYCLE2 = SCALEDY - 205; //50;
    int LIFECYCLE3 = SCALEDY - 225; //25;
    
    float SPEED1 = 0.025; //0.025; 
    float SPEED2 = 0.05;  //0.05;
    float SPEED3 = 0.075; //0.075;
    float SPEED4 = 1.025; //1.025;
    
     ellipse(width/2, height/2, 800, 800);
     rect(width/2 - 200, height/2 - 200, 400, 400);
 
    trispiral( width/2, height/2, 20, SIZE3, (frameCount * SPEED4) % LIFECYCLE1 );
    
   
    spiral( width/2 - 100, height/2 - 400, 10, SIZE1, (frameCount * SPEED1) % LIFECYCLE1 );
    spiral( width/2 + 100, height/2 - 400, 10, SIZE1, (frameCount * SPEED1) % LIFECYCLE1 );
    spiral( width/2 - 100, height/2 + 400, 10, SIZE1, (frameCount * SPEED1) % LIFECYCLE1 );
    spiral( width/2 + 100, height/2 + 400, 10, SIZE1, (frameCount * SPEED1) % LIFECYCLE1 );
    
    spiral( width/2 - 240, height/2 - 300, 10, SIZE2, (frameCount * SPEED1) % LIFECYCLE3 );
    spiral( width/2 + 240, height/2 + 300, 10, SIZE2, (frameCount * SPEED1) % LIFECYCLE3 );
    spiral( width/2 + 240, height/2 - 300, 10, SIZE2, (frameCount * SPEED1) % LIFECYCLE3 );
    spiral( width/2 - 240, height/2 + 300, 10, SIZE2, (frameCount * SPEED1) % LIFECYCLE3 );
    
//    >>> spiral( width/2, height/2 - 400, 10, 200, (frameCount * SPEED1) % LIFECYCLE2 );
//    >>> spiral( width/2, height/2 + 400, 10, 200, (frameCount * SPEED1) % LIFECYCLE2 );
    spiral( width/2 - 400, height/2, 100, SIZE1, (frameCount * SPEED2) % LIFECYCLE2 );
    spiral( width/2 + 400, height/2, 100, SIZE1, (frameCount * SPEED2) % LIFECYCLE2 );

    spiral( width/2 - 380, height/2 + 200, 10, SIZE1, (frameCount * SPEED3) % LIFECYCLE3 );
    spiral( width/2 + 380, height/2 - 200, 10, SIZE1, (frameCount * SPEED3) % LIFECYCLE3 );
    spiral( width/2 - 380, height/2 - 200, 10, SIZE1, (frameCount * SPEED3) % LIFECYCLE3 );
    spiral( width/2 + 380, height/2 + 200, 10, SIZE1, (frameCount * SPEED3) % LIFECYCLE3 );
    
}
 
void spiral ( int x, int y, float radius_inner, float radius_outer, float turns )
{
    float res = 33; //12; - default  33; - add squareness 
    float r = 0.0;
    float d = 0.0;
    float dsteps = (360.0/res)*(2*turns);  ///*turns;
    int s = 20; ////0; ///80; ///20;
 
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

void trispiral ( int x, int y, float radius_inner, float radius_outer, float turns )
{
    float res = 150; ///120; - triangle 0; - circle 
    float r = 0.0;
    float d = 0.0;
    float dsteps = (360.0/res)*turns;  ///*(3*turns); *turns;
    int s = 0; ////0; ///80;
 
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




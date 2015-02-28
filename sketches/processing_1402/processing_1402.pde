
/**
*    Verrückte Uhren
*
*    fjenett 20090402
*/

import processing.pdf.*;

void elementMalen1 ()
{
    strokeWeight( grid_size/8 );
    stroke( 0 );
    
    for ( int i = 0; i < 2; i++ )
    {
        float rw = random(-grid_size,grid_size);
        float rh = random(-grid_size,grid_size);
        
        line( 0,0, rw, rh );
    }
}



void elementMalen2 ()
{
    strokeWeight( grid_size/16 );
    stroke( 255, 0, 0 );
    
    for ( int i = 0; i < 2; i++ )
    {
        float rw = random(-grid_size,grid_size);
        float rh = random(-grid_size,grid_size);
        
        line( 0,0, rw, rh );
    }
}



// --------------------------------------------------------------- //


int     grid_size  = 105;

boolean flip       = false;
boolean flop       = false;

boolean savePDF    = false;



void setup ()
{
    size( 1260, 840 );
}



void draw ()
{
    if ( savePDF ) beginRecord( PDF, "muster_02_fjenett_01.pdf" );
    
    background( 255 );
    
    for ( int ix = 0; ix < (width/grid_size); ix = ix+1 )
    {
        flip = flop;
        
        flop = !flop;
        
        for ( int iy = 0; iy < (height/grid_size); iy++ )
        {
            pushMatrix();
            
                translate( ix*grid_size + (grid_size/2), iy*grid_size + (grid_size/2) );
                
                if ( flip )
                {
                    elementMalen1();
                }
                else
                {
                    elementMalen2();
                }
                
                flip = !flip;
                
            popMatrix();
        }
    }
    
    if ( savePDF ) endRecord();

    noLoop();
}

void mousePressed ()
{
    redraw();   
}


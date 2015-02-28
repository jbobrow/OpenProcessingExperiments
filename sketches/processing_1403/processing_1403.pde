
/**
*    Kreise und Sterne ..
*
*    fjenett 20090402
*/

import processing.pdf.*;  


void elementMalen1 ()
{
    noStroke();
    fill( 0 );
    
    beginShape();
    for ( int i = 0; i < 12; i++ )
    {
        vertex( cos(radians(i*30))*grid_size/2, sin(radians(i*30))*grid_size/2 );
    }
    endShape(CLOSE);
}


void elementMalen2 ()
{
    noStroke();
    fill( 120 );
    
    beginShape();
    for ( int i = 0; i < 6; i++ )
    {
        vertex( cos(radians(i*60))*grid_size/3,       sin(radians(i*60))*grid_size/3       );
        vertex( cos(radians((i+0.5)*60))*grid_size/4, sin(radians((i+0.5)*60))*grid_size/4 );
    }
    endShape(CLOSE);
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
    if ( savePDF ) beginRecord( PDF, "muster_03_fjenett_01.pdf" );
    
    background( 255 );
    
    for ( int ix = 0; ix < (width/grid_size); ix = ix+1 )
    {
        flip = flop;
        
        flop = !flop;
        
        for ( int iy = 0; iy < (height/grid_size); iy++ )
        {
            pushMatrix();
            
                translate( ix*grid_size, iy*grid_size );
                translate( grid_size/2, grid_size/2 );
                
                scale( map( iy, 0, (height/grid_size), 1.1, 0.1 ) );
                
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


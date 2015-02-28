
/**
*    Fülle die Funktion elementMalen() mit einer eigenen Form.
*
*    fjenett 20090402
*/


import processing.pdf.*;


void elementMalen ( )
{
    strokeWeight( random( grid_size/2 ) );
    
    if ( random(1) > 0.5 )
        line( 0,0, grid_size, grid_size );
    else
        line( 0,0, -grid_size, grid_size );
}


// --------------------------------------------------------------- //


int grid_size = 105;
boolean savePDF = false;


void setup ()
{
    size( 1260, 840 );
}


void draw ()
{
    if ( savePDF ) beginRecord( PDF, "muster_01_fjenett_02.pdf" );
    
    background( 255 );
    
    for ( int ix = 0; ix < (width/grid_size); ix = ix+1 )
    {
        for ( int iy = 0; iy < (height/grid_size); iy++ )
        {
            pushMatrix();
                translate( ix*grid_size, iy*grid_size );
                
                elementMalen();
                
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



float grid_height;
float grid_width;

void setup ()
{   size( 517, 517 );
    grid_height = height/8.0;
    grid_width = width/8.0;
}
void qua ()
{ rectMode( CORNER ); rect (0,0,grid_width,grid_height ); }
void dia ()
{ line (0,grid_height, grid_width, 0); }
void lin ()
{ for (float l=0; l <= grid_height+grid_height/9; l=l+grid_height/9)
   { line (0,l,grid_width,l); } 
}
void draw ()
{   background( 255 );
    for ( int ix = 0; ix < 8; ix = ix+1 )  
    { for ( int iy = 0; iy < 8; iy++ )  
        { pushMatrix();                                  
                translate( ix*grid_width, iy*grid_height );   
                if ( 46 > random(1,100))
                {lin();}
                else if ( 42 > random(1,100))
                {dia();}
                else
                {qua();}
          popMatrix(); }
    }
noLoop();   }





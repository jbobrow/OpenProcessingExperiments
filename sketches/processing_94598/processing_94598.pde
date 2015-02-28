
/* 
Part of the ReCode Project (http://recodeproject.com)
Based on "Untitled 7" by Belfort Group
Originally published in "Computer Graphics and Art" v1n3, 1976
Copyright (c) 2013 Jan Vantomme - OSI/MIT license (http://recodeproject/license).
*/

/* @pjs pauseOnBlur="true"; */

int blockWidth  = 10;
int blockHeight = 10;

int h1;
int h2;
int h3;

int probability;

void setup()
{
    size( 800, 800 );

    h1 = floor( random( 2, 20 ) ) * 2;
    h2 = floor( random( 2, 20 ) ) * 2;
    h3 = 80 - h1 - h2;
    probability = floor( random( 30, 40 ));
}

void draw()
{
    background( 0 );
    
    for ( int x = 0; x < width; x += blockWidth ) {
        if ( random( 100 ) < probability ) {
            for ( int i = 0; i < h1; i+=2 ) {
                pushMatrix();
                translate( x, i * blockHeight );
                rect( 0, 0, blockWidth, blockHeight );
                popMatrix();
            }
        }    
    } 

    for ( int x = 0; x < width; x += blockWidth ) {
        if ( random( 100 ) < probability ) {
            for ( int i = 0; i < h2; i+=2 ) {
                pushMatrix();
                translate( x, i * blockHeight + h1 * blockHeight );
                rect( 0, 0, blockWidth, blockHeight );
                popMatrix();
            }
        }    
    }
    
    for ( int x = 0; x < width; x += blockWidth ) {
        if ( random( 100 ) < probability ) {
            for ( int i = 0; i < h3; i+=2 ) {
                pushMatrix();
                translate( x, i * blockHeight + ( h1 + h2 ) * blockHeight );
                rect( 0, 0, blockWidth, blockHeight );
                popMatrix();
            }
        }    
    } 
    
    noLoop();
}

void mousePressed()
{
    h1 = floor( random( 2, 20 ) ) * 2;
    h2 = floor( random( 2, 20 ) ) * 2;
    h3 = 80 - h1 - h2;
    probability = floor( random( 30, 40 ));

    loop();
}


/*
*    geomerative examples ..
*    http://www.ricardmarxer.com/geomerative/
*
*    fjenett - 2009-05-22
*/

import geomerative.*;

float xd, yd;
float x, y;

RShape shp;

void setup ()
{
    size( 400, 400 );
    
    RG.init( this );
    
    xd = random( -5, 5 );
    yd = random( -5, 5 );
    x = width/2;
    y = height/2;
    
    shp = new RShape();
    
    smooth();
}

void draw ()
{
    background( 120 );

    move();

    RShape elli = RG.getEllipse( x, y, random( 2, 20 ) );
    shp = RG.union( shp, elli );
    
    RG.shape( shp );
}

void move ()
{
    x += xd;
    if ( x > width || x < 0 )
        xd *= -1;
    y += yd;
    if ( y > height || y < 0 )
        yd *= -1;
}


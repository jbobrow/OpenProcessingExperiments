
float wx, wy, wdx, wdy, wdim;
float bx, by, bdx, bdy, bdim;
color wCenter, wMiddle, wOuter;
color bCenter, bMiddle, bOuter;
color backgroundColor;

void setup( )
{
  size( 600, 600 );
  wx = wy = bx = by = width*.5;
  wdim = bdim = width*.2;
  wdx = random( 2, 8 );
  wdy = random( 2, 8 );
  bdx = random( 2, 8 );
  bdy = random( 2, 8 );
  
  wCenter = color( random(255), random(255), random(255) );
  wMiddle = color( random(255), random(255), random(255) );
  wOuter = color( random(255), random(255), random(255) );
  bCenter = color( random(255), random(255), random(255) );
  bMiddle = color( random(255), random(255), random(255) );
  bOuter = color( random(255), random(255), random(255) );
  
  backgroundColor = color( 0, 10 );
  
  rectMode( CENTER );
  //noStroke( );
}

void draw( )
{
  // draw background
  //fill( backgroundColor );
  //rect( width*.5, height*.5, width, height );
  // move targets
   // wrapping target
  wx += wdx;
  if (wx > width + wdim*.5 )
  {
      wx = -wdim*.5; 
  }
  wy += wdy;
  if (wy > height + wdim*.5 )
  {
      wy = -wdim*.5; 
  }
   // bouncing targets
   bx += bdx;
  if (bx+bdim*.5 > width || bx < bdim*.5 )
  {
      bdx = -bdx; 
  }
  by += bdy;
  if (by+bdim*.5 > height || by < bdim*.5 )
  {
      bdy = -bdy; 
  }
  
  // drawTargets
   // wrapping targets
   fill( wOuter );
   rect( wx, wy, wdim, wdim);
   fill( wMiddle );
   rect( wx, wy, wdim*.66, wdim*.66);
   fill( wCenter );
   rect( wx, wy, wdim*.33, wdim*.33);
   // bouncing targets
   fill( bOuter );
   ellipse( bx, by, bdim, bdim);
   fill( bMiddle );
   ellipse( bx, by, bdim*.66, bdim*.66);
   fill( bCenter );
   ellipse( bx, by, bdim*.33, bdim*.33);    
}




size(400,400);
background(130);
smooth();


int originX = width/2;
int originY = height/2;
int ellipseSize = 40;

fill ( 255, 0, 0);
ellipse( originX, originY, ellipseSize, ellipseSize );
ellipse( originX+100, originY, ellipseSize, ellipseSize );
ellipse( originX+200, originY, ellipseSize, ellipseSize );


fill ( 0, 255, 0);
for ( int i=0; i<30 ; i++ ) { 
  println( i );
  ellipse( originX, originY+(i*5), ellipseSize, ellipseSize );
}


fill ( 0, 0, 255);
for ( int i=0; i<130 ; i++ ) { 
  println( i );
  ellipse( random(width), random(height), ellipseSize, ellipseSize );
}

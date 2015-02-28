
//Homework 5

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA


//try to move the circle around the grid of circles
//moving the mouse makes the circle change size
//press [w] to make circles in grid larger
//press [s] to make circles in grid smaller


//circle grid
float circlecenter1x ;
float circlecenter1y ;
float circlecenter2x ;
float circlecenter2y ;
float circlecenter3x ;
float circlecenter3y ;
float circlecenter4x ;
float circlecenter4y ;
float circlecenter5x ;
float circlecenter5y ;
float circlecenter6x ;
float circlecenter6y ;
float circlecenter7x ;
float circlecenter7y ;
float circlecenter8x ;
float circlecenter8y ;
float circlecenter9x ;
float circlecenter9y ;
//circle mouse
float circlesizex ;
float circlesizey ;

//grid circle color
color circleclr ;
// mouse circle color
color circleclr2 ;










void setup ()
{  size (400, 400);
smooth ();
frameRate (05) ;
ellipseMode (CENTER);

circlesizex = 50 ;
circlesizey = 50 ;
circleclr = color ( random (155), random (155), random (155, 200) );
circleclr2 = color ( random (155, 200), random (155), random (155) );
}


void draw ()
{  background ( 255, 255, 255) ;
noStroke ();

//circle grid variables
circlecenter1x = width * .25 ;
circlecenter1y = height * .25 ;
circlecenter2x = width * .5 ;
circlecenter2y = height * .25 ;
circlecenter3x = width * .75 ;
circlecenter3y = height * .25 ;
circlecenter4x = width * .25 ;
circlecenter4y = height * .5 ;
circlecenter5x = width * .5 ;
circlecenter5y = height * .5 ;
circlecenter6x = width * .75 ;
circlecenter6y = height * .5 ;
circlecenter7x = width * .25 ;
circlecenter7y = height * .75 ;
circlecenter8x = width * .5 ;
circlecenter8y = height * .75 ;
circlecenter9x = width * .75 ;
circlecenter9y = height * .75 ;

//circle grid
metrica ( circlecenter1x, circlecenter1y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter2x, circlecenter2y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter3x, circlecenter3y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter4x, circlecenter4y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter5x, circlecenter5y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter6x, circlecenter6y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter7x, circlecenter7y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter8x, circlecenter8y, circlesizex, circlesizey, circleclr );
metrica ( circlecenter9x, circlecenter9y, circlesizex, circlesizey, circleclr );
//mouse circle
metrica ( mouseX, mouseY, mouseX - mouseY, mouseY - mouseX, circleclr2 );
}










void metrica ( float metricaposx, float metricaposy, float metricasizex, float metricasizey, color metricaclr )
{
  noStroke ();
  fill (metricaclr);
//circle
  ellipse ( metricaposx, metricaposy, metricasizex, metricasizey);  
//curve design
  stroke (255, 255, 255);
  strokeWeight (4);
  noFill ();
  beginShape( );
  curveVertex( metricaposx , metricaposy - metricasizey*1.5 );
  curveVertex( metricaposx , metricaposy - metricasizey*.4 );
  curveVertex( metricaposx + metricasizex*.2 , metricaposy - metricasizey*.25 );
  curveVertex( metricaposx + metricasizex*.4 , metricaposy );
  curveVertex( metricaposx , metricaposy + metricasizey*.25 );
  curveVertex( metricaposx - metricasizex*.5 , metricaposy - metricasizey);
  endShape( );
  beginShape( );
  curveVertex( metricaposx + metricasizex*.5 , metricaposy - metricasizey );
  curveVertex( metricaposx , metricaposy - metricasizey*.15 );
  curveVertex( metricaposx - metricasizex*.2 , metricaposy - metricasizey*.25 );
  curveVertex( metricaposx - metricasizex*.4 , metricaposy );
  curveVertex( metricaposx , metricaposy + metricasizey*.15 );
  curveVertex( metricaposx - metricasizex*.5 , metricaposy - metricasizey*.5);
  endShape( );
}










void keyPressed ()
{
if (key == 'w' )
  {  circlesizex = circlesizex + 10;
    circlesizey = circlesizey + 10 ;
  }
if (key == 's' )
  {  circlesizex = circlesizex - 10;
    circlesizey = circlesizey - 10 ;
  }
}



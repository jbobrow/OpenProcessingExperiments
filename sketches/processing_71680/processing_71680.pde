
//Homework 6

//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittsburgh, PA


// press [any key] to randomly change the figures' starting position, movement speed, size, and color
// click mouse to reset the background to a clean slate

//notes and global variables hurr
//position start variables
float figurepos1x;
float figurepos1y;
float figurepos2x;
float figurepos2y;
//figure size variables
float figuresize1;
float figuresize2;
//move speed variables
float figurespeed1x ;
float figurespeed1y ;
float figurespeed2x ;
float figurespeed2y ;
// color variables
color figureColor1 ;
color figureColor2 ;





void setup ()
{  size (400, 400);
smooth ();
ellipseMode (CENTER);
background ( 255, 255, 255) ;

//position start variables
figurepos1x = random (100,300);
figurepos1y = random (100, 300);
figurepos2x = random (100,300);
figurepos2y = random (100, 300);
//figure size variables
figuresize1 = random (50, 100);
figuresize2 = random (50, 100);
//move speed variables
figurespeed1x = random(5);
figurespeed1y = random(5);
figurespeed2x = random(5);
figurespeed2y = random(5);
// color variables
figureColor1 = color (random (255), random(255), random(255));
figureColor2 = color (random (255), random(255), random(255));
}






void draw ()
{
lineConnector ();
//figure 1
metrica (figurepos1x, figurepos1y, figuresize1, figuresize1, figureColor1);
bounceHorizontal ();
bounceVertical ();
//figure 2
metrica (figurepos2x, figurepos2y, figuresize2, figuresize2, figureColor2);
wrapHorizontal ();
wrapVertical ();
}




void mousePressed ()
{
background ( 255, 255, 255) ;
}

void keyPressed ()
{
//position start variables
figurepos1x = random (100,300);
figurepos1y = random (100, 300);
figurepos2x = random (100,300);
figurepos2y = random (100, 300);
//figure size variables
figuresize1 = random (50, 100);
figuresize2 = random (50, 100);
//move speed variables
figurespeed1x = random(5);
figurespeed1y = random(5);
figurespeed2x = random(5);
figurespeed2y = random(5);
// color variables
figureColor1 = color (random (255), random(255), random(255));
figureColor2 = color (random (255), random(255), random(255));
}

void lineConnector ()
  {strokeWeight (2) ;
  stroke (255, 255, 255);
  line (figurepos1x, figurepos1y, figurepos2x, figurepos2y);
  }

void wrapVertical ()
  {  figurepos2y = (figurepos2y + figurespeed2y ) ;
  if (figurepos2y  - (.5*figuresize2) > width)
    { figurepos2y = 0 - (.5*figuresize2) ;
    }
  }
  
void wrapHorizontal ()
  {  figurepos2x = (figurepos2x + figurespeed2x ) ;
  if (figurepos2x  - (.5*figuresize2) > width)
    { figurepos2x = 0 - (.5*figuresize2) ;
    }
  }

void bounceVertical ()
{
  figurepos1y = (figurepos1y + figurespeed1y ) ;
  if (figurepos1y + (.5*figuresize1) > width ) 
  { 
  figurespeed1y = -figurespeed1y; 
  }
  if (figurepos1y - (.5*figuresize1) < 0 )
  { 
  figurespeed1y = -figurespeed1y; 
  }
}

void bounceHorizontal ()
{
  figurepos1x = (figurepos1x + figurespeed1x) ;
  if (figurepos1x  + (.5*figuresize1) > width ) 
  { 
  figurespeed1x = -figurespeed1x; 
  }
  if (figurepos1x - (.5*figuresize1) < 0 )
  { 
  figurespeed1x = -figurespeed1x; 
  }
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


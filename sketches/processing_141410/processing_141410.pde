
//ICE 15
//Old Exam 2 version 0
//Question 1
//Copyright Miranda Jacoby 2014, All Rights Reserved

color c1, c2, c3; 
 
void setup( ) 
{ 
 size( 400, 400 ); 
 c1 = color( 200, 0, 0 ); // red 
 c2 = color( 0, 200, 0 ); // green 
 c3 = color( 0, 0, 200 ); // blue 
 strokeWeight( 3 ); 
 ellipseMode( CORNER ); 
} 
 
void draw( ) 
{ 
 background( 200 ); 
 design( 100, 100, 90, c1, c2 ); // smaller design 
 design( 180, 200, 165, c1, c3 ); // larger design 
 noLoop( ); 
}

void design( float xpos, float ypos, float diam, color fillR, color fillC )
{
  fill(fillR);
  rect(xpos, ypos, diam, diam); //add fillR as a fith value for some cool graphics
  fill(fillC);
  ellipse(xpos, ypos, diam/2, diam/2);
  fill(0);
  line(xpos + diam, ypos, xpos, ypos + diam);
}



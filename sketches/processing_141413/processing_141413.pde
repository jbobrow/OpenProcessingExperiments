
//ICE #16
//Exam 2 Version 0
//Question 2

int [ ] xCoords = { 100, 200, 270 }; 
int [ ] yCoords = { 270, 200, 85 }; 
int [ ] dimensions = { 50, 70, 100 }; 
 
color [ ] colorListRect = { color( 200, 0, 0 ), // rect color 
 color( 0, 0, 200 ), 
 color( 0, 200, 0 ) 
 }; 
color [ ] colorListEllipse = { color( 200, 200, 0 ), // ellipse color 
 color( 0, 200, 200 ), 
 color( 200, 200, 0 ) 
 }; 
void setup( ) 
{ 
 size( 400, 400 ); 
 strokeWeight( 3 ); 
 ellipseMode( CORNER ); 
} 
 
void draw( ) 
{ 
 background( 200 ); 
 drawAllDesigns( ); 
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
 void drawAllDesigns( )
 {
   for (int i = 0; i < xCoords.length; i++ )
   {
     design(xCoords[i], yCoords[i], dimensions[i], colorListRect[i], colorListEllipse[i]);
   }
 }




//Homework #5, Section A
//Copyright Miranda Jacoby 2014 All Rights Reserved
//Contact: majacoby@andrew.cmu.edu

//This code makes two circles travel around the perimiter of the program winodw. 
//Shape 1 travels at a constant speed while Shape 2 gains speed.

//Setting global variables 
//Shape 1 and Shape 2 diameter and location
float diam, diam2, x, y, x2, y2; 
//Shape 1 and Shape 2 velocites along x and y axis
float dx, dy, dx2, dy2; 
//Shape 1 and Shape 2 states to determine direction change
int state, state2;

void setup( )
{
  size(400, 400);
  smooth();
  background(0);
  noStroke();
  diam = 40;
  diam2 = 40;
  x = diam/2;
  y = diam/2;
  dx = 0;
  dy = 0;
  x2 = width - diam/2;
  y2 = width - diam/2;
  dx2 = 0;
  dy2 = 0;
  state = 0;
  state2 = 2;
  
}

void draw( ) 
{ 
 prepWindow( ); 
 moveFigures( ); 
 drawFigures( ); 

}
//Creates transparency
void prepWindow( )
{
  fill(0, 10);
  rect(0, 0, width, height);
}

//Moves and changes direction of Shape 1 and Shape 2 relative to the window
void moveFigures( )
{
//Shape 1
    x = x + dx;
    y = y + dy;
   //State your states (defiens what each state does.)
      //Shape 1 goes right   
      if (state == 0) {
         dx = 1; 
         dy = 0;
            //Make a 90-degree turn when the top right side is reached
            if (x > width - diam/2) {
              x = width - diam/2;
              state = 1;
            }
      }
      //Shape 1 goes down
      else if (state == 1) {
        dx = 0;
        dy = 1;
           //Make a 90-degree turn when the bottom right side is reached
           if (y > height - diam/2) {
             y = height - diam/2;
             state = 2;
           }
      }
      //Shape 1 goes left
      else if (state == 2) {
        dx = -1; 
        dy = 0;  
           //Make a 90-degree turn when the bottom left side is reached
           if ( x < width - (width - diam/2)) {
             x = width - (width - diam/2);
             state = 3;
           }
      }
      //Shape 1 goes up
      else if (state == 3) {
        dx = 0; 
        dy = -1;
           //Make a 90-degree turn when the to left side is reached
           if (y < height - (height - diam/2)) {
             y = height - (height - diam/2);
             state = 0;
           }
      }
//Shape 2
    x2 = x2 + dx2;
    y2 = y2 + dy2;

   //State your states (defiens what each state does.)
      //Shape 2 goes right   
      if (state2 == 0) {
         dx2 = 2; 
         dy2 = 0;
            //Make a 90-degree turn when the top right side is reached
            if (x2 > width - diam2/2) {
              x2 = width - diam2/2;
           
              state2 = 1;
            }
      }
      //Shape 2 goes down
      else if (state2 == 1) {
        dx2 = 0;
        dy2 = 2;
           //Make a 90-degree turn when the bottom right side is reached
           if (y2 > height - diam2/2) {
             y2 = height - diam2/2;
             
             state2 = 2;
           }
      }
      //Shape 2 goes left
      else if (state2 == 2) {
        dx2 = -2; 
        dy2 = 0;  
           //Make a 90-degree turn when the bottom left side is reached
           if ( x2 < width - (width - diam2/2)) {
             x2 = width - (width - diam2/2);
         
             state2 = 3;
           }
      }
      //Shape 2 goes up
      else if (state2 == 3) {
        dx2 = 0; 
        dy2 = -2;
           //Make a 90-degree turn when the to left side is reached
           if (y2 < height - (height - diam2/2)) {
             y2 = height - (height - diam2/2);
       
             state2 = 0;
           }
      }    
}

//Specifies variables used to draw Shape 1 and Shape 2
void drawFigures ()
{
  figure(x, y, diam, diam);
  figure(x2, y2, diam2, diam2);
}
//Parameters for function 'figure', draws a red circle. 
void figure (float x, float y, float diamx, float diamy)
{
  fill(200, 0, 0);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x, y, diamx, diamy);
}





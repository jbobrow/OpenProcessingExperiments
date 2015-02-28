
//declare global variables
float xpos, ypos;    // Starting position of shape    

float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void setup ()
{
  
size (200, 200);// declare size of processing window

}

//void draw()

// 


void draw ()
{
  background(0);// background black
 
   xpos = xpos + ( xspeed * xdirection );// initialise xpos movement
  ypos = ypos + ( yspeed * ydirection );// initialise ypos movment
  
  if (xpos > width-10 || xpos < 0) {
    xdirection *= -1;// keeps shape from going further than the window size
   }
  if (ypos > height-10 || ypos < 0) {
    ydirection *= -1;     
  }
  
  {      
    
    
    if((mouseX < 90 || mouseX > 110) && (mouseY<90 || mouseY>110))//if the mouse is outside of these co-ordinates the shape will draw and animate
     {
       // Draw the shapes and color them white
  ellipse(xpos, ypos, 10, 10);
  line(xpos, ypos, xpos + 10, ypos + 10);
  ellipse(xpos + 20, ypos + 20, 10, 10);
  triangle(100, 100, xpos + 5, ypos + 5, xpos + 20, ypos + 20);
  fill(255);
 }else{background(0);}
 

 }
   
}

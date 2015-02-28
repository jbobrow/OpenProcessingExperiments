
// Variables to  store the x,y coordinates of ellipse or circle
float circleX;
float circleY;

/* The setup function is called once at the beginning
   and is a place where you define properties of the window
   (size and background color) and also assign default values to
   variables.
*/
void setup() 
{
  /* Set size of the window using the 'size' function. 
     You can now use the processing variables 'width' and 'height' 
     anywhere in the program. 
  */
  size(720, 546);
  
  /* Set the background color of the window using the 'background'
     function. It takes R, G, B values
  
  */
  background(0, 0, 0);

  // Assign the center coordinates for drawing the ellipse.
  // We are using the width and height variables and dividing them
  // by 2
  circleX = width/2;
  circleY = height/2;
}

/* In processing the default frameRate  is 60 fps. The 'draw' function
   is called 60 times in a second to draw things on the screen.
*/
void draw()
{
  // Draws an ellipse filled with yellow color at the center of the screen
  fill(255, 255, 0);
  ellipse(circleX, circleY, 100, 50);

  // Draws a red circle at the origin. We only see a quarter of the circle
  // since we are drawing only the posivite x and y axes
  fill(255, 0, 0);
  ellipse(0, 0, 40, 40);
}



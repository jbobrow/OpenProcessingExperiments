
void setup()  //this is run once at the beginning of the program
{  
  size(600, 600);  //makes a window 600 by 600
  stroke(255);  //set the line color to white
}

void draw()  //this is run continuously once setup has been run once
{
  background(0); //sets the background to black before drawing a new tree  
  float angle = atan2(mouseX-width/2, mouseY-height/2);  //set the tree angle based on the mouse position
  fractal(width/2, height/2, 100, angle, angle, 0.7f, 10, 1f);
}

//This is a recursive function.  The function is called inside the function itself.
//Each time the function is called, it draws a line and then calls the function with 
//the coordinates at the end of the line.  The function will only run more copies of itself if the iteration
//number is greater than 0, otherwise it would go on forever.  Each branch is made smaller than is parent
//by multiplying it by the rate variable (0.7 in this example)
void fractal(float startX, float startY, float branchLength, float branchAngle, float angle, float rate, int interationNum, float col)
{
  //calculates the end position of the line based on the branches angle and length
  float endX = startX + sin(branchAngle)* branchLength;
  float endY = startY + cos(branchAngle)* branchLength;

  line(startX, startY, endX, endY);  //draws a line from the pos to endpos  

  //checks if another set a branches should be drawn.  
  if (interationNum > 0)
  {
    //draws one of the sub branches
    fractal(endX, endY, branchLength * rate, branchAngle + angle, angle, rate, interationNum - 1, col * rate);
    //draws the other sub branch.  Note the only difference is the angle 
    fractal(endX, endY, branchLength * rate, branchAngle - angle, angle, rate, interationNum - 1, col * rate);
  }
}

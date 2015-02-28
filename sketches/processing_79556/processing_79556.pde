
/*Note to students: You will need to divide your screen into an 8x8 grid to send values to MaxMSP
for the end term project. Depending on what section the ball is located, a number should be sent to maxMSP.
 
The following example should aid you, as the grid layout is partly done. The example demonstrates the use of nested if statements; the outer conditionals it divide the screen into 4x4 quadrants (top left, top right, bottom left, bottom right) and the inner statements should divide the divided sections into 4x4 as well. The first quadrant is already divided up for you, and the last quadrant is half completed. In this example, a rectangle is drawn in the section that the cursor is located.
 
Q: Complete this code to complete the division of the screen into 8x8 quadrants. Depending on which quadrant the mouse is located, a rectangle should draw in that section.
 
Q. In your pong game, create a function called int gridLayout(int px, int py). This function should pass in two arguments - the x position of the ball and the y position of the ball.
 
Q: Place all the code for creating the grid in this function. Modify your existing code so that a grid number is returned depending on what quadrant the BALL (not cursor) is located in. The returned grid number should be stored in a variable called int gridLayout, and send to MaxMSP via OSC.
*/


void setup()
{
  size(400, 400);
}

void draw()
{
  background(0);
  if(mouseX < width/2 && mouseY < height/2) //if mouse is in top left quarter
  {
    if (mouseX < width/4 && mouseY < height/4) //if mouse is in box 1 (see figure 1 in end term assignment)
    {
      rect(0, 0, width/4, height/4);
      println("The mouse is located in box 1 (figure 1)");
    }
    else if (mouseX > width/4 && mouseY < height/4) //if mouse is in box 2
    {
      rect(width/4, 0, width/4, height/4);
      println("The mouse is located in box 2 (figure 1)");
    }
    else if (mouseX < width/4 && mouseY > height/4) //if mouse is in 5
    {
      rect(0, height/4, width/4, height/4);
      println("The mouse is located in box 5 (figure 1)");
    }
    else //if mouse is in box 6
    {
      rect(width/4, height/4, width/4, height/4);
      println("The mouse is located in box 6 (figure 1)");
    }
  }
  else if(mouseX > width/2 && mouseY < height/2) //if mouse is in top right quarter
  {
  }
  else if(mouseX < width/2 && mouseY > height/2) //if mouse is in bottom left quarter
  {
  }
  else //if mouse is in bottom right quarter
  {
    if (mouseX < width/4*3 && mouseY < height/4*3)
    {
      rect(width/2, height/2, width/4, height/4);
      println("The mouse is located in box 11 (figure 1)");
    }
    else if (mouseX > width/4*3 && mouseY < height/4*3)
    {
      rect(width/4*3, height/2, width/4, height/4);
      println("The mouse is located in box 12 (figure 1)");
    }
  }
}

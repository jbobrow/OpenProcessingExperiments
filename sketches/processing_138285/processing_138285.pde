
//The Grey Areas in Between

/*
Artistic Description:
Grey and white circles morph together into tubes in this interactive sketch. 
A sense of distance and shadow is created due to the size and shape of the tubes 
as they move across the canvas. 

User Guide:
This program allows the user to drag the mouse and
make a variety of circles across the page.
The size of the circle is determined by where your mouse is on the x and y axes. 
Press and hold number keys 1-4 to change the color of the circles. 
When you release a key, the circles will return to being drawn filled with white.
Press 'S' or 's' to make a screenshot. (if this does not work it is because you 
you have not saved the code in processing. Save the code and then try again.)
Press DELETE or BACKSPACE to erase the canvas and start over.

Tips:
Try making a spiral
  -from the center outwards
  -from the outside inwards
Try making an X through the center

*/

//Setup
void setup()
{
  size(1280, 720);
  background(#748483);
}

void keyPressed()
{
//Save and Delete
if (key== 's' || key== 'S')
    {
      saveFrame("screenshot.png");
    }
if (key== BACKSPACE || key== DELETE)
    {
      background(#748483);
    }
//Change Color 
if (key=='1')
    {
      fill(116, 132, 131, 70);
    }
if (key=='2')
    {
      fill(65, 74, 73, 70);
    }
if (key=='3')
    {
      fill(42, 48, 48, 70);
    }
if (key=='4')
    {
      noFill();
    }
}

void keyReleased()
//Default Color
{
  fill(#FFFFFF);
}

void mouseDragged()
{ 
   stroke(0, 0, 0, 50);
   ellipse(mouseX, mouseY, mouseX-width/2, mouseY-height/2);     
}

void draw()
{}

//END CODE



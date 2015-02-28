
//Morgan D
//Computer Programming 1, Mods (13) 14-15
//Rotating Cube
//URL -> padova.webs.com/SmoothRotateSite.html

//This program is designed to rotate a 3D object smoothly based on the dragging of the user's mouse.

//These store the angles by which the axes are rotated.
float angleX = -.5;
float angleY = .5;

//These store the starting coordinates of the user's drag.
int startX;
int startY;

//These store the ending coordinates of the user's drag.
int endX;
int endY;

//This stores whether or not the user is currently dragging.
boolean dragging = false;

void setup()
{
  size(300, 300, P3D);
  
  //These reorients the origin to the center of the screen, and the axes to their initial values.
  translate(150, 150, 0);
  rotateX(angleX);
  rotateY(angleY);
  
  //These draw the box in its initial orientation (I did this in setup to get rid of the pre-draw lag time).
  background(0);
  box(100);
}

void draw()
{
  //These reorient the axes to their current orientation.
  translate(150, 150, 0);
  rotateX(angleX);
  rotateY(angleY);
  
  //This draws the box in its current orientation.
  background(0);
  box(100);
}

void mouseDragged()
{
  //This resets the current startpoint to the old endpoint, to follow the user's drag.
  startX = endX;
  startY = endY;
  
  //This sets the new endpoint to the current mouse position.
  endX = mouseX-150;
  endY = mouseY-150;
  
  //This sets the enpoints equal if the user has only just begun to drag.
  if (!dragging)
  {
    startX = endX;
    startY = endY;
  }
  
  //This changes the angles based on the current endpoints of the user's drag.
  angleX += findAngle(startY, endY);
  angleY -= findAngle(startX, endX);
  
  //This sets the dragging to true; clearly it must be, if the user is dragging.
  dragging = true;
}

void mouseReleased()
{
  //This ends the dragging phase if the user stops pressuing the mouse.
  dragging = false;
}

//This uses the law of cosines to calculate the angle between the origin and the endpoints of the user's drag.
float findAngle(int point1, int point2)
{
  //This establishes the z-center as 250.
  int depth = 250;
  
  //These use the pythagorean theorem to set the lengths of the segments joining the endpoints to the origin.
  float side1 = sqrt(sq(depth)+sq(point1));
  float side2 = sqrt(sq(depth)+sq(point2));
  
  //This sets the (signed so the angle will be) length of the line connecting the endpoints in one dimension.
  float side3 = point1-point2;
  
  //This finds the angle at the origin of a triangle with side lengths side1, side2, and side3; it is signed to match side3.
  float angle = (side3>0)? acos((sq(side1)+sq(side2)-sq(side3))/(2*side1*side2)) : -acos((sq(side1)+sq(side2)-sq(side3))/(2*side1*side2));
  
  return angle;
}

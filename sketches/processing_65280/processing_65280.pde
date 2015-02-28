
//GIOVANNA CASTRO
//INTERACTIVITY 28
//JULY 5th, 2012

//OVERALL DETAILS
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float er = 53;  // ellipse radius
  
void setup()
{
  size(640, 360);
  smooth();
  ellipseMode(RADIUS);
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
//THE ACTIONS

void draw() 

//THE FIRST CURLY
{
//THE FIRST CURLY

//DETAILS about the action
background(102);

  
//TOUCH THE RECTANGLE AND THIS IS WHAT HAPPENS
  
rect(rx, ry, rd, rd);

if ((mouseX >= rx) && (mouseX <= rx+rd) && (mouseY >= ry) && (mouseY <= ry+rd))  

 {fill(125, 35, 23);
 rect(rx, ry, rd, rd);
 fill(255);
 ellipse(ex, ey, er, er);}
else {fill(255);}

 //TOUCH THE CIRCLE
ellipse(ex, ey, er, er);
 float d = dist(mouseX, mouseY, ex, ey);
 if(d < er)
 {er++;
 fill(32, 45, 65);
 ellipse(ex,ey,er,er);} 
 else {fill(255);}

//THE LAST CURLY
}
//THE LAST CURLY


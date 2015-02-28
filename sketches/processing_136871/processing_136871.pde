
//point on circle
float x;
float y;

//center of circle
float cx; 
float cy;

//size of circle
float diameter;
float radius;

//the angle you clicked at. 0 degrees is from the origin horizontal to the right and increases as you go clockwise around the circle
float theta; //radians version of an angle

void setup() {
  size(600, 600);
  cx = width/2; 
  cy = height/2;
  
  diameter = (width/3)*2; 
  radius = diameter/2;
  
  ellipseMode(CENTER);
  background(128);
  fill(255);
  ellipse(cx, cy, diameter, diameter); //the circle that bounds everything
}

void draw() {
}

void mouseClicked() {

  /*this calculates the angle at which you clicked based on the origin 
  of the bounding circle. atan2 Calculates the angle (in radians) 
  from a specified point to the coordinate origin as measured from 
  the positive x-axis.  */
 
  theta = atan2(mouseY - cy, mouseX - cx); 
  
  /* use trig to figure out x and y location on the bounding circle circumference
 at the same angle as your mouse click */
  x = cos(theta)* radius; //calculates the x in relationship to cx
  y = sin(theta) * radius; //calculates the y in relationship to cy


  // draw a line that touches the circumference of the circle.
  // draw a circle whose origin the point of the line on the bounding circle
  line(cx, cy, cx+x, cy+y);
  ellipse(cx+x, cy+y, 10, 10);
  /* remember that sine and cosine require the use of a tright triangle
  the "x" that is calculated is the equivalent of the x value of the point 
  where the right angle is in the soh-cah-toa diagram http://processing.org/tutorials/trig/ 
  the "y" that is generated is also based on that same right angle and determines 
  how far up the point on the circle will need to be. To actually place an point
  on the circumference of the circle you need to start at the origin of the circle 
  and move left or right the value of x and up or down the value of y. */

  /* generate a line from the origina of the bounding circle to where the user
  has clicked. In addition, draw a circle at that point */
  
  line(cx, cy, mouseX, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
}




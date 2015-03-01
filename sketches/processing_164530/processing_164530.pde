

int x;
//sets an integer variable to x
int y;
//sets an integer variable to y
float outsideRadius = 150;
//sets outside radius to 150px
float insideRadius = 100;
//sets inside radius to 100px

void setup() {
  //runs the code only once
  size(500, 400);
  //sets canvas size to 640px wide by 360px tall 
  background(112,122,138);
  //sets background color navy
  stroke (224,224,224);
  //sets all outlines to the figures to a very light grey
  fill (0,45,66);
  //sets fill color to dark blue
  x = width/2;
  //centers shape along the x axis
  y = height/2;
  //centers shape alone the y axis
}

void draw() {
  //runs the code as a loop at the defult frame rate 
  background(112,122,138);
  //sets background to navy 
  
  int numPoints = int(map(mouseX, 0, width, 6, 60));
  //sets the numPoints to change according to the X axis of the mouse input into the equation
  float angle = 0;
  //sets float angle to 0
  float angleStep = 180.0/numPoints;
  //sets it so that the "float angleSteps" does a complete 180 to close the circle
    
  beginShape(TRIANGLE_STRIP);
 //begins shape //shape is triangles
  for (int i = 0; i <= numPoints; i++) {
    //Starts the conditional statement
    float px = x + cos(radians(angle)) * outsideRadius;
    //variables control ring's radii respectively for the outside radius
    //Calculates the cosine of an angle
    float py = y + sin(radians(angle)) * outsideRadius;
   //variables control ring's radii respectively for the outside radius
   //Calculates the sine of an angle
   angle += angleStep;
  //first half of the circle shape with the angleSteps 
    vertex(px, py);
    //generates a closed ring using the vertex function
    px = x + cos(radians(angle)) * insideRadius;
    //variables control ring's radii respectively for the inside radius
    //Calculates the cosine of an angle
    py = y + sin(radians(angle)) * insideRadius;
    //variables control ring's radii respectively for the inside radius
    //Calculates the sine of an angle
  vertex(px, py);
    //generate a closed ring using the vertex function  
    angle += angleStep;
    //second half of the circle shape with the angleSteps 
}
//ends statment
  endShape();
  //ends shape
}




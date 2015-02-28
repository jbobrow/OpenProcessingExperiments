
//Ben Norskov
//Creative Computing A: Distance to Circle
//Sep 14, 2012

int circle_x = 200;//where the circle is
int circle_y = 120;
int circle_radius = 30;//how big is our circle?

void setup() {
  size(500, 500);
};
void draw() {
  background(200);  //clears the screen/eraser/new sheet of paper

  //here we are drawing a circle. the diameter of any circle is just its radius * 2, thus the math
  //I'm using variables, so I can quickly change the circle to be bigger or smaller, if need be 
  fill(255);//Always do the fill you need right before what you are drawing. 
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);

  //  Problem: if the mouse is within a circle, draw a green rectangle
  //  if the distance from the mouse to a circle is less than the circle's radius
  //  if (dist between mouse and circle < radius)
  if ( dist(mouseX, mouseY, circle_x, circle_y) < circle_radius) {
    fill(30, 100, 30);
    rect(100, 200, 100, 100);
  };
  //the dist() function gives us the distance between ANY two points. (really!)
  //Give it any x and y values twice, and it will give you the distance in pixels. It's pretty awesome.
  //if you want to see the numbers it gives you, uncomment the line below:
  //println( "distance from Mouse to circle: " + dist(mouseX, mouseY, circle_x, circle_y) );
  //or distance to the center of the screen
  //println( "distance from Mouse to center: " + dist(mouseX, mouseY, width/2, height/2) );
  //or distance to the circle to the center of the screen
  //println( "distance from circle to center: " + dist(circle_x, circle_y, width/2, height/2) );
  //check out the documentation here: http://processing.org/reference/dist_.html
  //
  //remember that the "+" in the println() puts different numbers or words together. 
};

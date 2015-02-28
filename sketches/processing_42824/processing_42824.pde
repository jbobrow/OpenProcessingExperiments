
// 10/15/11
// ICM
// Ben Light
// bl1236@nyu.edu
// Re-organized code of a previous assignment, Circles 2, using functions and objects
// Circles 2 draws a line of circle starting at max diam, shrinks to min diam in center and returns to max diam again
// Does this by calling one functions drawCircleAll, builds if mouse is released, stops if mouse is clicked
// mouseX position determines amount of circles created.
// Color of circles changes based on mouseY position.

float a = 0;  // determines starting point X for color range "d"
float b = 0;  // determines starting point Y for color range "d"

void setup() {
  size(800,300);
  smooth();
  //noLoop();  // Removed noLoop for mousePressed and mouseReleased to work
}

void draw() {
  background(255);
  //noFill();
  
  // pass in a color to drawCircleAll
  // function for circle color
  float d = dist(a,b,0,mouseY*1.75);
  color c = color(d/4);
  drawCircleAll(140, height/2, width-140, height-20, c);  // starting position X, Y, Z, 280 radius, color
}


void drawCircleAll(float x, float y, float z, float radius, color circColor) {
  float mX = (width/2) - (mouseX/2.5) -80;
  mX = constrain(mX,20,280);
  
  ellipse(x, y, radius, radius);
  ellipse(z, y, radius, radius);
  //stop condition
  if (radius > mX) {
    radius = radius - 10;  //decrease radius by 10
    x = x + 10;  // X position of circles on left
    z = z - 10;  // X position of circles on right
    stroke(circColor);
    fill(circColor,mouseY/50);
    drawCircleAll(x, y, z, radius,circColor);
  }
  radius=height-20;
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}


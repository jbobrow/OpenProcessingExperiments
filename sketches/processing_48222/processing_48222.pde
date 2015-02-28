
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Exercise 13-5: Using Example 13-5, draw a spiral path. Start in the center and move 
// outward. Note that this can be done by changing only one line of code and adding one line 
// of code!           

// A Polar coordinate, radius now starts at 0 to spiral outwards
float r = 0;
float theta = 0;

void setup() {
  size(600,600);
  background(0);
  smooth();
  frameRate(190);
}

void draw() {
  // Polar to Cartesian conversion
  float x = r * cos(theta);
  float y = r * sin(theta);
  int VERTEX = 10;

  // Draw an ellipse at x,y

  // Adjust for center of window
  smooth();
  noFill();
  stroke(r*2 ,255-r/2, 255-r, 10);
  //strokeJoin(ROUND);
  
  triangle(x+width/2-VERTEX, y+height/2-VERTEX, x+width/2, y+height/2+VERTEX, x+width/2+VERTEX, y+height/2-VERTEX); 

  // Increment the angle
  theta += 0.005;
  // Increment the radius
  r += 0.025;
}


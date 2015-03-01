
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 16-10: The scribbler mirror


// Two global variables
float x;
float y;
float r, g, b;



void setup() {
  size(600, 300);
  background(0);
  frameRate(5);

  // Start x and y in the center
  x = 0;
  y = height/2;



}

void draw() {


  // Pick a new x and y
  float newx = constrain(x + random(0, 20), 0, width-1);
  float newy = constrain(y + random(-30, 30), 0, height-1);

  // Find the midpoint of the line
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  float r = random(100,255);
  float g = random(100,255);
  float b = random(100,255);
 // color c = (r, g, b);

  // Pick the color from the video, reversing x
  //color c = video.pixels[(width-1-midx) + midy*video.width];

  // Draw a line from x,y to the newx,newy
  stroke(r, g, b);
  strokeWeight(4);
  line(x, y, newx, newy);

  // Save newx, newy in x,y
  x = newx;
  y = newy;
  
}



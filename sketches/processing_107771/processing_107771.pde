
/**
 
 Author: Greg Westerfield, Jr.
 
 All the shapes above the mouse will randomly appear and stay. 
 All the shapes below the mouse will randomly appear and then disappear immediatly after appearing. 
 To clear the entire screen press and release the mouse.

 */
 

int x1Line;
int x2Line;
int yLine;


void setup() {
  size(650, 550);
  x1Line = 0;
  x2Line = width;
  frameRate(10);
  background(0, 0, 0);
}


void draw() {

  float d = random(50);
  float rand = random(height);
  yLine= mouseY;
  line(x1Line, yLine, x2Line, yLine);
  fill(0);
  rect(0, yLine, width, height - yLine );
  fill(random(255), random(255), random(255));
  yingyang( random(0, width), rand, d );
  rect(random(0, width), rand, d, d);
}


void mouseReleased() {
  background(0);
}

void yingyang(float x, float y, float d) {

  float w = d/4;
  ellipse( x, y, d, d );

  float x1 = x;
  float y1 = y;
  float x2 = x;
  float y2 = y + d/2;

  float cx1 = x+w;
  float cy1 = y1;
  float cx2 = x+w;
  float cy2 = y2;

  stroke(0);
  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
  stroke(0);

  y2 = y - d/2;
  cx1 = x-w;
  cx2 = x-w;
  cy2 = y2;

  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
}




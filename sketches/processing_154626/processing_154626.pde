
// day 5: day 2 variations in grids v4

float lineStroke = 10;
float growthSpeed = 1.2;
float growthDirection = 1;
float degrees = 10;
float degrees2 = 10;
float blockWH = 0;
float division = 10;
float x = 0;
float y = 0;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  blockWH = width/division;
}


void draw() {
  // pulse degrees
  if (degrees < 180 ) {
    degrees = degrees + 0.5;
  } 
  if (degrees == 180) {
    degrees = 0;
  }

  // flipping degree's for the opposite rotation on the line
  degrees2 = map(degrees, 0, 360, 360, 0);
  
  // for loop for building in the squarea
  for (int i = 1; i <= division; i++) {
    for (int j = 1; j <=division; j++) {
      blockIt(x, y);
      x = x + blockWH;
    }
    y = y + blockWH;
    x = 0;
  }

  y = 0;

}

void blockIt(float locX, float locY) {
  // draw the line
  strokeCap(SQUARE);
  // color in HSB shifting with the rotation
  stroke(degrees, 90, 70);
  //strokeWeight(lineStroke);
  strokeWeight(blockWH);
  line(locX, blockWH/2+locY, blockWH+locX, blockWH/2+locY);

  // black lines

  noStroke();
  rectMode(CENTER);
  fill(degrees+50, 50, 90);

  // line one
  pushMatrix();
  translate(blockWH/2+locX, blockWH/2+locY);
  rotate(radians(degrees2));
  rect(0, 0, blockWH/4, width*3 );
  popMatrix();
}


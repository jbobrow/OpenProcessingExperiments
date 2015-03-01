
// day 5: day 2 variations in grids v2

float lineStroke = 10;
float growthSpeed = 1.2;
float growthDirection = 1;
float degrees = 10;
float degrees2 = 10;
float blockWH = 0;
float division = 4;
float x = 0;
float y = 0;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  blockWH = width/division;
}

void draw() {
  background(degrees, 50, 90);
  // line stroke size
  lineStroke = lineStroke + (growthSpeed * growthDirection);

  //stroke pulse
  if (lineStroke > blockWH || lineStroke < 1) {
    growthDirection *= -1;
  } 
  // pulse degrees
  if (degrees < 360 ) {
    degrees = degrees + 0.5;
  } 
  if (degrees == 360) {
    degrees = 0;
  }
  // flipping degree's for the opposite rotation on the line
  degrees2 = map(degrees, 0, 360, 360, 0);

  // iteration across the surface of day two pattern as a block
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

// function that now holds the pattern as a block
void blockIt(float locX, float locY) {
  // draw the line
  strokeCap(SQUARE);
  // color in HSB shifting with the rotation
  //stroke(degrees, 50, 90);
  strokeWeight(blockWH);
  //line(locX, blockWH/2+locY, blockWH+locX, blockWH/2+locY);

  // black lines
  fill(0);
  noStroke();
  rectMode(CENTER);

  // line one
  pushMatrix();
  translate(blockWH/2+locX, blockWH/2+locY);
  rotate(radians(degrees));
  rect(0, 0, blockWH/10, width*3 );
  popMatrix();

  //line two
  pushMatrix();
  translate(blockWH/2+locX, blockWH/2+locY);
  rotate(radians(degrees2));
  rect(0, 0, blockWH/10, width*3 );
  popMatrix();
}


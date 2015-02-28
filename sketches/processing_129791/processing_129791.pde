
// copyright eunkic 
// hw #3

// variables declarations
float x, y;
float xDist, yDist;
float easing;

// functions
void setup () 
{  
  size (400, 400);
  background (25, 160, 227);
  smooth ();
  frameRate (50);
  easing = .035;
}

void draw () 
{
  // interactions
  // noCursor ();
  xDist = mouseX - x;
  yDist = mouseY - y;
  x = x + easing*xDist;
  y = y + easing*yDist;
  
  // opacity
  fill(25, 160, 227, 20);
  rect(0, 0, width, height);
  
  // shape
  fill (255, random(180,240), 0);
  noStroke ();
  beginShape();
  vertex(x, y-50);
  vertex(x+14, y-20);
  vertex(x+47, y-15);
  vertex(x+23, y+7);
  vertex(x+29, y+40);
  vertex(x, y+25);
  vertex(x-29, y+40);
  vertex(x-23, y+7);
  vertex(x-47, y-15);
  vertex(x-14, y-20);
  endShape(CLOSE);
}

void mouseMoved() {
  // darkend background
  background (random(5, 50), random(45, 70), random(90, 100));
  
  // shape over darkend background
  fill (255, random(180,240), 0);
  noStroke ();
  beginShape();
  vertex(x, y-50);
  vertex(x+14, y-20);
  vertex(x+47, y-15);
  vertex(x+23, y+7);
  vertex(x+29, y+40);
  vertex(x, y+25);
  vertex(x-29, y+40);
  vertex(x-23, y+7);
  vertex(x-47, y-15);
  vertex(x-14, y-20);
  endShape(CLOSE);
}






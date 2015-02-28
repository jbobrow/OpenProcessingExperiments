
float x = (width/2);
float y = (height/2);

float lasty;
float lastx;
float lineWeight;

void setup () {
  frameRate(1000);
  smooth();
  background(255);
  size(500, 500);
}


void draw () {
}

void mouseDragged() {


  lastx = x;
  lasty = y;

  x = mouseX;
  y = mouseY;

  lineWeight = dist(lastx, lasty, x, y);

  stroke(3*lineWeight);
  strokeWeight(25/lineWeight);

  line(lastx, lasty, x, y);

  println(lineWeight);
}

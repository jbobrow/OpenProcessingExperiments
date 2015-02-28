
float s = 0;
float t = 0;
float a = 0;
float r = 0;
  
float diam;
float x;
float y;

int angle = 0;
boolean whiteBGColour;


void setup() {
  size(800, 800);
  background(102);
  noStroke();
  fill(0, 102);
}

void draw() {
  if (mousePressed == true) {
    angle += 5;
    float val = cos(radians(angle)) * 12.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
   }
    fill(255);
    ellipse(mouseX, mouseY, 2, 2);
  }
   s = random(0, 255);
  t = random(0, 255);
  a = random(0, 255);
  r = random(0, 255);
  fill(s, t, a, r);
  translate(mouseX, mouseY);
 
//Star Shape
  strokeWeight(2);
  stroke(s,t,a,r);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
}

void mousePressed () {
  if (whiteBGColour) {
    background(0);
  } else {
    background(255);
  }
  whiteBGColour = !whiteBGColour;
}




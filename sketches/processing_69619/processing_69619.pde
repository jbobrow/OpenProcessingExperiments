
//Kevin Hyun  andrew id: khyun
//Copyright 2012.


float r, g, b; //rectangle fill color
float rb, gb, bb; //background color

void setup() {
  size(400, 400);
  smooth();
  background(255);
  r = random(255); //rect fill color R-value set
  g = random(255); //rect fill color G-value set
  b = random(255); //rect fill color B-value set
  noCursor();
}

void draw() {
  background(255);
  noStroke();
  for (float x=0; x < width; x=x+24) {
    for (float y=0; y < height; y=y+24) {    
      fill(r, g, b);
      rect(x, y, 20, 20);
    }
  }
}


void keyPressed() {
  if (key == 'c') {
    r = (random(255));
    g = (random(255));
    b = (random(255));
  }
  if (key == 'b') {
    rb = (random(255));
    gb = (random(255));
    bb = (random(255));
  }
}



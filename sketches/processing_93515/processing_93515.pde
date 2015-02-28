
float r = 100;
float g = 150;
float b = 200;

float x;
float y;
float diam;
float opac;

int xSize = 0;
int ySize = 0;


void setup() {
  smooth();
  size(600, 600);
  background(0);
  frameRate(15);
}

void draw() {
  // draw() loops forever, until stopped
  xSize = int(random(0, 15));
  noStroke();
  fill(225);
  ellipse(mouseX, mouseY, xSize, xSize);
  fill(0, 25);
  rect(0, 0, 600, 600);
  if (mousePressed) {
    //Cursor
    cursor(CROSS);
    //ellipse01
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
    x = random (-50, 50);
    y = random (-50, 50);
    diam = random (5, 30);
    opac = random (0, 255);
    noStroke();
    fill(r, g, b);
    ellipse(x+mouseX, y+mouseY, diam, diam);
    //ellipse02
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
    x = random (-100, 100);
    y = random (-100, 100);
    diam = random (0, 5);
    opac = random (0, 255);
    noStroke();
    fill(r, g, b);
    ellipse(x+pmouseX, y+pmouseY, diam, diam);
    //ellipse03
    r = int(random(0, 255));
    g = int(random(0, 255));
    b = int(random(0, 255));
    x = random (-150, 150);
    y = random (-150, 150);
    diam = random (5, 10);
    opac = random (0, 255);
    noStroke();
    fill(r, g, b);
    ellipse(x+mouseX, y+mouseY, diam, diam);
  }
  else {
    cursor(HAND);
  }
}




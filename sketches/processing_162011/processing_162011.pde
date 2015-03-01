
int minDiam= 10;
int maxDiam= 100;
int diam;
int increment = 5;

void setup() {
  size(650,500);
  diam=minDiam;
  colorMode(HSB, height, height, height);  
  noStroke();
  background(0,0,0);
}

void draw() 
{
    fill(mouseY, height, height);
}


void mouseDragged() {
  ellipse(mouseX,mouseY,diam,diam);
  diam = diam+increment;
  if (diam > maxDiam || diam < minDiam) {
    increment = -increment;
  }
}

void mouseMoved() {
  fill(0);
  ellipse(mouseX,mouseY,diam,diam);
  diam = diam+increment;
  if (diam > maxDiam || diam < minDiam) {
    increment = -increment;
  }
}



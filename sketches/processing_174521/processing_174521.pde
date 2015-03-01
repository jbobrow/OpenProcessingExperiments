
int x, y;


void setup() {
  size(400, 400);
  smooth();
  background(0);
  colorMode(RGB);
  mouseX=width/2;
  mouseY=height/2;
}

void draw() {
  fill(0, 0, random(255));
}

void mouseDragged() {
  float r = random(100);
  ellipse(mouseX, mouseY, r, r);
}

void keyPressed() {
  fill(0, 0, 0);

  switch(key) {
  case'd':
    background(0);
    break;
  case's':
    fill(random(255),0,0);
    break;
    case'a':
    fill(0,random(255),0);
    break;
  }
}



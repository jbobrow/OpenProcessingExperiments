
boolean button = false;

int circleX = 0;
int circleY = 100;
int circleZ = 10;


void setup () {
  size (200,200);
}

void draw() {
  if (button) {
  background (10);
  stroke (255);
  } else {
  circleX=circleZ;
  }
  fill(0);
  ellipse(circleX,circleY,50,50);
}

void mousePressed () {
    if (mouseX >circleX && mouseX < circleX+50 && mouseY >circleY && mouseY <circleY+50){
    button = !button;
    }
}


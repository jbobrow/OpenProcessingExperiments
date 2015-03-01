
int circleX=200;
int circleY=200;

void setup() {
background(255,0,75);
size(400,400);
}

void draw() {
ellipse(circleX,circleY,50,50);
fill(100,50,100);
if (keyPressed && keyCode == UP) {
circleY=circleY-3;
  }
if (keyPressed && keyCode == DOWN) {
circleY+=3;
  }
if (keyPressed && keyCode == RIGHT) {
circleX+=3;
  }
if (keyPressed && keyCode == LEFT) {
circleX=circleX-3;
  } 
}

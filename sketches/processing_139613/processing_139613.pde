
//Emma Grapek - Creative Computing - Section B

int x =  300;
int y = 300;

void setup() {
  size (600, 600);
  noStroke();
  smooth();
  frameRate(100);
}


void draw() {
  if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT) {
      x--;
    }
    else if (keyCode == RIGHT) {
      x++;
    }
    else if (keyCode == UP) {
      y--;
    }
    else if (keyCode == DOWN) {
      y++;
    }
  }
  background(255);
  fill(random(0, 255), random(0, 255), random(0, 255));
  if (mousePressed == false)
    ellipse(x, y, 100, 100);
  else if (mousePressed == true) {
    rect(x, y, 100, 100);
  }
}


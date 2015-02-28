
float x = 0;
float y= 0;
float xMove;

void setup() {
  size(640, 640);
  background(255, 198, 116);
  stroke(0);
  strokeWeight(random(2));
  smooth();
}


void draw() {
  noFill();
  rect(x, y, xMove, height);

  xMove= random(9, 12);
  x+= xMove;


  if (mousePressed) {
    fill(255, 198, 116);
    if (pmouseX-mouseX>=9||pmouseX-mouseX<=-9) {
      strokeWeight(random(2, 3));
      rect(mouseX, mouseY, (pmouseX-mouseX), random(9, 12));
    }
  }
  else {
    if (pmouseY-mouseY>=9||pmouseY-mouseY<=-9) {
      fill(255, 198, 116);
      strokeWeight(random(2, 3));
      rect(mouseX, mouseY, random(9, 12), (pmouseY-mouseY));
    }
  }
}




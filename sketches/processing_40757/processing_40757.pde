
void setup() {
  size(400, 400);
  smooth();
}

// initialize the random variable
float r = 0;

void draw() {
  // draw according to mouse pressed/not
  if (mousePressed) {
    stroke(0, 255, 50, 200);
    point(mouseX-30-r, mouseY-18-r);
    point(mouseX+30+r, mouseY+18+r);
    point(mouseX-30-r, mouseY+18+r);
    point(mouseX+30+r, mouseY-18-r);
    point(mouseX+r, mouseY+35+r);
    point(mouseX+r, mouseY-35+r);
    ellipse(mouseX+r, mouseY+r, 30, 30);
  } else {
    stroke(255);
    ellipse(mouseX, mouseY, 3, 3);
  }
}

void mouseDragged() {
  // add a random movement
  r = random(5);
  
  // fill the background
    noStroke();
    fill(255, 2);
    rect(0, 0, width, height);
}

void mouseReleased() {
  // mark the release point
  strokeWeight(6);
  ellipse(mouseX+r, mouseY+r, 30, 30);
  strokeWeight(1);
}                               

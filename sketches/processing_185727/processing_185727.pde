
void setup() {
  size(600, 600);
}


void draw() {

  if (mouseY>300) {
    background(0);
    fill(255);
    ellipse(height/2, width/2, 300, 300);
    fill(0);
    rect(300, 300, 100, 100);
  }
  else {
    background(255);
    fill(0);
    ellipse(height/2, width/2, 300, 300);
    fill(250);
    rect(300, 300, 100, 100);
  }
}



 void setup() {
  size(600, 600);
}


void draw () {
  background(255);

  noStroke();
  fill(random(0, 255));
  rect(0, 0, 600, 600);


  if (mouseX>300) {
    noStroke();
    fill(random(0, 255));
    rect(50, 50, 100, 100);
  } else {
    noStroke();
    fill(random (0, 255));
    ellipse(100, 100, 100, 100);
  }

  if (mouseY>300) {
    noStroke();
    fill(random (0, 255));
    rect(250, 250, 100, 100);
  } else {
    noStroke();
    fill(random (0, 255));
    ellipse(300, 300, 100, 100);
  }

  if (mouseX>mouseY) {
    noStroke();
    fill(random (0, 255));
    rect(450, 450, 100, 100);
  } else {
    noStroke();
    fill (random (0, 255));
    ellipse(500, 500, 100, 100);
  }
}


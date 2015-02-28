
void setup() {
  size(600, 300);
  background(0);
  noStroke();
}

void draw() {
  fill(0, 4);
  rect(0, 0, width, height);

  translate(mouseX, mouseY);

  if (mouseY < 50) {
    fill(200, 0, 0, 100);
  }
  else if (mouseY < 100) {
    fill(100, 100, 0, 100);
  }
  else if (mouseY < 150) {
    fill(0, 200, 0, 100);
  }
  else if (mouseY < 200) {
    fill(0, 100, 100, 100);
  }
  else if (mouseY < 250) {
    fill(0, 0, 200, 100);
  }
  else {
    fill(100, 0, 100, 100);
  }

  if (mousePressed) {
    mybigbrush();
    mybigbrush();
    mybigbrush();
  }
}

void mybigbrush() {
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(0, 0, random(10, 13), random(10, 13));
  mysmallbrush();
  mysmallbrush();
  mysmallbrush();
  popMatrix();
}

void mysmallbrush() {
  pushMatrix();
  translate(random(-5, 5), random(-5, 5));
  ellipse(0, 0, random(2, 5), random(2, 5));
  popMatrix();
}


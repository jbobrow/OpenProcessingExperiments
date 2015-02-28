
void setup() {
  size(600, 600);
  background(250,244,192);
  fill(250,244,192);
  noStroke();
}

 
void draw() {
  fill(0, 4);
  rect(0, 0, width, height);
 
  translate(mouseX, mouseY);
 
  if (mouseY < 100) {
    fill(255, 167, 167, 80);
  }
  else if (mouseY < 200) {
    fill(178, 235, 244, 80);
  }
  else if (mouseY < 300) {
    fill(206, 242, 122, 80);
  }
  else if (mouseY < 400) {
    fill(250, 237, 125, 80);
  }
  else if (mouseY < 500) {
    fill(209, 178, 255, 80);
  }
  else {
    fill(255, 255, 255, 100);
  }
 
  if (mousePressed) {
    bigbrush();
    bigbrush();
    bigbrush();
  }
}
 
void bigbrush() {
  pushMatrix();
  translate(random(-3, 3), random(-3, 3));
  ellipse(0, 0, random(30, 50), random(30, 50));
  smallbrush();
  smallbrush();
  smallbrush();
  popMatrix();
}
 
void smallbrush() {
  pushMatrix();
  translate(random(-3, 3), random(-3, 3));
  rect(0, 0, random(10, 23), random(10, 23),7);
  popMatrix();
}

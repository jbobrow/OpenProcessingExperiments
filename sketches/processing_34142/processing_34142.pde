
void setup() {
  size(600, 600);
  background(255, 255, 255);
  noStroke();
  smooth();
}
void draw() {
}

void mouseDragged() {
  float r = random(255);
  float g = random(255);
  float b = random(255);

  if (mouseButton == LEFT) {
    ellipse(mouseX, mouseY, 20, 20);
    filter(BLUR, .6);
    filter(ERODE);
    fill(0, 0, 0);



    line(pmouseX, pmouseY, mouseX, mouseY);

    fill(r, g, b);
    noStroke();
  } 
  else {
    fill(230, 243, 202);
    stroke(r, g, b);
  }

  println(mouseX);
}



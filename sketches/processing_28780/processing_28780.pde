
void setup() {
background(255);  
  size(600, 150);
  smooth();
}

void draw() {
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));
  // and fill opacity
  int opacity = int(random(100, 255));
  
stroke(r, g, b, opacity);
  strokeWeight(abs(pmouseX - mouseX));
 line(pmouseX, pmouseY, mouseX, mouseY);

ellipse(mouseX, mouseY, 10, 20);
  fill(r, g, b, opacity);
  noStroke ();
  
}



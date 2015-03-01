
void setup() {
  noCursor();
  size(700, 500);
  colorMode(HSB);
}
 
void draw() {
  fill (0);
  if (mousePressed == true) {
    colorMode(RGB);
    background(126, 3, 56);
    colorMode(HSB);
    triangle(mouseX, mouseY, 200, 250, 300, 250);
    fill(random(160), 255, 255);
    triangle(mouseX, mouseY, 230, 250, 280, 250);
    fill(random(160), 255, 255);
    noStroke();
    ellipse(mouseX, mouseY, 150, 150);
    fill(0);
    ellipse(mouseX, mouseY, 90, 90);
    
  } else {
    colorMode(HSB);
    background(0);
    fill(random(160),255,255);
    ellipse (mouseX, mouseY, 110, 110);
    rect(mouseY, mouseX, 90, 90);
  }
}


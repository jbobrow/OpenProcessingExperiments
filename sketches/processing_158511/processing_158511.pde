
void setup () {
  size(1000, 1000);
  colorMode(RGB);
background(0);
  
  noStroke();
}
void draw  () {
  stroke(255);
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 200, 200);
   fill(255, random(255), 0);
  ellipse(mouseY, mouseX, 200, 200);
   fill(255, 0, 0);
  ellipse(width-mouseX, height-mouseY, 200, 200);
   fill(255, random(255), 0);
  ellipse(width-mouseY, height-mouseX, 200, 200);
}


void setup ()  {
  size(500, 500);
  background(20);
  colorMode(HSB);
}
void draw()  {
  float hue = (millis() / 50) % 360;
  fill (0, 8);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  stroke(hue, 240, 240);
  strokeWeight(5);
  line(mouseX, mouseY, 250, 250);
}
void mousePressed()  {
  float radius = 50 + 5*sin(frameCount*.1);
  noStroke();
  fill(0, 0, 240, 120);
  ellipse(mouseX, mouseY, radius, radius);
  rectMode(CENTER);
  rect(mouseX-1, mouseY-1, 2, 2);
}

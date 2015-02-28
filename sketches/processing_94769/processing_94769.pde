
void setup ()  {
  size(500, 500);
  background(20);
  colorMode(HSB);
}
void draw()  {
  float hue = (millis() / 100) % 360;
  float y = 250 - (-250 * cos(millis() * .0005));
  float x = 250 + .4 * abs(250 - y) * sin(millis() * .005) ;
  fill (0, 8);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, height);
  stroke(hue, 240, 240);
  strokeCap(SQUARE);
  strokeWeight(10);
  line(x, y, 250, 250);
}

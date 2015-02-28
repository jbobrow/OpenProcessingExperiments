
void setup() {
  size(416, 416);
  background(0);
}
void draw() {
  smooth();
  strokeWeight(8);
  fill(0,20);
  noStroke();
  rect(0,0,416,416);

  stroke(255,000,000);
  float angle = map(millis(), 0, width, 0, PI);
  translate(208,208);
  rotate(angle);
  line(0, 0, 200, 0);

}





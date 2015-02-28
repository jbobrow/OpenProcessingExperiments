
void setup() {
  size (500,500);
  background(11,155,50);
}
void draw() {
  fill(11,155,50);
  ellipse(random(500),random(500),10,10);
  stroke(227,137,27);
  line(random(250),random(250),10,250);
  frameRate(50);
  line(random(500),random(500),500,500);
  line(random(250),random(250),500,0);
  line(random(500),random(500),0,500);
}
void mousePressed() {
  saveFrame("img4.jpg");
}

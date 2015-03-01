
void setup() {
  size(400,400);
  background(0,30);
  smooth();
}
void draw() {
  strokeWeight(map(pmouseX,0,400,1,8));
  stroke(map(pmouseY,0,400,1,220));
  line(pmouseX, pmouseY, mouseX, mouseY);
}



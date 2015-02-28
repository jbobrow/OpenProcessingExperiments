
void setup() {
  size(700, 700);
  colorMode(RGB,3000,100,400);
  smooth();
}
 
void draw() {
  background(200, 0, 100);
  float angle = map(dist(mouseX, mouseY, width / 2, height / 2), 0, width / 3, 0, PI);
  noStroke();
  for(int i = 12; i > 0; i--) {
    fill(i * 300, 500, 100);
    pushMatrix();
    translate(width / 2, height / 2);
    rotate(radians(i * frameCount * 0.2));
    arc(50, 20, i * 50, i * 50, 0, angle);
    popMatrix();
  }
  pushMatrix();
  translate(width / 2, height / 2);
  popMatrix();
   
}

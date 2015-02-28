
void setup() {
  size(600,600);
}
void draw() {
  frameRate(5);
  noStroke();
  triangle(random(600),random(400),random(550),random(550),random(255),random(240));
  fill(random(100),random(100),random(40),random(100));
}
void mouseClicked() {
  ellipse(mouseX,mouseY,random(255),random(105));
}
  


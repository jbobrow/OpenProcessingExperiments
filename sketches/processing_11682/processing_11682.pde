
void setup () {
  size(480,320);
  smooth();
  background(255);
  fill(0, 102, 153);
  text("CLICK!",220,150);
}

void draw() {

}
void mousePressed() {
  stroke(0);
  fill(random(255),random(255),random(255),random(255));
  rectMode(CENTER);
  rect(mouseX,mouseY,random(40,100),random(40,100));
}
  


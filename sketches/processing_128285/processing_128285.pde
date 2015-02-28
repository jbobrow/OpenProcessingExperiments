
void setup() {
  size(500,200);
   strokeWeight(4);
  smooth();
  stroke(0,102);
}

void draw () {
   fill(random(0,255),random(0,255),random(0,255));
   ellipse(mouseX,mouseY,30,30);
   line(mouseX,mouseY,pmouseX,pmouseY);
}

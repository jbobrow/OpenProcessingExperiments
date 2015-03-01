
void setup() {
  size(600,600);
  background(255);
}
void draw() {
  stroke(map(mouseX,0,600,0,255),0,0);
  strokeWeight(map(mouseY,0,600,0.25,0.5));
  line(mouseX,mouseY,100,100);
  line(mouseX,mouseY,500,200);
  line(mouseX,mouseY,200,500);
}




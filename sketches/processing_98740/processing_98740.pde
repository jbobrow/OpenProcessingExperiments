
void setup(){
  size(200,200);
  background(255);
  smooth();
}
void draw(){
  stroke(0);
  strokeWeight(abs(mouseX - pmouseX));
  line(pmouseX,pmouseY,mouseX,mouseY);
}



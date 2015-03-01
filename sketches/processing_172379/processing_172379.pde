
void setup(){
  size(500,500);
  background(0);
}
void draw(){
  stroke(0,0,mouseX);
  strokeWeight(5);
ellipse(pmouseY,pmouseX,mouseX,mouseY);
ellipse(mouseX,mouseY,pmouseY,pmouseX);
fill(#FC1703);
}

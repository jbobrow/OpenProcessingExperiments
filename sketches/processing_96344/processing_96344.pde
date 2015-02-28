
void setup(){
  size(200,200);
  background(0);
  strokeWeight(7);
}
void draw(){
stroke(#970BDE);
  point(mouseX,mouseY);
  stroke(#18DE0B);
  point(mouseX/2,mouseY/2);
  stroke(#0B68DE);
  point(mouseX*2,mouseY*2);
  }


int dragX, dragY, moveX, moveY; 
void setup(){
  size(100,100); 
  smooth(); 
  noStroke();
}
void draw(){
  background(204);
  fill(0);
  ellipse(dragX,dragY,33,33);
  fill(153);
  ellipse(moveX,moveY,33,33);
}
void mouseMoved() {
  moveX=mouseX;
  moveY=mouseY;
}
void mouseDragged() {
  dragX=mouseX;
  dragY=mouseY;
}

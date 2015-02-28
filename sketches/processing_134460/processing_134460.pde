
void setup(){
  size(400,400);
  smooth();
  background(0,230,200);
}
void draw(){
  fill(255,255,255,100);
  triangle(mouseX,mouseY,pmouseX,pmouseY,mouseX/2,mouseY/2);
}

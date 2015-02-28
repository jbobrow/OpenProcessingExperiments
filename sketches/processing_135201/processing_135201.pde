
void setup(){
  size(400,400);
  smooth();
  background(24,11,67);
}
void draw(){
 stroke(255,255,255,4);
  fill(255,255,255,4);
  
  triangle(mouseX,mouseY,pmouseY,pmouseY,mouseY/2,mouseX/2);
}

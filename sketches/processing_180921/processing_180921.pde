
void setup(){
  size(400,400);
  background(#FFADFE);
}
void draw(){
  //background(255);
  stroke(0);
  fill(175, 35);
  rectMode(CENTER);
  rect(mouseX, mouseY, 5 + (mouseX/400 * 30), 15);
  println(mouseX);
}



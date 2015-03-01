
void setup() {
  size(400,400);
}
void draw() {
  //background(255);
  stroke(0);
  fill(175,35);
  rectMode(CENTER);
  rect(mouseX, mouseY, 5 + (mouseY/400 *30), (mouseX/400 *30) );
  println(mouseX);
  
}



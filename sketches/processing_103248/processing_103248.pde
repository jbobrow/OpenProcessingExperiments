
//Summer Smith
//7/8/2013
//project: mouse drawing

void setup () {
  background(255); //white background
  size(400, 400); //set screen size
}
void draw() {
  if(mousePressed == true)
  fill(0);
  if(mousePressed == true)
  ellipse (mouseX, mouseY, 5, 5);
  println("mouseX: " + mouseX + " ,mouseY: " + mouseY); 
}

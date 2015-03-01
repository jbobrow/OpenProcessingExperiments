
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/164360*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
void setup(){
  size(600, 400);
  background(255);
}

void draw() {
  //background(255);
  
  stroke(0);
  fill(mouseX, 50, mouseY);
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50); 
}



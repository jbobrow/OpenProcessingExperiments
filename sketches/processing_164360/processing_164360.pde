
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



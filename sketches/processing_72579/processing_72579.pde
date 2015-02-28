




void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
 
  noFill();
  
  // if moving to RIGHT, else LEFT
  if(pmouseX > mouseX) stroke(0, 100);
  else stroke(150, 100);
  
  // if moving UP, else DOWN
  if(pmouseY > mouseY) strokeWeight(1);
  else strokeWeight(3);
 
 //size of shape based on SPEED of mouse movement
  
  if(mousePressed && pmouseX > mouseX ) // if moving to RIGHT
  {
    ellipse(mouseX, mouseY, abs(mouseX - pmouseX), abs(mouseY - pmouseY));
  }
  else if(mousePressed && pmouseX <= mouseX ) // if moving to LEFT
  {
    rect(mouseX, mouseY, abs(mouseX - pmouseX), abs(mouseY - pmouseY));
  }
  
}


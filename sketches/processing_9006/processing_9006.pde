
void setup() {
  //background (255, 255, 255);
  size (800, 800);
}
void draw() {
  background(255, 255, 255);
  fill(0, 0, 0);
  smooth();
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  //head
  ellipse(mouseX, mouseY, 194, 215);
  
   //face
 fill(255, 255, 255);
 ellipse(mouseX, mouseY, 110, 130);
  
  //body
  fill(0,0,0);
  rect(mouseX+206, mouseY+215, 412, 237);
  
  //legs
  rect(mouseX+26, mouseY+432, 30, 220);
  rect(mouseX+394, mouseY+432, 30, 220);
  
  //ears
  ellipse(mouseX-74, mouseY-80, 27, 75);
  ellipse(mouseX+70, mouseY-90, 32, 80);
  
  //eyes
  ellipse(mouseX-30, mouseY-10, 25, 59);
  ellipse(mouseX+25, mouseY+2, 35, 35);
  
 
}
  
  
  


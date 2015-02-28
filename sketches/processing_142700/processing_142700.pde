
void setup() {
  size(600, 600);
   background(0);
 smooth();
 stroke(0,127,250,255);
 noFill();
  
}
  
void draw () {
  fill(0, 0, 255, 10);
  stroke(0, 0, 255, 127);
  ellipse(300, 300, mouseX, mouseY);
  ellipse(50, 50, mouseX, mouseY);
  ellipse(50, 550, mouseX, mouseY);
  ellipse(550, 50, mouseX, mouseY);
  ellipse(550, 550, mouseX, mouseY);
 
  ellipse(300, 300, mouseY, mouseX);
  ellipse(50, 50, mouseY, mouseX);
  ellipse(50, 550, mouseY, mouseX);
  ellipse(550, 50, mouseY, mouseX);
  ellipse(550, 550, mouseY, mouseX);
  
 fill(0,2);
 rect(0,0, width, height);
 noFill();
 
  
}


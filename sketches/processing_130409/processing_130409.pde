
//copyright Faryal Khalid Spring 2014
//HW 4
 
void setup() {
  size(400, 400);
  background(0, 0, 0);
}
  
void draw() {
    
  strokeWeight(1);
//wheels
  pushMatrix();
  noStroke();
  fill(0, random(255), random(255),40);
  translate(width*.6, height*.6);
  rotate(mouseX);
  ellipse(-20, 100, 100, 100);
  popMatrix();

 pushMatrix();
  noStroke();
  fill(random(255), 0, random(255),40);
  translate(width*.3, height*.8);
  rotate(mouseY);
  ellipse(-20, 30, 40, 40);
  popMatrix();

pushMatrix();
  noStroke();
  fill(0, 255, random(255),40);
  translate(width*.8, height*.3);
  rotate(mouseY);
  ellipse(-20, 30, 40, 40);
  popMatrix();
   
 
}

//lines appear

void mouseClicked(){
 
  noStroke();
  fill(250, 161, 129);
  rect(mouseX, mouseY, 400, 2);
  fill(random(255), 161, 129);
  rect(mouseX, mouseY, 2, 400);
   
  
   
}






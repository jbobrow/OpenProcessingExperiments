
void setup(){
  size(300,300);
}
 
 

void draw(){
  background(144,mouseY,230);
  smooth();
 
  ellipseMode(CENTER);
  noStroke();
  fill(mouseY, 0, 255);
  ellipse(200,200,mouseY,mouseY);
  
  ellipseMode(CENTER);
  fill(mouseY, 0, 255);
  ellipse(100,100,mouseY, mouseY);
 
 ellipseMode(CENTER);
  fill(0,255,mouseY);
  ellipse(100, 200,mouseY, mouseY);
  
  ellipseMode(CENTER);
  fill(50, 255,mouseY);
  ellipse(200, 100,mouseY, mouseY);
  
  //this is for the squares starting from the top right to the bottom left
  

 
  rectMode(CENTER);
  noFill();
  stroke(30, 60, mouseX);
  rect(150, 150, mouseX, mouseX);
  
   rectMode(CENTER);
  noFill();
  stroke(30, 60, mouseX);
  rect(50, 50, mouseX, mouseX);
  
   rectMode(CENTER);
  noFill();
  stroke(30, 60, mouseX);
  rect(100,100, mouseX, mouseX);
  
  
   rectMode(CENTER);
  noFill();
  stroke(30, 60, mouseX);
  rect(200, 200, mouseX, mouseX);
  
   rectMode(CENTER);
  noFill();
 stroke(30, 60, mouseX);
  rect(250, 250, mouseX, mouseX);
  
  //this is for the squares starting from the bottom left to top right
  
  rectMode(CENTER);
  noFill();
  stroke(30, 60, mouseX);
  rect(50, 250, mouseX, mouseX);
  
  noFill();
  stroke(30, 60, mouseX);
  rect(100, 200, mouseX, mouseX);
  
  
  noFill();
  stroke(30, 60, mouseX);
  rect(200, 100, mouseX, mouseX);
  
  noFill();
 stroke(30, 60, mouseX);
 rect(250,50, mouseX, mouseX);
 }  


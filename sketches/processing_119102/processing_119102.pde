
void setup()
{
  size(500, 500);
  background(0);
 }
 
 
 void draw() 
{
  pushMatrix();   
  noFill();
  translate(-mouseX, 0);
  stroke(247, 7, 84);
  rect(250, 275, 20, 20);
  rect(250, 225, 20, 20);   
  popMatrix();
  resetMatrix(); 
  
  pushMatrix();
  noFill(); 
  translate(mouseX, 0); 
  stroke(247, 7, 84);
  rect(200, 210, 20, 20); 
  rect(200, 260, 20, 20);
  popMatrix();
  resetMatrix(); 
  
  
  pushMatrix(); 
  fill(255); 
  noStroke(); 
  translate(-mouseX, 0); 
  ellipse(100, 100, 30, 30);  
  popMatrix();
  resetMatrix(); 
  
  pushMatrix(); 
  translate(mouseX, 0); 
  ellipse(35, 35, 25, 25);
  popMatrix();
  resetMatrix(); 
 
  pushMatrix();
  translate(mouseX, 0);  
  ellipse(175, 175, 40, 40);  
  popMatrix();
  resetMatrix(); 
  
  pushMatrix(); 
  translate(-mouseX,0); 
  ellipse(325, 325, 40, 40); 
  popMatrix();
  resetMatrix(); 
  
  pushMatrix();
  translate(mouseX, 0); 
  ellipse(400, 400, 30, 30); 
  popMatrix();
  resetMatrix(); 
  
  pushMatrix(); 
  translate(-mouseX, 0); 
  ellipse(465, 465, 25, 25); 
  popMatrix();
  resetMatrix(); 
}

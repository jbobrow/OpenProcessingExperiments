
void setup() { 
  size(500, 500); 
  frameRate(15); 
  fill(0);
}
void draw() {
  float angle = atan2(mouseY, mouseX); 
  float deg = degrees(angle); 
  background(255); 
  
  pushMatrix();
   fill(0);
  rotate(angle);
    quad(0,0,800,0,800,800,0,800);
  popMatrix();
  float a = map (mouseX,0.0,500.0,0.0,15.0);
  strokeWeight(a);
    fill(255);
  ellipse(mouseX, mouseY, 80, 80); 
  ellipse(mouseX*1.5, mouseY*1.5, 40, 40); 
  ellipse(mouseX*1.8, mouseY*1.8, 5, 5); 
  ellipse(mouseX*2, mouseY*2, 8, 8); 
  ellipse(mouseX/2, mouseY/2, 40, 40); 
  ellipse(mouseX/4, mouseY/4, 5, 5); 
  ellipse(mouseX/8, mouseY/8, 8, 8);
}




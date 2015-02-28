
float angle = 0;

void setup() { 
  size(400, 300);
  smooth();
}
void draw() { 
  fill(200, 0, 0);
  translate(mouseX, mouseY); 
  rotate(angle);
  rect(0, 0, 30, 30); 
  angle += 0.5;
    
  fill(0, 0, 255);
  translate(12, 7); 
  rotate(angle);
  rect(0, 0, 15, 15);
  angle += 0.1;
  
  fill(255, 255, 0);
  pushMatrix();
  translate(10, 10);
  ellipse(15, 30, 10, 10);
  popMatrix();
}




void setup() {
  size(500, 500);
  
  
}

void draw() { 
  noFill();
  stroke(0);
  
  if (mouseX > 10) {
  ellipse(width/4, height/8, mouseX, mouseX); 
  ellipse(width - width/4, height/8, mouseX, mouseX); 
  ellipse(width/2, height/2, mouseX, mouseX); 
 
  } 
  
  else {
  background(255); 
  ellipse(width/4, height/8, mouseX, mouseX); 
  ellipse(width - width/4, height/8, mouseX, mouseX); 
  ellipse(width/2, height/2, mouseX, mouseX); 
  } 
}

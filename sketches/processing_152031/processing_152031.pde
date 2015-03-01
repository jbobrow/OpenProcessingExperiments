
int nat = 250;
int howe = 400;

void setup() {
  size(500, 500);
  
  
}

void draw() { 
  noFill();
  stroke(0);
  
  if (mouseX > 10) {
  ellipse(width/4, height/8, mouseX, mouseX); // left eye
  ellipse(width - width/4, height/8, mouseX, mouseX); //right eye
  ellipse(width/2, height/2, mouseX, mouseX); // mouth
  // ellipse(mouseX, mouseY, mouseX/HALF_PI, mouseY/PI+TWO_PI);
  } 
  
  else {
  background(255); 
  ellipse(width/4, height/8, mouseX, mouseX); // left eye
  ellipse(width - width/4, height/8, mouseX, mouseX); //right eye
  ellipse(width/2, height/2, mouseX, mouseX); // mouth
  // ellipse(mouseX, mouseY, mouseX/HALF_PI, mouseY/PI+TWO_PI);
  } 
}

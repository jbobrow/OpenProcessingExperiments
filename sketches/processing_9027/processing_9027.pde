
void setup() {
  background(130);
  size(640, 480);
  stroke(255);
  smooth();
}

void draw() {
  background(130);
  
  float X = constrain(mouseX,190,250);
  float Y = constrain(mouseY,200,300);
  float D = constrain(mouseX,366,435);
  float O = constrain(mouseY,200,300);
  
   
  stroke(0);
  smooth();
  fill (255);
  ellipse(220, 250, 108, 240);
  fill(0);
  ellipse(X, Y, 30, 90);
  fill(255);
  ellipse(X, Y+5, 12, 12);
  //left eye

  fill (255);
  ellipse(400, 250, 108, 300);
  fill(0);
  ellipse(D, O, 30, 90);
  fill(255);
  ellipse(D, O+5, 12, 12);
  //right eye
  
  
  color bg = color(130);
  if (get(mouseX, mouseY) != bg) {
    fill(0);
    if (mouseX < 320) {
      ellipse(220, 250, 108, 240);
    } else {
      ellipse(400, 250, 108, 300);
    }
    
    
    
  }

  
}






void setup() {
  size (800,800);
  smooth();
  background(0);
}

void draw() {

  if (mousePressed) {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(mouseX/100.0);
    
    noFill();
    
    stroke(255, 255, 0, 100);
    //stroke(0, 0, 0);
    
    if (mouseButton == LEFT) {
      ellipse (175, 0, (mouseY-400)/2, (mouseX-200)/2);
    }
    if (mouseButton == RIGHT) {
      rect(175, 0, (mouseY-400)/2, (mouseX-200)/2);
    }
    stroke(255, 0, 0, 100);
    ellipse (200, 0, (mouseY-400)/2, (mouseX-200)/2);
 
    stroke(0, 255, 255, 100);
    ellipse (225, 0, (mouseY-400)/2, (mouseX-200)/2);

    popMatrix();
  }
  
}
void keyPressed (){
  save("cicle"+random(1)+"jpg");
}


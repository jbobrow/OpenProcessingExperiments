
void setup() {
  size(300, 300);
  smooth();
}
void draw() {
  background(255);
  
  int dia = 100;
 
  if (intersect(width/2, height/2, dia/2, mouseX, mouseY, dia/2)) {
    fill(204,240,152, 100);
     background(64);    
  }
  else {
    fill(152,161,247, 100); 
  }
   
  rect(width/2, height/2, dia, dia);
  rect(mouseX,  mouseY, dia, dia); 
}
boolean intersect(float x1, float y1, float r1,
                  float x2, float y2, float r2) {
   
  float d = dist(x1, y1, x2, y2);
   
  if ( d < (r1 + r2) ) {
    return true;
  }
  else {
    return false;
  }
}
void keyPressed() {
  saveFrame("PS2_04image.jpeg");
}


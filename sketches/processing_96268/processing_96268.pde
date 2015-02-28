

void setup () {
  
  size(1300, 750);
  
  colorMode(HSB, 255);
  
  background(255);
}
 
void draw () {
  
  if (mousePressed) {
    
    background(#FFFFFF);
    
    strokeWeight(2);
    
    stroke(50);
  }
  else {
    
    strokeWeight(3);
    
    stroke (255);
  }
  
  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  
  fill(mouseY, height, height);
}
 
void variableEllipse (int x, int y, int px, int py) {
   
  float speed = abs(x-px) + abs(y-py);
  
   stroke(speed);
  
   ellipse(x, y, speed, speed);
}






void setup() {
  
  size(400,400);
  background(255);
  
}

void draw() {
 
  if(mousePressed) {
    float len = sqrt((mouseX - pmouseX) * (mouseX - pmouseX) + (mouseY - pmouseY) * (mouseY - pmouseY));
    stroke(len*3);
    strokeWeight(len/5);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  
}



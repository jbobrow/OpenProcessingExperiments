
void setup(){
  size(150,150);
}

void draw(){
  
  strokeWeight(random(50));
  stroke(random(255),random(255),random(255));
  line(mouseX,mouseY,mouseY,mouseX);
  
  strokeWeight(100);
  stroke(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,mouseX-pmouseX,mouseX-pmouseX);
  filter(BLUR,5);
  filter(POSTERIZE,8);
  
    
}

void mouseMoved() {
  fill(mouseY,mouseX,mouseY,150);
}

void mousePressed() {
  filter(INVERT);
}

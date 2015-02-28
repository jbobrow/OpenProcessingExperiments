
void setup(){
  size(600, 600);
  background(255, 26, 110);
}
void draw(){
  strokeWeight(abs(mouseX-pmouseX));
  stroke(mouseX, mouseY, mouseX-mouseY, 200);
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
  }  
  ellipse(mouseX, mouseY, random(2,300), random(2,500));
}

void mousePressed(){
  background(208,255,26);
}           
                                

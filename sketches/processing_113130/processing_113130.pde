
//processing practiceD
//by chen,wu-zhi


void setup() {
  size(500, 500);
  smooth();
  strokeWeight(0.5);
}
void draw() {
  if (mousePressed) {
    fill(150,40,105,50);
  } 
  else {
    fill(255,150,4,50);
  }
  ellipse(mouseX, mouseY, 40, 40);
  line(mouseX,mouseY,250,250);
  line(mouseX,mouseY,0,250);
  line(mouseX,mouseY,250,0);
  
}





void setup() {
  size (700, 700);
  smooth() ;
  background(140);
  noStroke();
}

void draw() {
  if (mousePressed && (mouseButton==LEFT)) {
   brush(mouseX,mouseY);
   
  }
}

void brush (int x, int y){
  fill (mouseX, mouseY, 50, 100);
  rotate(frameCount * 0.09);
  rect(mouseX, mouseY, 30, 150);
  rect(mouseX,mouseY, 150, 30);

  rect(mouseX-120, mouseY+120, 120,0);
  

 
  
  
  
}


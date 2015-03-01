
void setup() {
  size(600,600);
  background(255);
  smooth();
  translate(300,300);
  for(float i=0; i<360; i+=0.5) {
    pushMatrix();  
      rotate(radians(i));
      translate(0,200);
      rotate(radians(i+3));
      scale(map(sin(radians(i*6)),-1,1,0.5,1),map(sin(radians(i*3)),-1,1,0.5,1));
      drawFigure();
    popMatrix();
  }
}
void drawFigure() {
  noFill();
  stroke(0,0,0,128);
  ellipse(0,0,120,80); 
}



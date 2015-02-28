
void setup() {
  size(1000,900);
  smooth();
}
void draw() {
  background(40,255,30);
  face(150,200);
  face(300,500);
  
}  
  
  
 void face(int xCoordinate, int yCoordinate) { 
  pushMatrix();
   translate(xCoordinate, yCoordinate);
  fill(255, 230, 255);
smooth();
ellipse(150, 200, 250, 300);
fill(0,0,0);
arc(150, 170, 250, 250, PI, TWO_PI);

ellipse(100, 200, 40, 20);
ellipse(200, 200, 40, 20);
fill(255, 230, 255);
beginShape();
vertex(150, 200);
vertex(130, 250);
vertex(150, 250);
endShape();
fill(255,0,0);
arc(150, 280, 70, 70, TWO_PI, TWO_PI+PI);
popMatrix();
}


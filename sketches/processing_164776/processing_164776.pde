
float a = 300.0;
 void setup() {
   size(300, 300);
   background(30, 30, 90);
   smooth();
   noLoop();
 }
 
 void draw() {
   arch(a);
 }
 
 void arch(float across) {
   float y = TWO_PI;
   strokeWeight(6);
   fill(100, 100, 100); 
   beginShape();
   vertex(10, 50);
   bezierVertex(10, 100, 130, 55, 150, 55);
   bezierVertex(70, 155, 185, y-across, 185, y);
   endShape();
 }
   



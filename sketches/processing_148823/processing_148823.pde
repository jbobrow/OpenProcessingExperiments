
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Hyemi
// ID: 201420076
 
void setup() {
  size (1024, 768);
  smooth();
  noLoop();
}
 
void draw() {
  background(0);
 
    for (int a = 10; a<1024; a = a+30) {
    for (int b = 10; b<768; b = b+30) {
       
      stroke(0);
      fill(random(255));
      ellipse(a, b, 45, 45);
      fill(random(485));
      strokeWeight(2);
}
}
}
void keyPressed() {
     background(0);
     redraw();
}

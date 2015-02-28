
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: PARK Jeungeun
// ID:wjddms4036

void setup() {
  size (1024, 768);
  smooth();
  noLoop();
}

void draw() {
  background(0);

    for (int a = 10; a<1024; a = a+50) {
    for (int b = 10; b<768; b = b+50) {
      
      stroke(0);
      fill(255,255,255);
      ellipse(a, b, 45, 45);
      fill(random(255));
      stroke(255);
      rect(a-10, b-10, 20, 20);
      strokeWeight(random(5));
}
}
}
void keyPressed() {
     background(0);
     redraw();
} 


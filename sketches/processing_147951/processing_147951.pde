
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI IN SEO
// ID: 201420113
 
void setup() {
  size(1024, 768);
  background(#FAA8A8);
 
}

void draw() {
fill(#78EAFF);
  for (float i = 0; i <= width; i = i + 50) {
    for (float j = 0; j <= height; j = j + 50) {
fill(#8C8CBE);
 pushMatrix();
  translate (i, j);
  triangle (30.5,50,60,0,10,50);
  popMatrix();
}
  }
}
void keyPressed() {
 background(0);
 redraw();
}


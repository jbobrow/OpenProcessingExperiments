
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Eunjin Park
// ID: 201420079

void setup() { 
  size(600,600); 
  background(89,79,79);
  noLoop();
}
void draw() {
  noStroke();
fill(212,238,94);
  for (float i = 100; i <= width; i = i + 200) { 
    for (float j = 150; j <= height; j = j + 250) {
      tri1(i, j);
    }
  }
  fill(69,173,168);
  for (float k = 200; k <=900; k = k+200) {
    for (float h = 150; h <=height; h = h + 250) {
  tri2(k,h);
    }
  }
}
void tri1(float x1, float y1) { 
  pushMatrix(); 
  translate (x1, y1); 
  triangle (-75,42.5,75,42.5,0,-85);
  popMatrix();
}
void tri2(float x2, float y2) {
  pushMatrix();
  translate (x2,y2);
  triangle (-75,-85,75,-85,0,42.5);
  popMatrix();
}

void keyPressed(){
background(0);
redraw();
} 

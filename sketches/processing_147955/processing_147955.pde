
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM CHAEYEON
// ID: 201420073

void setup(){
size (1024, 768);
background(255);
smooth();
noLoop();
}
void draw() {
   fill(#96FFFF);
  for (int i=30; i<width; i=i+20) {
    for (int j=0; j<width; j=j+20) {
      noStroke();
      fill(#28A8A8);
pushMatrix();
 translate (i,j);
  triangle (50,30,20,30,40,50);
  popMatrix();

    }
  }
}
 
void keyPressed() {
  background(0);
  redraw();
}


import processing.opengl.*;

PShape stretch;

void setup() {
  size(620, 420, OPENGL);
  noStroke();
  fill(255);
  shapeMode(CENTER);
  stretch = loadShape ("stretch.svg");
}

void draw() {
  lights();
  //ambientLight(102, 102, 102);
  //directionalLight(255, 255, 255,  // Color
  //                 −1, 0, 0);      // Direction XYZ
  //pointLight(255, 255, 255,        // Color
  //          mouseX, 110, 50);      // Position
  //spotLight(255, 255, 255,         // Color
  //          mouseX, 0, 200,        // Position
  //          0, 0, −1,              // Direction XYZ
  //          PI, 2);                // Concentration

  rotateY(PI/24);
  background(0);
  translate(width/2, height/2);
  fill(255);
  shape(stretch, width/2, height/2);
  int dim = 18;
  for (int i = -height/2; i < height/2; i += dim*1.4) {
    for (int j = -height/2; j < height/2; j += dim*1.4) {
      pushMatrix();
      translate(i, j, -j);
     fill(210,0,210);
      box(mouseX, mouseY, dim);
      
      popMatrix();
  }
 }
}


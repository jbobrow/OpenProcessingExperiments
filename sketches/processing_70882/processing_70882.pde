
import processing.pdf.*;

void setup() {
  background(255);
  noStroke();
  size(600, 600, PDF, "Triangles.pdf");
}

void draw() {
  for (int i = -10; i <= width; i+=10) {
    for (int j = 0; j <= height; j+=10) {
//      stroke(0);
//      line(0, j, width, j);
//      line(i, 0, i, height);
//      noStroke();
      float randColor = random(0, 2);
      if (randColor > 0.75) {
        fill(0);
      }
      else {
        fill(255);
      }

      float randPlacement = random(0, 4);
      int point1 = 0;
      int point2 = 10;
      if (randPlacement < 1) {
        point1 = 0;
        point2 = 10;
      }
      else if (randPlacement < 2) {
        point1 = 10;
        point2 = 10;
      }
      else if (randPlacement < 3){
        point1 = 0;
        point2 = -10;
      }
      else {
        point1 = -10;
        point2 = 0; 
      }
      

      triangle(i, j, i, j+10, i+point2, j+point1);
    }
  } 

  exit();
}



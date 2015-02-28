
import processing.pdf.*;

void setup() {

  size(500, 500, PDF, "wallgull.pdf");
  background(97, 3, 252);
  smooth();
  noStroke();
  //stroke(3);
}

void draw() {
  int numColumns=10;
  int numRows=10;
  int w=width/numColumns;
  int h=height/numRows;

  for (int i=0; i< numColumns; i++) {
    for (int j=0; j<numRows; j++) {
      //head     
      fill(255);
      ellipse((0.3)*w + i*w, (0.3)*h + j*h, 15, 15); //.3 is 15 divided by the initial grid width/height
      // point((0.24)*w +i*w, 0.26*h + j*h);
      //eye
      fill(0);
      ellipse(0.3*w +i*w, 0.26*h +j*h, 3, 3);

      //body
      fill(255);
      arc(0.66*w +i*w, 0.3*h + j*h, 33, 33, 0, PI);

      //bottom beak
      fill(232, 122, 37); //orange
      //rotate(PI/3.0);
      arc(0.04*w +i*w, 0.22*h +j*h, 10, 2, 0, PI);
      //top beak
      arc(0.02*w +i*w, 0.22*h +j*h, 11, 2, radians(50), radians(220));

      //first leg
      //stroke(232,122,37);
      rect(0.7*w +i*w, 0.66*h +j*h, 1, 9);
      //second leg
      rect (0.62*w +i*w, 0.66*h +j*h, 1, 9);

      //point(0.7*w +i*w, 0.66*h +j*h);// 0.7*w +i*w, 0.84*h +j*h);

    }
  }

  exit();
}
                

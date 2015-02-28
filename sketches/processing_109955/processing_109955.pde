
import processing.pdf.*;

boolean needtorun = true; 

void setup() {
  size(12000, 12000,PDF,"flower14.pdf");
  background(255);
  stroke(0);
  strokeWeight(1);
  smooth();
  noFill();
//noLoop();
}

int squareSize = 13000;
int squareNum = 120000;
float angle = 0.0;
float randomAngle = 0;

void draw() {
  translate (width/2, height/2);

  //if (needtorun) {

    //random(0, 50);
    for (int i = 0; i < 1200; i++) {
      if (frameCount < squareNum) {
        pushMatrix();
        squareSize -= 10;
        randomAngle = random((angle/2)-angle);
        angle+=2; 
        rotate(radians(randomAngle));
        rect(-squareSize/2, -squareSize/2, squareSize, squareSize);
        popMatrix();
      }
      //needtorun = false;
      //save("flower1.jpg");
      println("DONE");
      exit();
    }
  }
//}

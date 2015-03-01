
import processing.pdf.*;

void setup(){
  //, PDF, "Generative.pdf"
  size(594, 842);
  background(255);
  for (int i = 100; i > 0; i--) {
    for (int j = 0; j < 5; j++) {
      noStroke();
      fill(150 + i, 0, 0, 20);
      ellipse(33 + j*107, 21 + i, i, i);
      ellipse(33 + j*107, -81 + i, i, i);
      ellipse(33 + j*107, 121 + i, i, i);
    }
  }
  for (int i = 100; i > 0; i--) {
      noStroke();
      fill(200, random(80), random(50), random(15));
      ellipse(140, 221 + i, i, i);
      noStroke();
      fill(150 + i, 0, 0, 20);
      ellipse(33, 221 + i, i, i);
      ellipse(247, 221 + i, i, i);
      ellipse(354, 221 + i, i, i);
      ellipse(461, 221 + i, i, i);
    }
  for (int i = 100; i > 0; i--) {
    for (int j = 0; j < 5; j++) {
      noStroke();
      fill(150 + i, 0, 0, 20);
      ellipse(33 + j*107, 321 + i, i, i);
    }
  }
}

void draw(){
 //exit();
} 



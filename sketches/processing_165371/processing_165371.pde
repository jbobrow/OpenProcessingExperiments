
import processing.pdf.*;

void setup(){
  //, PDF, "Generative.pdf"
  size(594, 842);
  background(255);
  noStroke();
  fill(120, 0, 0, 30);
  ellipse(297, 421, 4, 4);
  for (int i = 1; i < 36; i++){
    noStroke();
    fill(80 + i*5, 0, 0, 50);
    ellipse(297 + i*7, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
    ellipse(297 - i*7, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
    ellipse(297 - i*2, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
    ellipse(297 + i*2, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
  }  
  for (int i = 75; i > 10; i--) {
    for (int j = 0; j < 5; j++) {
      noStroke();
      fill(150 + i, 0, 0, 20);
      ellipse(3 + j*87, 501 + i, i, i);
    }
  }
  
    for (int i = 75; i > 10; i--) {
      noStroke();
      fill(200, random(80), random(50), i/15);
      ellipse(296, 421 + i, i, i);
      fill(150 + i, 0, 0, 20);
      ellipse(38, 541 + i, i, i);
      ellipse(125, 541 + i, i, i);
      ellipse(212, 541 + i, i, i);
      ellipse(386, 541 + i, i, i);
    }
    for (int i = 75; i > 10; i--) {
      for (int j = 0; j < 5; j++) {
      noStroke();
      fill(150 + i, 0, 0, 20);
      ellipse(68 + j*87, 581 + i, i, i);
      ellipse(98 + j*87, 621 + i, i, i);
      ellipse(128 + j*87, 661 + i, i, i);
      }
    }
}


void draw(){
 //exit();
} 



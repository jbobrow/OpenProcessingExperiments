
import processing.pdf.*;

void setup(){
  //, PDF, "Generative.pdf"
  size(594, 842, PDF, "Generative.pdf");
  background(255);
  noStroke();
  fill(200, 181, 73, 30);
  ellipse(297, 421, 4, 4);
  for (int i = 1; i < 36; i++){
    noStroke();
    fill(255 + i*0.5, 212 - i*5, 40 - i*10, 50);
    ellipse(297 + i*7, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
    ellipse(297 - i*7, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
    ellipse(297 - i*2, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
    ellipse(297 + i*2, 421 - i*12, 5 + sq(i)/4, 5 + sq(i)/4);
  } 
 
  for (int i = 75; i > 10; i--) {
    for (int j = 0; j < 5; j++) {
      noStroke();
      fill(170 + i, 0, 0, 20);
      ellipse(3 + j*87, 601 + i, i, i);
    }
  }
  
    for (int i = 75; i > 10; i--) {
      noStroke();
      fill(170 + i, 0, 0, 20);
      ellipse(40, 641 + i, i, i);
      ellipse(127, 641 + i, i, i);
      ellipse(214, 641 + i, i, i);
      ellipse(388, 641 + i, i, i);
    }
    for (int i = 75; i > 10; i--) {
      for (int j = 0; j < 5; j++) {
      noStroke();
      fill(170 + i, 0, 0, 20);
      ellipse(77 + j*87, 681 + i, i, i);
      ellipse(114 + j*87, 721 + i, i, i);
      ellipse(151 + j*87, 761 + i, i, i);
      }
    }
     
     for (int i = 125; i > 10; i--) {
      noStroke();
      fill(255, 181, 73, 8);
      ellipse(296.8, 421 + i, i, i);
 }     
}


void draw(){
 exit();
} 



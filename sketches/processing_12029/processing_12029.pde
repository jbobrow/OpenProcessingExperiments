
/*
/Jake Winstel
/Segmented Form Sketch
*/

void setup(){
  size(800, 600);
  background(170, 130, 40);
  smooth();
  
  FernFunction();
}

float x1 = 700.0;
float y1 = 50.0;
float speedx = -7;
float speedy = 0;
float gravity = .4;


void FernFunction(){
  noFill();
  beginShape();
  for(int i=0; i < 50; i++) {
    x1 += speedx;
    speedy += gravity;
    y1 += speedy;
    vertex(x1, y1);
    strokeWeight(3.0);
    stroke(10, 100, 50);
    rect(x1-3*i, y1-3*i, i*10, 10); 
  }
  endShape();
}



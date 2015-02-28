
void setup() {
  size(500, 500);
  frameRate(12);
  //noLoop();
}

void draw() {
  background(255, 247, 247);
  float prob_of_eye_closed = 0.01;
  
  /*
  for(int i=0; i<25; i++) {     
    ellipse(30, i*20, 50, 50);
    ellipse(30, i*20, 50, 30);
    ellipse(30, i*20, 50, 20);
    fill(209, 128, 53);
    ellipse(30, i*20, 50, 5);
  }
  */

  for (int x = 0; x <= width; x += 100) {
    for (int y = 0; y <= height; y+=100) {
      float is_eye_closed = random(0, 1);
      if (is_eye_closed < prob_of_eye_closed) {
        eye(x, y, true);
      } else {
        eye(x, y, false);
      }
    }  
  }
  

    //arc(100, 100, 25, 25, PI, 2*PI);    
}

void eye(int x, int y, boolean eye_closed) {
  fill(209, 128, 53);
  ellipse(x, y, 25, 25);
  noFill();
  
  fill(255);
  ellipse(x, y, 25, 15);
  noFill();
  
  fill(190, 217, 227);
  ellipse(x, y, 15, 15);
  noFill();
  
  fill(0);
  ellipse (x, y, 5, 5);
  
  if (eye_closed) {
    fill(209, 128, 53);
    arc(x, y, 25, 25, PI, 2*PI, CHORD);
    arc(x, y, 25, 25, 0, PI, CHORD);
  }
}


//
//  Press '1' or '2' to change rotation 
//  Press UP / DOWN to increase/decrease number of circles
//
float mx, my;
float radius; 
float angle = 0;
float faktor = 0.85;
int numCircles = 8; 
int rotMode = 1; 

void setup() {
  size(400, 400); 
  background(255);
  smooth(); 
  frameRate(15);

  mx = width/2; 
  my = height/2; 
  radius = width;
}

void draw() {
  background(255);

  float mx1, mx2; 
  float r1, r2;
  float x; 

  mx1 = mx; 
  mx2 = mx;
  r1 = radius; 
  r2 = radius;

  angle+= 0.1;

  fill(0);
  ellipse(mx, my, radius, radius);

  pushMatrix();
  translate(0, my);
  x = mx; 

  for (int i = 0; i < numCircles; i++) {
    if (i % 2 == 0) {
      translate(x, 0); 
      r2 = r1 * faktor;
      mx2 = r2/2;
      x = mx1 - mx2; 
      fill(255);
      if (rotMode == 1) {
        rotate(angle * (i+1));
      }
      if (rotMode == 2) {        
        rotate(angle);
      }
      ellipse(x, 0, r2, r2);
    } else {
      translate(x, 0); 
      r1 = r2 * faktor;
      mx1 = r1/2; 
      x = mx2 - mx1; 
      fill(0);
      if (rotMode == 1) {
        rotate(-angle * (i+1));
      }
      if (rotMode == 2) {        
        rotate(angle);
      }
      ellipse(x, 0, r1, r1);
    }
  }

  popMatrix();
}

void keyReleased() {
  if (key == '1') { 
    rotMode = 1;
  }
  if (key == '2') { 
    rotMode = 2;
  }
  if(key == CODED){
    if(keyCode == UP){
      numCircles = constrain(++numCircles, 2, 20);
    }
    if(keyCode == DOWN){
      numCircles = constrain(--numCircles, 2, 20);
    }
  }
}




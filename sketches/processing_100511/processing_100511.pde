
int r = 20; 

void setup() {
  size(320, 320);
  colorMode(RGB, 320, 200, 100);
  background(360);
 
  smooth();
  noLoop();
}
void mouseOver() {
 for (int i = 0; i < 10; i++) {
    for (int j = 0 ; j < 20;j++) {
      pushMatrix();
 
      if (j % 2 == 0) {
        translate(i*2*r, j*r*1.15);
        rotate(radians(180));
      } else { 
        translate(i*2*r+r, j*r*1.15);
      }
      float c = random(200);
      tri(c, 3, 4);
      popMatrix();
    }
  }
}

void mouseOut() {
 for (int i = 0; i < 10; i++) {
    for (int j = 0 ; j < 20;j++) {
      pushMatrix();
 
      if (j % 2 == 0) {
        translate(i*2*r, j*r*1.15);
        rotate(radians(180));
      } else { 
        translate(i*2*r+r, j*r*1.15);
      }
      float c = random(360);
      tri(c, 3, 4);
      popMatrix();
    }
  }
}
void draw() {

  for (int i = 0; i < 10; i++) {
    for (int j = 0 ; j < 20;j++) {
      pushMatrix();
 
      if (j % 2 == 0) {
        translate(i*2*r, j*r*1.15);
        rotate(radians(180));
      } else { 
        translate(i*2*r+r, j*r*1.15);
      }
      float c = random(360);
      tri(c, 3, 4);
      popMatrix();
    }
  }
}

void tri(float c, int x, int y) {

  for (int i = 0 ; i < 3; i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(360 * i/3));
  //  stroke(c, 80, 30*(i+1));
    fill(c, 60, 60*(i+1));
    
   ellipse(x,y,x, y);
 fill(c, 20, 60*(i+1));
   ellipse(x+28,y+17,x+28,y+28);
  fill(c, 100, 60*(i+1));
   ellipse(x+27,y-18,x+1,y+1);
  
   popMatrix();
  }
}



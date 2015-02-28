
int r = 20;

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);

  smooth();
  noLoop();
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
      tri(c);
      popMatrix();
    }
  }
}

void tri(float c) {
  for (int i = 0 ; i < 3; i++) {
    pushMatrix();
    translate(0, 0);
    rotate(radians(360 * i/3));
    stroke(c, 80, 30*(i+1));
    fill(c, 80, 30*(i+1));
    triangle(0, 0, -r*cos(radians(30)), r*sin(radians(30)), r*cos(radians(30)), r*sin(radians(30)));
    popMatrix();
  }
}




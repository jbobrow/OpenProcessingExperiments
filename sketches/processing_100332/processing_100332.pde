
int r = 20;

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);

  smooth();
  noLoop();
}

void draw() {
  float space = 2.5;

  for (int i = 0; i < 10; i++) {
    for (int j = 0 ; j < 9;j++) {
      pushMatrix();

      if (j % 2 == 0) {
        translate(i*r*space, j*r*space);
        rotate(radians(180));
      } else {  
        translate(i*r*space+(r*space)/2, j*r*space);
      }
      float h = random(360);
      tri(h);
      popMatrix();
    }
  }
}

void tri(float h) {
  float acute_angle = 10; //鋭角
  float obtuse_angle = (180 - acute_angle) / 2; //鈍角
  float val = 360 / acute_angle; //三角形の個数

  for (int i = 0 ; i < val; i++) {
    float s = random(30, 100);
    float b = random(30, 100);

    pushMatrix();
    translate(0, 0);
    rotate(radians(360 * i/val));
    stroke(h, s, b);
    fill(h, s, b);
    triangle(0, 0, -r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)), r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)));
    popMatrix();
  }
}



int R = 10;
int val = 20;
float rad = 360/val;

int rect_w = 30;
int rect_h = rect_w;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(360);

  translate(width/2, height/2);
  for (int i = 0; i < 50;i++) {
    for (int j = 0; j < val; j++) {
      pushMatrix();
      translate((R+i*5)*cos(radians(rad*j)), (R+i*5)*sin(radians(rad*j)));
      rotate(radians(rad*j+i*10));
      fill(rad*j, 100, 100, 30);
      rect(0, 0, rect_w*abs(sin(radians(i))), rect_h);
      popMatrix();
    }
  }
}




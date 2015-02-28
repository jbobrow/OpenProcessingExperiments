
float x = 1;
float y;

float[] xx = new float[4];
float[] yy = new float[4];

float[] plus = new float[8];
int num = 70;

void setup() {
  size(150, 450);
  background(0);
  smooth();

  x = width/2;
}

void draw() {
  for (int i = 0;i < 8; i++) {
    plus[i] = random(-num, num);
  }

  for (int j = 0; j <4;j++) {
    xx[j] = x + plus[j];
    yy[j] = y + plus[j+4];
  }

  PImage preImage = get();
  background(0);
  blend(preImage, 0, 1, width, height, 0, 0, width, height, ADD);

  noStroke();
  fill(random(50, 200), 0, 0);

  quad(xx[0], yy[0], xx[1], yy[1], xx[2], yy[2], xx[3], yy[3]);
 
  y++;

  if (y > height + num) {
    y = 0;
  }
}



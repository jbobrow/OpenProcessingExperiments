
//Day 58 #create365

int a = 150;
int range = 300;
 
int num = 3;
float X1, X2, X3, X4;
float Y1, Y2, Y3, Y4;
float zoff = 0.0;
float zinc = 0.002;
float inc = 0.2;

void setup() {
  size(640, 640);
  background(30);
  smooth();
  X1 = random(1000);
  X2 = random(1000);
  X3 = random(1000);
  X4 = random(1000);
  Y1 = random(1000);
  Y2 = random(1000);
  Y3 = random(1000);
  Y4 = random(1000);
}

void draw() {

  background(30);
  zinc = map(mouseX, 0, width, -0.05, 0.05);
  num = ceil(abs(map(mouseY, 0, height, -5, 5)));

  float x1 = X1;
  float x2 = X2;
  float x3 = X3;
  float x4 = X4;


  for (int i = 0; i < num; i++) {

    float y1 = Y1;
    float y2 = Y2;
    float y3 = Y3;
    float y4 = Y4;


    for (int j = 0; j < num; j++) {
      x1 += inc;
      x2 += inc;
      x3 += inc;
      x4 += inc;
      y1 += inc;
      y2 += inc;
      y3 += inc;
      y4 += inc;

      float h1 = map(noise(x1, zoff), 0, 1, -range, range);
      float h2 = map(noise(x2, zoff), 0, 1, -range, range);
      float h3 = map(noise(x3, zoff), 0, 1, -range, range);
      float h4 = map(noise(x4, zoff), 0, 1, -range, range);
      float v1 = map(noise(y1, zoff), 0, 1, -range, range);
      float v2 = map(noise(y2, zoff), 0, 1, -range, range);
      float v3 = map(noise(y3, zoff), 0, 1, -range, range);
      float v4 = map(noise(y4, zoff), 0, 1, -range, range);

      float r = map(noise(x1, zoff), 0, 1, 0, 255);
      float g = map(noise(y2, zoff), 0, 1, 0, 255);
      float b = map(noise(x4, zoff), 0, 1, 0, 255);

      noStroke();
      fill(r, g, b, 170);
      pushMatrix();
      translate(width/2, height/2);
      quad(-a + h1, -a + v1, a + h2, -a+ v2, a+ h3, a + v3, -a + h4, a + v4);

      popMatrix();
    }
  }
  zoff += zinc;
}

void mouseClicked() {
  X1 = random(1000);
  X2 = random(1000);
  X3 = random(1000);
  X4 = random(1000);
  Y1 = random(1000);
  Y2 = random(1000);
  Y3 = random(1000);
  Y4 = random(1000);
}


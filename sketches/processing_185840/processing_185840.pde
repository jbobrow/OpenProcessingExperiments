
float a;
float b;
float c;
float x;
float y;

int num = 5000;

float r1 = 0;
float t1 = 0.2;
float r2 = 0;
float t2 = 1;
float h2 = 0.5;

float r1_goal = r1 + t1;
float r2_goal = r2 + t2;

float R;

float A = 2;
float B = 3;
float C = 5;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  //noLoop();
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(-90));
  noStroke();
  for (int i = 0; i <= num; i += 1) {
    b = cos(r2*2);
    a = b * h2 * 2+ 1; 
    c = (cos(r2*A)-cos(r2*B))/C;
    x = 80 * a * sin(r1 + c);
    y = 80 * a * cos(r1 + c);

    r1 += t1;
    r2 += t2;

    if (i % 3 == 0) {
      R = 25;
      fill(180, random(50, 100), random(50, 100), 10);
    } else {
      R = 5;
      fill(360, 10);
    }
    ellipse(x, y, R, R);
  }

  r1 = r1_goal;
  r2 = r2_goal;

  popMatrix();

}


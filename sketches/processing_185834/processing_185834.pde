
float a;
float b;
float c;
float d;
int num = 5000;
float x;
float y;
float r1 = 0;//266549;//0;
float t1 = 0.2;
float r2 = 0;//1320000;//0;
float t2 = 1;
float h2 = 0.5;
float r3 = 0;//133274;//0;
float t3 = 0.1;
float h3 = 0.2;

float r1_goal = r1 + t1;// * num;
float r2_goal = r2 + t2;// * num;
float r3_goal = r3 + t3;// * num;

float R;
float theta = 0;

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
  rotate(radians(90));
  noStroke();
  for (int i = 0;i <= num;i += 1) {
    b = sin(r2);
    a = b * h2 +2; 
    c = (cos(r2)+cos(r2));
    x = 50 * a * sin(r3 * 3 + c);
    y = 50 * a * cos(r3 * 3 + c);

    r1 += t1;
    r2 += t2;
    r3 += t3;

    if (i % 5 == 0) {
      R = 20;
      fill(100, random(50, 100), random(50, 100), 10);
    }
    else {
      R = 5;
      fill(360, 10);
    }
    ellipse(x, y, R, R);
  }

  r1 = r1_goal;
  r2 = r2_goal;
  r3 = r3_goal;

  popMatrix();
}



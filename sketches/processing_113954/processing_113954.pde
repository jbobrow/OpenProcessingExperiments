
int tri_val = 72;

Triangle[] tri = new Triangle[tri_val];

float hue = random(360);

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < tri.length;i++) {
    tri[i] = new Triangle(i, tri_val);
  }
}

void draw() {
  background(360);

  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0 ; i < tri.length;i++) {
    tri[i].move();
    tri[i].display(hue);
  }
  popMatrix();

  hue += 1;
  if (hue > 360) {
    hue = 0;
  }
}

void mousePressed() {
  for (int i = 0 ; i < tri.length;i++) {
    tri[i].sat = random(30, 100);
    tri[i].brt = random(30, 100);
  }
}

class Triangle {
  int num;
  int val;
  float S = random(0, 200);

  float sat = random(30, 100);
  float brt = random(30, 100);

  float theta = random(TWO_PI);
  float S_delta = random(0.01, 0.05);

  float acute_angle; //鋭角
  float obtuse_angle; //鈍角

  Triangle(int tmpNum, int tmpVal) {
    num = tmpNum;
    val = tmpVal;

    acute_angle = 360 / val;
    obtuse_angle = (180 - acute_angle) / 2;
  }

  void move() {
    S = 200 * abs(sin(theta));
    theta += S_delta;
  }

  void display(float hue) {
    stroke(hue, sat, brt);
    fill(hue, sat, brt);

    pushMatrix();
    translate(0, 0);
    rotate(radians(360*num/val));
    triangle(0, 0, -S*cos(radians(obtuse_angle)), S*sin(radians(obtuse_angle)), S*cos(radians(obtuse_angle)), S*sin(radians(obtuse_angle)));
    popMatrix();
  }
}




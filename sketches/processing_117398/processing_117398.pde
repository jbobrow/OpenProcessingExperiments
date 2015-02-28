
Jewel[] jewels = new Jewel[30];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  strokeWeight(1.5);
  strokeJoin(ROUND);

  for (int i = 0;i < jewels.length;i++) {
    jewels[i] = new Jewel();
  }
}

void draw() {
  background(0);

  for (int i = 0;i < jewels.length;i++) {
    jewels[i].move();
    jewels[i].display();
  }
}

class Jewel {
  float r = random(20, 50);
  float x = random(width);
  float y = random(height);

  float polygon_r = r * random(0.4, 0.8);
  float hue = random(360);
  float sat = random(30, 100);
  float bright = random(50, 100);
  int vertex_num = (int)random(3, 12);

  int random_sign = (int)random(4);
  int x_sign = 0;
  int y_sign = 0;
  float spd = random(0.5, 2);
  float rotate_theta;
  int rotate_sign;
  float rotate_spd = random(0.03, 0.06);

  Triangle[] tri = new Triangle[vertex_num];

  Jewel() {
    if (random_sign == 0) {
      x_sign = -1;
    }
    else if (random_sign == 1) {
      x_sign = 1;
    }
    else if (random_sign == 2) {
      y_sign = -1;
    }
    else {
      y_sign = 1;
    }

    if (random(1) >= 0.5) {
      rotate_sign = 1;
    }
    else {
      rotate_sign = -1;
    }

    for (int i = 0;i < tri.length;i++) {
      tri[i] = new Triangle(vertex_num, r, hue);
    }
  }

  void move() {
    x += x_sign * spd;
    y += y_sign * spd;

    rotate_theta += rotate_sign * rotate_spd;

    if (x > width + r*2 || x < -r*2) {
      x_sign *= -1;
      setting();
    }
    if (y > height + r*2 || y < -r*2) {
      y_sign *= -1;
      setting();
    }
  }

  void display() {
    stroke(360,150);

    pushMatrix();
    translate(x, y);
    rotate(rotate_theta);
    //三角形---------------------------------------------
    for (int i = 0;i < tri.length;i++) {
      pushMatrix();
      translate(0, 0);
      rotate(radians(360*i/vertex_num));
      tri[i].display(0, 0);
      popMatrix();
    }

    //正多角形---------------------------------------------
    fill(hue, sat, bright);
    pushMatrix();
    translate(0, 0);
    //奇数 -90
    //4でわりきれない偶数 0
    //8でわりきれる偶数 *4.5
    //4でわりきれる偶数 +45
    if (vertex_num % 2 == 1) { //奇数
      rotate(radians(360/vertex_num -90));
    }
    else if (vertex_num % 8 == 0) { //8でわりきれる偶数
      rotate(radians(360/vertex_num * 1.5));
    }
    else if (vertex_num % 4 == 0) { //4でわりきれる偶数
      rotate(radians(360/vertex_num + 45));
    }
    else { //4でわりきれない偶数
      rotate(radians(360/vertex_num));
    }
    polygon(0, 0, polygon_r, vertex_num);
    popMatrix();

    popMatrix();
  }

  void setting() {
    polygon_r = r * random(0.4, 0.8);
    hue = random(360);
    sat = random(30, 100);
    bright = random(50, 100);

    for (int i = 0;i < tri.length;i++) {
      tri[i].hue = hue;
      tri[i].s = random(30, 100);
      tri[i].b = random(50, 100);
    }
  }
}

void polygon(float x, float y, float r, int vertex_num) {
  pushMatrix();
  translate(x, y);
  beginShape();
  for (int i = 0 ; i < vertex_num;i++) {
    vertex(r*cos(radians(360*i/vertex_num)), r*sin(radians(360*i/vertex_num)));
  }
  endShape(CLOSE);
  popMatrix();
}

class Triangle {
  float x;
  float y;
  int vertex_num;
  float r;

  float hue;
  float s = random(30, 100);
  float b = random(50, 100);

  float acute_angle; //鋭角
  float obtuse_angle; //鈍角

  Triangle(int tmpNum, float tmpR, float tmpHue) {
    vertex_num = tmpNum;
    r = tmpR;
    hue = tmpHue;
  }

  void display(float x, float y) {
    acute_angle = 360/vertex_num; //鋭角
    obtuse_angle = (180 - acute_angle) / 2; //鈍角

    pushMatrix();
    translate(x, y);
    fill(hue, s, b);
    triangle(0, 0, -r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)), r*cos(radians(obtuse_angle)), r*sin(radians(obtuse_angle)));
    popMatrix();
  }
}




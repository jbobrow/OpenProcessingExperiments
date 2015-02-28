
Triangle[] tri = new Triangle[50];
float hue = random(360);

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < tri.length;i++) {
    tri[i] = new Triangle();
  }
}

void draw() {
  noStroke();
  fill(360, 30);
  rect(0, 0, width, height);

  for (int i = 0 ; i < tri.length;i++) {
    tri[i].move();
    if (!tri[i].finished()) {
      tri[i].display(hue);
    }
    else {
      hue = random(360);
    }
  }
}

class Triangle {
  float r = 0; //等しい二辺の長さ
  float acute_angle = 5; //鋭角
  float obtuse_angle = (180 - acute_angle) / 2; //鈍角
  float theta = random(TWO_PI);
  float spd = random(1, 3)*3;
  int life = 450;
  float satu = random(20, 100);  //saturation
  float bright = random(20, 100); //brightness

  Triangle() {
  }

  void move() {
    r += spd;
    spd -= 0.1;

    if (finished()) {
      r = 0;
      theta = random(TWO_PI);
      spd = random(1, 3)*3;
      life = 450;
    }
  }

  void display(float hue) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(theta);
    noStroke();
    fill(hue, satu, bright);
    triangle(0, -r*sin(radians(obtuse_angle)), -r*cos(radians(obtuse_angle)), 0, r*cos(radians(obtuse_angle)), 0);
    popMatrix();
  }

  boolean finished() {
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }
}




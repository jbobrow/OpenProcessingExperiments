
float num;

void setup() {
  size(600, 600);
  colorMode(RGB, 255, 255, 255);
  smooth();

  noLoop();
  randomSeed(0);

  noStroke();
}

color bg = color(247, 242, 140);

color[] c = {
  color(247, 242, 140), color(137, 47, 29), color(130, 219, 150), color(0, 200, 0)
};

void draw() {
  background(bg);

  draw_footmark();
  draw_flower();
  draw_rabbit();
  draw_heart();
}

void draw_footmark() {
  for (int i = 0; i < 250;i++) {
    pushMatrix();
    translate(random(width/2), random(height/2));
    rotate(sin(random(-1, 1)));
    fill(c[(int)random(3.999999999)]);
    footmark(random(3, 10));
    popMatrix();
  }
}

void footmark(float s) {
  ellipse(0, 0, 5*s, 3*s);
  ellipse(0, -1*s, 3*s, 3*s);

  ellipse(-3.5*s, -2*s, 2*s, 2*s);
  ellipse(-1.5*s, -4*s, 2*s, 2*s);
  ellipse(1.5*s, -4*s, 2*s, 2*s);
  ellipse(3.5*s, -2*s, 2*s, 2*s);
}

void draw_flower() {
  for (int i = 0; i < 100;i++) {
    pushMatrix();
    translate(random(width/2, width), random(height/2));
    peacock(0, 0);
    popMatrix();
  }
}

void peacock(float x, float y) {
  num = random(0.2, 0.6);
  for (int i = 6;i>=3;i-=2) {
    noStroke();
    fill(c[(int)random(3.999999999)]);
    drop(x, y, i);
    fill(c[(int)random(3.999999999)]);
    drop(x, y, i-1);
  }
}

void drop(float x, float y, int s) {
  for (int j = 0 ; j <= 6; j++) {
    pushMatrix();
    translate(x, y);
    rotate(radians((360/ 6) * j));

    for (int i = 10; i > 0;i--) {
      ellipse(0, (i*1.2*s)*num, (s*i+3)*num, (s*i+3)*num);
    }
    popMatrix();
  }
}

void draw_rabbit() {
  for (int i = 0; i < 200;i++) {
    pushMatrix();
    translate(random(width/2, width), random(height/2, height));
    fill(c[(int)random(3.999999999)]);
    rabbit(0, 0, random(0.1, 0.7));
    popMatrix();
  }
}

void rabbit(float x, float y, float s) {
  pushMatrix();
  translate(x-30*s, y-40*s);
  rotate(100);
  ellipse(0, 0, 30*s, 60*s);
  popMatrix();

  pushMatrix();
  translate(x+30*s, y-40*s);
  rotate(-100);
  ellipse(0, 0, 30*s, 60*s);
  popMatrix();

  ellipse(x, y, 70*s, 60*s);
}

void draw_heart() {
  for (int i = 0; i < 250;i++) {
    float s = random(20, 50);
    pushMatrix();
    translate(random(width/2), random(height/2, height));
    rotate(random(-1, 1));
    fill(c[(int)random(3.999999999)]);
    heart(0, 0, s, s);
    popMatrix();
  }
}

//http://blog.p5info.com/?p=28
void heart(float centerX, float centerY, float width, float height) {
  final float WIDTH = width / 2 * 0.85;
  final float HEIGHT = height / 2;
  final float OFFSET = centerY - (HEIGHT / 6 * 5);
  beginShape();
  for (int i = 0; i < 30; i++) {
    float tx = abs(sin(radians(i * 12))) * (1 + cos(radians(i * 12))) * sin(radians(i * 12)) * WIDTH + centerX;
    float ty = (0.8 + cos(radians(i * 12))) * cos(radians(i * 12)) * HEIGHT + OFFSET;
    vertex(tx, ty);
  }
  endShape(CLOSE);
}


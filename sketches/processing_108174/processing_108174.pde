
Shape[] shapes = new Shape[100];

void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < shapes.length;i++) {
    shapes[i] = new Shape(i);
  }

  strokeWeight(2);

  strokeJoin(ROUND);

  noLoop();
}

void draw() {
  background(360);

  for (int i = 0 ; i < shapes.length;i++) {
    shapes[i].display();
  }
}

class Shape {
  float x;
  int y;

  int num;

  int vertex_num = (int)random(2, 12) * 2;

  float draw_r;
  int R =  30;
  float r = R * random(0.3, 1);

  float theta = random(TWO_PI);

  float hue = random(360);

  Shape(int tmpNum) {
    num = tmpNum;

    x = (num%10) * R*2 + R;
    y = (int)(num/10) * R*2 + R;
  }

  void display() {
    stroke(hue, 100, 80);
    fill(hue, 30, 100);

    pushMatrix();
    translate(x, y);
    rotate(theta);
    beginShape();
    for (int i = 0 ; i < vertex_num;i++) {
      if (i % 2 == 0) {
        draw_r = R;
      }
      else {
        draw_r = r;
      }
      vertex(draw_r*cos(radians(360 * i / vertex_num)), draw_r*sin(radians(360 * i / vertex_num)));
    }
    endShape(CLOSE);
    popMatrix();
  }
}




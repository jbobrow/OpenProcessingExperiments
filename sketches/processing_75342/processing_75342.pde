
Circle[] circle = new Circle[70];


void setup() {
  size(500, 500);
  background(255);
  smooth();
  randomSeed(0);

  for (int i = 0; i < circle.length;i++) {
    circle[i] = new Circle();
  }

  //noLoop();
}

void draw() {

  background(255);

  for (int i = 0; i <circle.length;i++) {
    circle[i].display(i);  
    circle[i].move();
  }
}


class Circle {
  float x;
  float y;
  float r;
  float x_speed;
  float y_speed;
  float g;
  int random_num;

  Circle() {
    r = random(30, 80);

    x = random(r/2, width -r/2);
    y = random(r/2, height - r/2);

    x_speed = random(-3, 3);
    y_speed = random(-3, 3);
    g = random(255);

    random_num = (int)random(-10, 10);
  }

  void display(int i) {
    draw_circles();
    draw_lines(i);
  }

  void draw_circles() {
    noStroke();

    fill(0, g, 255, 80);

    ellipse(x, y, r, r);

    fill(0, 0, 255, 80);
    ellipse(x, y, 5, 5);
  }


  void draw_lines(int i) {
    stroke(0, 0, 255, 80);

    int num = i + random_num;

    if (num < 0) {
      num *= -1;
    }
    if (num == i) {
      num++;
    }
    if (num > circle.length - 1) {
      num -= circle.length;
    }


    for (int j = 0; j < 1;j++) { 
      line(circle[i].x, circle[i].y, circle[num].x, circle[num].y);
    }
  }

  void move() {
    x += x_speed;
    y += y_speed;

    if (x > width - r/2 || x < r/2) {
      x_speed *= -1;
    }

    if (y > height - r/2 || y < r/2) {
      y_speed *= -1;
    }
  }
}





star[] stars;
star2[] stars_2;
star3[] stars_3;

int MAX_STARS = 100;
int MAX_STARS_2 = 100;
int MAX_STARS_3 = 100;

float angle = 0;
boolean click = false;

void setup() {

  size(1000, 1000, P3D);
  stars = new star[MAX_STARS];
  for (int i=0; i< MAX_STARS; ++i) {
    stars[i] = new star();
  }

  stars_2 = new star2[MAX_STARS];
  for (int i=0; i< MAX_STARS_2; ++i) {
    stars_2[i] = new star2();
  }

  stars_3 = new star3[MAX_STARS];
  for (int i=0; i< MAX_STARS_3; ++i) {
    stars_3[i] = new star3();
  }
}

void draw() {
  translate(width/2, height/2, 100);

  background(0);

  for (int i=0; i< MAX_STARS; ++i) {
    stars[i].render();

    rotate(angle);
  }

  for (int i=0; i< MAX_STARS_2; ++i) {
    stars_2[i].render2();
    rotate(angle);
  }

  for (int i=0; i< MAX_STARS_3; ++i) {
    stars_3[i].render3();
    rotate(angle);
  }

  noStroke();
  fill(0);
  ellipse(0, 0, 60, 60);
}


class star {
  int x, y, z;
  color c;
  float size;
  star() { // constructor
    x = (int)random(-750, 750);
    y = (int)random(-750, 750);
    z = (int)random(-1000, -2000);
    c = color(255);
    size = random(2, 4);
  }

  void render() {
    stroke(c);
    strokeWeight(size);
    point(x, y, z);

    angle += radians(0.0001);
    z -= 4;
  }
}

class star2 {

  int x, y, z;
  color c;
  float size;
  star2() { // constructor
    x = (int)random(-500, 500);
    y = (int)random(-500, 500);
    z = (int)random(-1000, -2000);
    c = color(255);
    size = random(1, 3);
  }

  void render2() {
    stroke(c);
    strokeWeight(size);
    point(x, y, z);

    angle += radians(0.00005);
    z -= 4;
  }
}


class star3 {
  int x, y, z;
  color c;
  float size;
  star3() { // constructor
    x = (int)random(-350, 350);
    y = (int)random(-350, 350);
    z = (int)random(-1000, -2000);
    c = color(255);
    size = random(1, 3);
  }

  void render3() {
    stroke(c);
    strokeWeight(size);
    point(x, y, z);

    angle += radians(0.00005);
    z -= 4;
  }
}


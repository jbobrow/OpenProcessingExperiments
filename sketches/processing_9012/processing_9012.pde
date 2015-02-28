
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
float easing = 0.15;

void setup() {
  size(640, 480);
  noStroke();
}

void draw() {
  smooth();
  background(0);

  if (mousePressed) {

    pushMatrix();
    fill(249, 193, 20);
    translate(170, 191);
    rotate(PI/7);
    ellipse(0, 0, 120, 85);
    popMatrix();

    pushMatrix();
    translate(473, 191);
    rotate(-PI/7);
    ellipse(0, 0, 120, 85);
    popMatrix();

    int w = 50;
    int h = 60;
    int w2 = 0;

    fill(0);
    float mx = constrain(mouseX, 146, 200);
    float my = constrain(mouseY, 164, 200);
    x += (mx-x) * easing;
    y += (my-y) * easing;
    ellipse(x, y, w/2, h);


    float mx2 = constrain(mouseX, 442, 496);
    float my2 = constrain(mouseY, 164, 200);
    x2 += (mx2-x2) * easing;
    y2 += (my2-y2) * easing;
    fill(0);
    ellipse(x2, y2, w/2, h);

    triangle(101, 157, 198, 100, 237, 209);
    triangle(405, 209, 445, 99, 542, 155);

  } else {

    pushMatrix();
    fill(84, 226, 209);
    translate(170, 191);
    rotate(PI/7);
    ellipse(0, 0, 120, 85);
    popMatrix();

    pushMatrix();
    translate(473, 191);
    rotate(-PI/7);
    ellipse(0, 0, 120, 85);
    popMatrix();

    fill(0);
    float mx = constrain(mouseX, 146, 200);
    float my = constrain(mouseY, 164, 218);
    x += (mx-x) * easing;
    y += (my-y) * easing;
    ellipse(x, y, 50, 60);

    float mx2 = constrain(mouseX, 442, 496);
    float my2 = constrain(mouseY, 164, 218);
    x2 += (mx2-x2) * easing;
    y2 += (my2-y2) * easing;
    fill(0);
    ellipse(x2, y2, 45, 60);
  }
}











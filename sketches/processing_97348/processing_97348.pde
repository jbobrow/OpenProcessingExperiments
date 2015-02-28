
float e_one_x = 20;
float e_two_x = 400-20;

void setup() {
  size(400, 260);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
}

void draw() {
  background(360);

  color_bar(10);
  color_bar(200);

  ellipse_one();
  ellipse_two();

  leap_bar();

  line_one();
  line_two();
}

void leap_bar() {
  color from;
  color to;
  color c;


  for (int i = 0; i < 360;i++) {
    from = color(e_one_x-20, 100, 100);
    to = color(e_two_x-20, 100, 100);


    c = lerpColor(from, to, i/360.0);


    stroke(hue(c), 100, 100);
    strokeWeight(1);
    line(20+i, height/2-25, 20+i, height/2+25);
  }
}

void ellipse_one() {
  stroke(0);
  strokeWeight(3);
  fill(360, 150);
  if (mouseY > 10 && mouseY < 60) {
    if (mouseX < 20) {
      e_one_x = 20;
    }
    else if (mouseX > 20+360) {
      e_one_x = 20+360;
    }
    else {
      e_one_x = mouseX;
    }
  }
  ellipse(e_one_x, 35, 15, 15);
}

void line_one() {
  stroke(0);
  strokeWeight(1);
  line(20, height/2, e_one_x, 35);
}

void ellipse_two() {
  stroke(0);
  strokeWeight(3);
  fill(360, 150);
  if (mouseY > 10+200 && mouseY < 60+200) {
    if (mouseX < 20) {
      e_two_x = 20;
    }
    else if (mouseX > 20+360) {
      e_two_x = 20+360;
    }
    else {
      e_two_x = mouseX;
    }
  }
  ellipse(e_two_x, 35+200-10, 15, 15);
}

void line_two() {
  stroke(0);
  strokeWeight(1);
  line(width-20, height/2, e_two_x, 35+200-10);
}

void color_bar(int y) {
  for (int i = 0; i < 360;i++) {
    stroke(i, 100, 100);
    strokeWeight(1);
    line(20+i, y, 20+i, y+50);
  }
}




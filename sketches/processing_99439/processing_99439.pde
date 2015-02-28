
Circle[] circles = new Circle[30];

void setup() {
  size(500, 500);
  background(0);
  smooth();

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }

  strokeWeight(3);
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0 ; i < circles.length;i++) {
    circles[i].display();
  }
  popMatrix();
}

class Circle {
  float circle_w;
  float circle_h;
  float circle_t;
  float circle_spd;
  float circle_spd_val;
  int circle_rotate_sign;
  float circle_color = random(10,255);

  float packet1_x;
  float packet1_y;
  float packet1_t;
  float packet2_x;
  float packet2_y;
  float packet2_t;
  float packet_spd;
  int packet_sign;

  Circle() {
    circle_w = random(30, 150);
    circle_h = circle_w * 10 / 2;
    circle_t = random(TWO_PI);

    if (random(1) >= 0.5) {
      circle_rotate_sign = 1;
    }
    else {
      circle_rotate_sign = -1;
    }

    circle_spd_val = random(0.001, 0.005);
    packet1_t = random(TWO_PI);
    packet2_t = packet1_t;
    packet_spd = random(0.01, 0.03);

    if (random(1) >= 0.5) {
      packet_sign = 1;
    }
    else {
      packet_sign = -1;
    }
  }

  void display() {
    pushMatrix();

    //circle
    translate(0, 0);
    rotate(circle_t+circle_spd);
    noFill();
    stroke(0, circle_color, circle_color, 80);
    ellipse(0, 0, circle_w, circle_h);

    //packet
    packet1_x = circle_w/2 * cos(packet1_t);
    packet1_y = circle_h/2 * sin(packet1_t);
    packet2_x = circle_w/2 * cos(packet2_t+PI);
    packet2_y = circle_h/2 * sin(packet2_t+PI);

    fill(0, 255, 255, 80);
    noStroke();
    ellipse(packet1_x, packet1_y, 10, 10);
    ellipse(packet2_x, packet2_y, 10, 10);
    popMatrix();

    packet1_t += packet_sign * packet_spd;
    packet2_t += packet_sign * packet_spd;
    circle_spd += circle_rotate_sign * circle_spd_val;
  }
}


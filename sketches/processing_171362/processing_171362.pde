

Ball ball1;
Ball ball2;
color grean1 = color(232, 237, 172);
color grean2 = color(126, 202, 143);
color grean3 = color(71, 172, 118);
color ornge1 = color(237, 174, 86);
color ornge2 = color(219, 130, 73);
color ornge3 = color(204, 91, 63);
color bloue1 = color(194, 77, 72);
color bloue2 = color(93, 83, 76);
color bloue3 = color(39, 98, 88);

void setup() {
  size(900, 600);
  ball1 = new Ball(225, height/(random(2, 5)));
  ball2 = new Ball(675, height/(random(2, 5)));
}

void draw() {
  if (keyPressed) {
    if (key == '1') {
      background(grean1);
      fill(grean3);
    } else if (key == '2') {
      background(ornge1);
      fill(ornge3);
    } else if (key == '3') {
      background(bloue1);
      fill(bloue3);
    } 
  } else {
    background(grean1);
    fill(grean3);
  }
  rect(mouseX, 0, 900, 600);
  noStroke();
  ball1.move();
  ball1.display();
  ball2.move();
  ball2.display();
}

//---------------------------------

class Ball {
  
  color grean2 = color(126, 202, 143);
  color ornge2 = color(219, 130, 73);
  color bloue2 = color(93, 83, 76);
  float spring = 0.4;
  float gravity = 0.2;
  float friction = -.95;
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
 
  Ball(float xin, float yin) {
    x = xin;
    y = yin;
  } 
  
  void move() {
    vy += gravity;
    x += vx;
    y += vy;
    if (y + 60 > height) {
      y = height - 60;
      vy *= friction; 
    } 
    else if (y - 60 < 0) {
      y = 60;
      vy *= friction;
    }
  }
  
  void display() {
    if (keyPressed) {
      if (key == '1') {
        fill(grean2);
      } else if (key == '2') {
        fill(ornge2);
      } else if (key == '3') {
        fill(bloue2);
      } 
    } else {
      fill(grean2);
    }
    ellipse(x, y, 120, 120);
  }
}





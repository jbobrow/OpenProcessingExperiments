
float speed;
float x;
float y;
float angle, vx, vy;
float ay;

void setup() {
    size(600, 600);
    speed = 5;
    x = 0;
    y = 300;
    angle = radians(-65);
    vx = speed * cos(angle);
    vy = speed * sin(angle);
    ay = 0.05;
}

void draw() {
   
    //background(117, 225, 244);
    fill(117, 225, 244, 50);
    rect(0, 0, width, height);
    fill(117, 225, 244, 255);
    x = x + vx;
    y = y + vy;
    vy = vy + ay;
    fill(235, 67, 235);
    stroke(242, 119, 242);
    ellipse(x, y, 10, 10);
    
    stroke(0, 0, 0);
    fill(150, 150, 150);
    translate(0, 300);
    rotate(angle);
    rect(0, -5, 40, 10);
    rotate(-angle);
    translate(0, -300);
    ellipse(0, 300, 30, 30);
    stroke(55, 185, 17);
    fill(55, 185, 17);
    rect(0, 580, 599, 20);
    stroke(0, 0, 0);
    fill(165, 69, 12);
    quad(490, 580, 450, 580, 440, 540, 500, 540);
}

void mousePressed() {
     x = 0;
     y = 300;
     vx = speed * cos(angle);
     vy = speed * sin(angle);
  }

void mouseMoved() {
  angle = atan2(mouseY-300, mouseX);
}


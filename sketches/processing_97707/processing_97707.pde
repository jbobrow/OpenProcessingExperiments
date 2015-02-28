
PImage bkgd;
PImage caveman;
PImage food;
PImage clouds;

float angle2 = 0.0;
float angle = 0.0;
float offset = 80;
float offset2 = 600;
float scalar = 20;
float speed = 0.05;
float x = 110;
int direction = 1;
float xpos = 500;
float ypos = 40;
float xspeed = 2;

void setup() {
    size(1024, 786);
    smooth();
    bkgd = loadImage("background.jpg");
    caveman = loadImage("caveman.png");
    food = loadImage("food.png");
    clouds = loadImage("clouds.png");
}

void draw() {
  background(bkgd);
  shake();
  shake2();
  move();
  imageMode(CENTER);
  translate(mouseX, mouseY);
  scale(sin(angle2 + .25));
  rotate(angle2);
  image(caveman, 50, 50);
  angle2 += 0.1;
  
}
void move() {
  xpos = xpos - xspeed;
  if (xpos < 0) {
    xpos = width;
  }
}
void shake() {
  float y1 = offset2 + sin(angle)*scalar;
  float y2 = offset + sin(angle +0.4)*scalar;
  float y3 = offset2 + sin(angle + 0.8)*scalar;
  float y4 = offset + sin(angle + 1.2)*scalar;
  float y9 = offset + sin(angle + 1.6)*scalar;
  image(food, 60+xpos, y1);
  image(clouds, 140+xpos, y2);
  image(food, 190+xpos, y3);
  image(clouds, 230+xpos, y4);
  image(clouds, 280+xpos, y9);
  angle += speed;
}
void shake2() {
  float y5 = offset2 + sin(angle)*scalar;
  float y6 = offset + sin(angle +1.4)*scalar;
  float y7 = offset2 + sin(angle + 1.8)*scalar;
  float y8 = offset2 + sin(angle + 2.2)*scalar;
  float y10 = offset + sin(angle + 2.7)*scalar;
  image(food, 80+xpos, y5+130);
  image(clouds, 160+xpos, y6+130);
  image(food, 210+xpos, y7+130);
  image(food, 250+xpos, y8+130);
  image(clouds, 290+xpos, y10+135);
  angle += speed;
}




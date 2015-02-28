

Ball [] myBalls = new Ball [10];

float backR;
float backG;
float backB;
float changeR = 0.3;
float changeG = 0.5;
float changeB = 0.7;


void setup() {
  size(1024,768);

  for ( int i = 0; i < myBalls.length; i++) {
    myBalls[i] = new Ball(random(width), random(height/1.7), random(100), random(60), random(60), random(60));
  }
}

void draw() {
  backR += changeR;
  backG += changeG;
  backB += changeB;
  background(backR, backG, backB);

  if (backR >= 255) {
    changeR = changeR * -1;
  }
  if (backR <= 0) {
    changeR = changeR * -1;
  }
  if (backG >= 255) {
    changeG = changeG * -1;
  }
  if (backG <= 0) {
    changeG = changeG * -1;
  }
  if (backB >= 255) {
    changeB = changeB * -1;
  }
  if (backB <= 0) {
    changeB = changeB * -1;
  }

  for (int i = 0; i < myBalls.length; i++) {
    myBalls[i].run();
  }
}


class Ball {

  float x;
  float y;
  float w;
  float h;
  float speedX = 5;
  float speedY = 2;
  float R;
  float speedR = 1;
  float G;
  float speedG = 4;
  float B;
  float speedB = 5;

  Ball(float _x, float _y, float _w, float _R, float _G, float _B) {

    x = _x;
    y = _y;
    w = _w;
    h = _w;
    R = _R;
    G = _G;
    B = _B;
  }

  void run () {

    display();
    move();
    bounce();
    gravity();
    disco();
    discoTurn();
  }

  void display() {

    noStroke();
    fill(R, G, B);
    ellipse(x, y, w, h);
  }

  void move() {

    x += speedX;
    y += speedY;
  }

  void bounce() {

    if (x>width) {
      speedX = speedX * -1;
    }
    if (x<0) {
      speedX = speedX * -1;
    }

    if (y>height) {
      speedY = speedY * -1;
    }
    if (y<0) {
      speedY = speedY * -1;
    }
  }

  void gravity () {
  
      speedY = speedY + 0.5;
   }

  void disco() {

    R += speedR;
    G += speedG;
    B += speedB;
  }

  void discoTurn() {

    if (R >= 255) {
      speedR = speedR * -1;
    }
    if (R <= 0) {
      speedR = speedR * -1;
    }

    if (G >= 255) {
      speedG = speedG * -1;
    }
    if (G <= 0) {
      speedG = speedG * -1;
    }

    if (B >= 255) {
      speedB = speedB * -1;
    }
    if (B <= 0) {
      speedB = speedB * -1;
    }
  }
}




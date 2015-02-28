
Ball ball;
Ball ball2;
Ball ball3;

int count = 150;
Ball [] balls = new Ball [count];

void setup () {
  size (300, 300);
  // ball3 = new Ball(45);
  //  ball = new Ball(30);
  //  ball2 = new Ball(15);

  for (int i=0; i<count; i++)
    balls[i] = new Ball(random(width), random (height));
} 

void draw () {
  background(255);
  for (int i=0; i<count; i++) {
    balls[i].move(); 
    balls[i].display();
  }

}

class Ball {
  float s;
  float x, y;
  color c;
  
  Ball(float _x, float _y) {
    s = random(5, 50);
    x=150;
    y=150;
    c = color(random(130), random (167), random (122), 70);
  }        //constructor. define variables

  void move() {
    x += random(-1, 1);
    y += random(-1, 1);
  }

  void display() {
    fill(c);
    ellipse(x, y, s, s);
  }
}




int Ball1X = 50;
int Ball1Y = 50;
int Ball2X = 150;
int Ball2Y = 50;
int Ball3X = 50;
int Ball3Y = 150;
int Ball4X = 150;
int Ball4Y= 150;

void setup() {
  size(400,400);
  smooth();
}

void draw() {
  background(0);
  fill(0, 0, 255);
  ellipse(Ball1X, Ball1Y, 50, 50);
  fill(0, 255, 0);
  ellipse(Ball2X, Ball2Y, 50, 50);
  fill(255, 0, 0);
  ellipse(Ball3X, Ball3Y, 50, 50);
  fill(150, 0, 255);
  ellipse(Ball4X, Ball4Y, 50 ,50);
  
  Ball1X = Ball1X + 2;
  if(Ball1X > width + 25) {
    Ball1X = -25;
  }
  
  Ball2Y = Ball2Y + 2;
  if(Ball2Y > height + 25) {
    Ball2Y = -25;
  }
  Ball4X = Ball4X - 2;
  if(Ball4X < -25) {
    Ball4X = width + 25;
  }
  Ball3Y = Ball3Y - 2;
  if(Ball3Y < -25) {
    Ball3Y = height + 25;
  }
}



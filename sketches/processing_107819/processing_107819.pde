
int Ball = 55;
int Circle = 33;
void setup() {   
        size(500,350);
        stroke(355);
        background(345, 64, 0);
}

void draw() {
  rect(50, 130, mouseX, mouseY)
  ;BallCircle = mouseY / Ball ;
  if (BallCircle != Circle) {
  CircleX = BallCircle * Ball
     ;fill(mouseX, width, width);
     rect(CircleX, 0, Ball, width);
     Circle = BallCircle;
     
  }
}



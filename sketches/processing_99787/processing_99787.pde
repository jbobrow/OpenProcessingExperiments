
//Creative Computing
//Fervido Frias
//March 19, 2013.

Change ball = new Change();

void setup () {

  size (400, 400);
}
void draw() {
  ball.display();
}


class Change {
  //attributes
  int x = 0;
  int y = 0;
  int speed = 0;
  int secondSpeed = 2;

  Change() {
  }


  //other methods
  void display() {
    x = 59;
    y = 45;
    speed += secondSpeed;
    ellipse(speed, y + mouseX, 5, 5);
    if (speed > width) {
      secondSpeed = -2;
      background(random(255), random(255), 9, random(255));
    }
    if (speed < 0) {
      secondSpeed = 1;
      background(57, 89, 223);
    }
  }
}



class Thing {

  int thingSize;
  int posX;
  int posY;
  int thingHue;
  int speedX;
  int speedY;

  Thing(int _thingSize, int _posX, int _posY, int _thingHue, int _speedX, int _speedY) {
    thingSize = _thingSize;
    posX = _posX;
    posY = _posY;
    thingHue = _thingHue;
    speedX = _speedX;
    speedY = _speedY;
  }

  void change() {

    //calculate distance between mouse and object
    int thingDistance = int(dist(mouseX, mouseY, posX, posY));

    //use distance to change size of ball in relation to mouse position
    thingSize = int(map(thingDistance, 0, 707, 25, 150));
    thingHue = int(map(thingDistance, 0, 707, 0, 360));
  }

  //change position of ball over time
  void animate() {
    posX += speedX;
    posY += speedY;
  }

  //ball reverses direction if it hits a wall
  void collide() {
    if (posX <= 0 || posX >= width) {
      speedX = -speedX;
    }

    if (posY <= 0 || posY >= height) {
      speedY = -speedY;
    }
  }

  //display ball
  void display() {
    fill(thingHue, 300, 300);
    ellipse(posX, posY, thingSize, thingSize);
  }
}



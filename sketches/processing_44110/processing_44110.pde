
class Ski {

  float leftFoot;
  float rightFoot;

  Ski () {
  }

  void display(float tempLeftFoot, float tempRightFoot) {
    leftFoot= tempLeftFoot;
    rightFoot = tempRightFoot;

    fill(255, 0, 0);
    stroke(180, 22, 22);
    ellipse(leftFoot, height-height/4, 20, 50);
    ellipse(rightFoot, height-height/4, 20, 50);
  }
}


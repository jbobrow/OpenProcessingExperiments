
class Spinner {

  // properties
  float x;
  float y;
  float w;
  color c;

  float spinnerDistance;
  float spinnerRotation;
  float spinnerRotationMod;
  float spinnerDistFromCenter;

  // constructor
  Spinner (float x, float y, float w, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.c = c;

    // arbitrary numbers for initial instance information - - WHY DO YOU NEED 'THIS' AAHH
    this.spinnerDistance = 100;
    this.spinnerRotationMod = 0;
    this.spinnerRotation = 0;
    this.spinnerDistFromCenter = w;
  }

  void drawSpinner(float xPos, float yPos) {
    pushMatrix();
    fill(this.c);

    translate(xPos, yPos);
    rotate(this.spinnerRotation);

    ellipse(-this.x, -this.y, this.spinnerDistFromCenter, this.spinnerDistFromCenter);
    ellipse(this.x, -this.y, this.spinnerDistFromCenter, this.spinnerDistFromCenter);
    ellipse(this.x, this.y, this.spinnerDistFromCenter, this.spinnerDistFromCenter);
    ellipse(-this.x, this.y, this.spinnerDistFromCenter, this.spinnerDistFromCenter);
    popMatrix();
  }

  void updateSpinner(float xPos, float yPos) {
    this.spinnerDistance = dist(xPos, yPos, mouseX, mouseY);
    this.spinnerRotationMod = map(this.spinnerDistance, 0, width, 10, 0.1);
    this.spinnerDistFromCenter = map(this.spinnerDistance, 0, width, 60, 20);
    this.spinnerRotation += radians(this.spinnerRotationMod);
  }
}



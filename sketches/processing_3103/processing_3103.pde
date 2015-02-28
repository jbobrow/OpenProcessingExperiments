
class Rotater {
  float xPos, yPos;
  float angle;
  float speed;
  float xSpeed, ySpeed;
  float sizeRect;

  Rotater(float temp_xPos, float temp_yPos, float temp_speed, float temp_sizeRect) {
    xPos = constrain(temp_xPos, 0 + temp_sizeRect, width - temp_sizeRect);
    yPos = constrain(temp_yPos, 0 + temp_sizeRect, height - temp_sizeRect);
    speed = constrain(temp_speed, -5.0, 5.0);
    xSpeed = random(-3 * speed, 3 * speed);
    ySpeed = random(-3 * speed, 3 * speed);
    sizeRect = constrain(temp_sizeRect, 5, width);
    angle = random(TWO_PI);
  }

  void move() {
    angle += speed;
    xPos += xSpeed;
    yPos += ySpeed;
    if (xPos - (sizeRect / 2) < 0 || xPos + (sizeRect / 2) > width)
      xSpeed *= -1;
    if (yPos - (sizeRect / 2) < 0 || yPos + (sizeRect / 2) > height)
      ySpeed *= -1;
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(0, 50);

    pushMatrix();
    translate(xPos, yPos);
    rotate(angle);
    rect(0, 0, sizeRect, sizeRect);
    popMatrix();
  }
}



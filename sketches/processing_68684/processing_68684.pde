
class ball { // ball evades the mouse
  float x = 250; //xpos of ball.
  float y = 250; //ypos of ball.
  int rad = 30; //radius of ball.
  float near = 90; //controls when ball reacts to proximity of mouse.
  int jump = 10; //how much the ball moves each frame.
  float xVel = 0; //x-velocity of ball.
  float yVel = 0; //y-velocity of ball.
  float speed = 10; //max velocity.
  float friction = 0.9; //slow velocity over time.
  //  float r, g, b = random(255); //random color in setup.

  void drawBall() {
    //    fill(random(255), random(255), random(255)); //old-school flashing neon goodness.
    fill(255);
    ellipse(x, y, rad, rad);
  }

  void updateBall() {
    x += xVel; //move ball if there is velocity
    xVel *= friction;
    y += yVel;
    yVel *= friction;

    //section - ball interacts with mouse:
     //move ball left if mouse gets too close on the right.
     if ((x >= mouseX - near) && (x <= mouseX) && (y <= mouseY + near) && (y >= mouseY - near)) {
     xVel = -speed;
     }
     //move ball right if mouse gets too close on the left.
     if ((x <= mouseX + near) && (x >= mouseX) && (y <= mouseY + near) && (y >= mouseY - near)) {
     xVel = speed;
     }
     //move ball up if mouse gets too close on the bottom.
     if ((y >= mouseY - near) && (y <= mouseY) && (x <= mouseX + near) && (x >= mouseX - near)) {
     yVel = -speed;
     }
     //move ball down if mouse gets too close on the top.
     if ((y <= mouseY + near) && (y >= mouseY) && (x <= mouseX + near) && (x >= mouseX - near)) {
     yVel = speed;
     }

    //section - oh no, a wall! jump to the other side!
    //wall on top.
    if (y <= 0) {
      y = height - rad;
    }
    //wall on bottom.
    if (y >= height) {
      y = 0 + rad;
    }
    //wall on left.
    if (x <= 0) {
      x = width - rad;
    }
    //wall on right.
    if (x >= width) {
      x = 0 + rad;
    }
  }
}


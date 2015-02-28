
class Bubble {

  float x;
  float y;
  float xspeed;
  float yspeed;
  float circleSize;
  float d = dist(x, y, mouseX, mouseY);
  boolean clicked;

  //constructor
  Bubble  (float xpos, float ypos, float csize) {
    x = xpos;
    y = ypos;
    circleSize = csize;
    xspeed = random(-2, 4);
    yspeed = random(-2, 4);
    clicked = false;
  }

  void updateBubbles() {

    x = x + xspeed;
    y = y + yspeed;
  }

  void checkCollision() {


    if ((x<circleSize/2) || ( x> width - circleSize/2)) {
      xspeed = -xspeed;
    }
    if ((y<circleSize/2) || ( y > height - circleSize/2)) {
      yspeed = -yspeed;
    }
  }

  void drawCircle() {


    fill( 155);
    ellipse (x, y, circleSize, circleSize);

    if (clicked) {
      fill(200, 255, 50);
    }
    else {
      fill(150);
    }


    ellipse (x, y, circleSize/1.3, circleSize/1.3);
    fill(0);
    ellipse (x-15, y, circleSize/5.5, circleSize/5.5);
    ellipse (x+15, y, circleSize/5.5, circleSize/5.5);
  }

  void checkMousePress() {
    if ((dist(mouseX, mouseY, x, y))  < circleSize) {
      //if ((mouseX > x ) && (mouseX< d)) {

      //I have no idea what to put here to enable the mouseclick to only affect the circle size.

      clicked = !clicked;
    }
  }
}



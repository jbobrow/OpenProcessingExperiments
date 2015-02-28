
class Pendulum {
  float angle, rectsize, x, y, xmove, ymove;
  int r, g, b;
  boolean rectgrow, xup, yup;
  public Pendulum(int q, int w) {
    angle = 0;
    r = 150;
    g = 150;
    b = 150;
    rectgrow = true;
    rectsize = 1;
    x = q;
    y = w;
    xmove = 0;
    ymove = 0;
    xup = false;
    yup = true;
  }

  void drawme() {
    //updates the variables like the angle of the rectangle or where the rectangle is on it's motion.
    update();
    stroke(255);
    //creates the string
    line(width/2, 0, x, y);
    //creates the rectangle
    rectMode(CENTER);
    //the rectangle moves on variables x and y
    translate(x, y);
    //the rectangle rotates constantly as angle increases
    rotate(angle);
    //the rectangle grows and shrinks
    scale(rectsize);
    //this changes the color of the pendulum
    fill(r, g, b);
    noStroke();
    rect(0, 0, 32, 32);
  }

  void update() {
    //the angle rotates by 1.
    angle +=0.05;
    //the colors change up or down
    r +=1;
    g +=2;
    b +=3;
    if (r > 255)
      r = 0;
    if (g > 255)
      g = 0;
    if (b > 255)
      b = 0;
    //the rectangle grows and shrinks
    if (rectgrow == true) {
      rectsize +=0.5;
      if (rectsize > 16) {
        rectsize = 16;
        rectgrow = false;
      }
    }
    if (rectgrow == false) {
      rectsize -=0.5;
      if (rectsize < -16) {
        rectsize = -16;
        rectgrow = true;
      }
    }
    //the rectangle moves in what will resemble a pendulum like pattern. The more it runs, the more it goes down the screen like the rope is stretching
    if (xup == false) {
      xmove -=0.25;
      if (xmove == -16)
        xup = true;
    }
    if (xup == true) {
      xmove +=0.25;
      if (xmove == 16)
        xup = false;
    }
    if (yup == false) {
      ymove -=0.25;
      if (ymove == -8)
        yup = true;
    }
    if (yup == true) {
      ymove +=0.25;
      if (ymove == 8)
        yup = false;
    }
    x +=xmove;
    y +=ymove;
  }
}



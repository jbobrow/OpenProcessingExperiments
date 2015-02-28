
Mouse[] mice = new Mouse[10];

int windowsize=500;


void setup() {
  size(windowsize, windowsize);
  smooth();
  for (int i=0; i<10; i++) {
    mice [i] = new Mouse(random(width), random(height));
  }
}

void draw() {
  background(255);

  for (int i = 0; i< 10; i++) {
    mice[i].draw_Mouse();
    mice[i].move_Mouse();
  }
}

class Mouse {

  float xpos;
  float ypos;
  float xspeed;
  float yspeed;

  Mouse(float _xpos, float _ypos) {
    xpos = _xpos;
    ypos = _ypos;
    xspeed = random(2, 0.5);
    yspeed  = random(1, 2);
  }

  void draw_Mouse() {
    fill(color(#FFFF00));
    fill(0, 5, 0); 
    noStroke();
    //ears
    ellipse (xpos+50, ypos+20, 25, 25);
    ellipse (xpos+10, ypos+20, 25, 25);
    //head 
    ellipse(xpos+30, ypos+40, 37, 37);
    //body
    ellipse(xpos+30, ypos+80, 35, 40);
    //legs 
    rect(xpos+19, ypos+70, 5, 60);
    rect(xpos+37, ypos+70, 5, 60);
    //arms
    rect(xpos+3, ypos+65, 15, 5);
    rect(xpos+40, ypos+65, 15, 5);
    rect(xpos+3, ypos+55, 5, 10);
    rect(xpos+50, ypos+70, 5, 10);
    //feet
    fill(255, 234, 0);
    ellipse(xpos+21, ypos+123, 16, 17);
    ellipse(xpos+41, ypos+123, 18, 16);
    //eyes
    fill(255, 255, 255);
    ellipse (xpos+33, ypos+35, 2, 6);
    ellipse (xpos+27, ypos+35, 2, 6);
    //hands 
    fill(207, 207, 207);
    ellipse(xpos+3, ypos+48, 10, 10);
    ellipse(xpos+55, ypos+87, 10, 10);
  }

  void move_Mouse() {
    //moving
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
    //conditions bouncing x 
    if (xpos>windowsize-100) {
      xspeed=-xspeed;
      xpos=windowsize-100;
    }
    if (xpos<0) {
      xspeed=-xspeed;
      xpos=0;
    }
    // conditions bouncing y
    if (ypos>windowsize-100) {
      yspeed=-yspeed;
      ypos=windowsize-100;
    }
    if (ypos<0) {
      yspeed=-yspeed;
      ypos=0;
    }
  }
}

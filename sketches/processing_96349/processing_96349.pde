
Pac myPac;

void setup() {
  size(700, 700);
  
  myPac = new Pac();
}

void draw() {
  background(0);
  int x = 30;
  while (x <= width) {
    int y = 30;
    while (y <= height) {
      stroke(0);
      fill(255, 0, 0);

      rect(x, y, 20, 20);
      y= y + 70;
    }
    x = x + 70;
  }
  myPac.display();
}

void keyPressed() {
  /* w = up
   s = down
   a = left
   d = right*/

  if (key == 'w') {
    myPac.drive4();
  } 
  if (key == 's') {
    myPac.drive3();
  } 
  if (key == 'a') {
    myPac.drive2();
  }
  if (key == 'd') {
    myPac.drive();
  }
}


class Pac {
  color c;
  float xpos;
  float ypos;
  float speed1;
  float speed2;

  Pac() {
    c= color(237, 245, 20);
    xpos = 150;
    ypos = 150;
    speed1 = -10;
    speed2 = +10;
  }
  void display() {
    fill(c);
    ellipse(xpos, ypos, 20, 20);
  }

  //right
  void drive() {
    xpos = xpos + speed2;
    if (xpos==700) {
      xpos = xpos + speed1;
    }
  }
  //left
  void drive2() {
    xpos = xpos + speed1;
    if (xpos==0) {
      xpos = xpos + speed2;
    }
  }
  //down
  void drive3() {

    ypos = ypos +speed2;
    if (ypos==700) {
      ypos = ypos + speed1;
    }
  }
  //up
  void drive4() {
    ypos = ypos + speed1;
    if (ypos==0) {
      ypos = ypos +speed2;
    }
  }
}





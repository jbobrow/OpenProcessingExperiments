
Pac myPac;
int rows = 16;
int columns = 16;
MyYummy[] yummys = new MyYummy[rows*columns];
int yummyCounter = 0;

void setup() {
  size(700, 700);
  myPac = new Pac(20);
  for (int k = 0; k < rows; k++) {
    for (int l = 0; l < columns; l++) {
      yummys[yummyCounter] = new MyYummy(k*75+20, l*75 + 20, 20);
      yummyCounter ++;
    }
  }
}  

void draw() {
  background(0);
  myPac.display();

  for (int k = 0; k < yummys.length; k++) {
    yummys[k].display();
    if (yummys[k].intersect(myPac)) {
      yummys[k].caught();
    }
  }
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
  float r;

  Pac(float tempr) {
    c= color(237, 245, 20);
    xpos = 150;
    ypos = 150;
    speed1 = -10;
    speed2 = +10;
    r=tempr;
  }
 
  void display() {
    fill(c);
    ellipse(xpos, ypos, r, r);
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

class MyYummy {
  color c;
  float yummyx; 
  float yummyy;
  float yummyw;
  float yummyh;
  float yummyr;

  MyYummy(int tempx, int tempy, int tempr) {
    c = color(0, 255, 0);
    yummyx=tempx;
    yummyy=tempy;
    yummyw=30;
    yummyh=30;
    yummyr=tempr;
  }
  

  void display() {
    fill(c);
    ellipse(yummyx, yummyy, yummyr, yummyr);
  }
  
  boolean intersect(Pac p) {
    float distance = dist(yummyx, yummyy, p.xpos, p.ypos);
   
    if (distance < (yummyr + p.r)/2) {
       println("yummy: " + yummyx);
       println("pac: " + p.xpos);
      return true;
    }
    else {
      return false;
    }
  }
  void caught(){
  yummyy= -46789;
  }
}




Pac myPac;
Buddy myBuddy;
PImage myImage;
int rows = 16;
int columns = 16;
MyBarrier[] barriers = new MyBarrier[rows*columns];
MyYummy[] yummys = new MyYummy[rows*columns];

int barrierCounter = 0;
int yummyCounter = 0;

void setup() {
  size(700, 700);
  myPac = new Pac(20);
  myBuddy = new Buddy(20);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      barriers[barrierCounter] = new MyBarrier(i*50 + 10, j*50+10, 20);
      barrierCounter ++;
    }
  }
  for (int k = 0; k < rows; k++) {
    for (int l = 0; l < columns; l++) {
      yummys[yummyCounter] = new MyYummy(k*75+20, l*75 + 20, 20);
      yummyCounter ++;
    }
  }
  myImage = loadImage("tumblr_static_url-2.png");
}  


void draw() {
  background(0);
  image(myImage,0,0,700,700);
  myPac.display();
  myBuddy.display();

  for (int k = 0; k < yummys.length; k++) {
    yummys[k].display();
    if (yummys[k].intersect(myPac)) {
      yummys[k].caught();
    }
  }
  for (int i = 0; i < barriers.length; i++) {
    barriers[i].display();
    if (barriers[i].intersect(myBuddy)) {
      barriers[i].eat();
    }
  }
}


void keyPressed() {
  /* w/i = up
   s/k = down
   a/j = left
   d/l = right*/

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
if(key == 'i'){
  myBuddy.move4();
}
if(key == 'k'){
  myBuddy.move3();
}
if(key == 'j'){
  myBuddy.move2();
}
if(key == 'l'){
  myBuddy.move();
}
}


class MyBarrier {
  color c;
  int barrierx; 
  int barriery;
  int barrierw;
  int barrierh;
  int barrierr;

  MyBarrier(int tempx, int tempy, int tempr) {
    c = color(255, 0, 255);
    barrierx=tempx;
    barriery=tempy;
    barrierw=20;
    barrierh=20;
    barrierr=tempr;
  }

  void display() {
    fill(c);
    ellipseMode(CENTER);
    rect(barrierx, barriery, barrierw, barrierh);
  }
  boolean intersect(Buddy b) {
    float distance = dist(barrierx, barriery, b.x, b.y);

    if (distance < (barrierr + b.r)/2) {
      return true;
    }
    else {
      return false;
    }
  }
  void eat() {
    barriery= -800;
  }

}

class Buddy {
  color c;
  float x;
  float y;
  float h;
  float w;
  float speed;
  float speed2;
  float r;

  Buddy(float tempr) {
    c= color(20, 245, 237);
    x = 150;
    y = 150;
    speed = -10;
    speed2 = +10;
    r=tempr;
  }

  void display() {
    fill(c);
    ellipseMode(CENTER);
    rect(x, y, r, r);
  }

  //right
  void move() {
    x = x + speed2;
    if (x==700) {
      x = x + speed;
    }
  }
  //left
  void move2() {
    x = x + speed;
    if (x==0) {
      x = x + speed2;
    }
  }
  //down
  void move3() {

    y = y +speed2;
    if (y==700) {
      y = y + speed;
    }
  }
  //up
  void move4() {
    y = y + speed;
    if (y==0) {
      y = y +speed2;
    }
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




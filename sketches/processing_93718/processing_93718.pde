
int numBalls = 10;
Ball[]ballon= new Ball[numBalls];
Ball[] ballon2 = new Ball[numBalls];
Ball[] ballon3 = new Ball[numBalls];

void setup () {
  size(500, 500);
  background(100);
  for (int i=0; i<numBalls;i++) {
    ballon[i]=new Ball(10, random (height));
    ballon2[i]=new Ball(50, random (height));
    ballon3[i]=new Ball(70, random (height));
  }
}

void draw () {
 for (int i=0; i<numBalls;i++){
ballon[i].display();
ballon[i].move();
ballon2[i].display();
ballon2[i].move();
ballon3[i].display();
ballon3[i].move();

 }
  //  ballon.display();
  //  ballon.move();
}


class Ball {
  float x;
  float y;
  float r;
  float g;
  float b;

  Ball (float tempx, float tempy) {
    x = tempx;
    y =tempy;
    r= random(255);
    g= random(255);
    b = random(255);
    
  }

  void display() {
    fill(r,g,b);
    noStroke();
    ellipse(x, y, 20, 20);
  }

  void move() {
    y=y+1;
  }
}

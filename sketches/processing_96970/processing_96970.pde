
Bullet[] myBullet = new Bullet [0];

void setup() {
  size (800, 700);
  smooth();
  for (int i = 0; i < myBullet.length; i++) {
    myBullet[i] = new Bullet();
  }
}

void draw() {
  background(0);
  noStroke();
  noFill();
  strokeWeight(0);
  rectMode(CENTER);
  mouseX = constrain(mouseX, 50, 500);
  mouseY= constrain(mouseY, 50, 650);

  for (int i = 0; i <myBullet.length ; i++) {
    myBullet[i].display();
    myBullet[i].moveBullet();
  }
}

void mousePressed() {
  //frameRate(18);
  Bullet b = new Bullet();
  myBullet = (Bullet[]) append(myBullet, b);
}

class Bullet {
  int bulletsXpos;
  int bulletsYpos;
  int bulletsHeight;
  int bulletsWidth;
  int bulletsSpeed;

  Bullet() {
    bulletsXpos = mouseX;
    bulletsYpos = mouseY;
    bulletsHeight = 6;
    bulletsWidth = 22;
    bulletsSpeed = 10;
  }
  void display() {
    fill (10, 247, 35);
    rect(bulletsXpos, bulletsYpos, bulletsWidth, bulletsHeight);
  }

  void moveBullet() {
   bulletsXpos += bulletsSpeed;
  }
}




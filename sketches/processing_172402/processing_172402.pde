
boolean yIncrease, yDecrease, xIncrease, xDecrease, YIncrease, YDecrease, XIncrease, XDecrease;
int score1=0;
int score2=0;
Slime1 b = new Slime1();
Slime2 c = new Slime2();
 

 
void setup()
{
  size(1000, 600);
}
 
float bx=200;
float by=200;
float bvx=4;
float bvy=2;
 
void draw()
{
  noStroke();
  background(5, 186, 255);
  fill(149, 151, 152);
  rect (0, 500, 1000, 100);
  fill(255);
  textSize(60);
  text(score1, 50, 50);
  text(score2, 900, 50);
  fill(255, 255, 255);
  rect(500, 500, 20, 1000);
 
  b.update();
  b.display();
  c.update();
  c.display();
 
  fill(255);
  ellipse(bx, by, 20, 20);
  bx=bx+bvx;
  by=by+bvy;
  bvy=bvy+.12;
  if (score1>=11){
       background(255);
       fill(0);
       textSize(100);
       text("YOU WIN LIFE",50,100);
     }
   
  if (bx==0 || bx==width) {
    bvx=-bvx;
  }
  if (by>490) {
    bvy=-bvy;
    if (bx>510) {
      score1=score1+1;
    }
    if (bx<490) {
      score2=score2+1;
    }
     
  }
}
 
 
 
void keyPressed() {
  if (keyCode == UP) {
    yDecrease = true;
  } else if (keyCode == DOWN) {
    yIncrease = true;
  } else if (keyCode == RIGHT) {
    xIncrease = true;
  } else if (keyCode == LEFT) {
    xDecrease = true;
  } else if (key == 'w') {
    YDecrease = true;
  } else if (key == 's') {
    YIncrease = true;
  } else if (key == 'd') {
    XIncrease = true;
  } else if (key == 'a') {
    XDecrease = true;
  }
}
 
void keyReleased() {
  if (keyCode == UP) {
    yDecrease = false;
  } else if (keyCode == DOWN) {
    yIncrease = false;
  } else if (keyCode == RIGHT) {
    xIncrease = false;
  } else if (keyCode == LEFT) {
    xDecrease = false;
  } else if (key == 'w') {
    YDecrease = false;
  } else if (key == 's') {
    YIncrease = false;
  } else if (key == 'd') {
    XIncrease = false;
  } else if (key == 'a') {
    XDecrease = false;
  }
}
 
 
class Slime1 {
  float radius = 40;
  float x = 300;
  float y = 500;
  float xPos=300;
  float yPos=500;
  float g=-5;
  float speedy=3;
  float speedx=6;
 
 
  void update() {
 
    if (YDecrease == true && y > radius/2) {
      speedy=-5;
    }
    if (xPos<450) {
 
      if (XIncrease == true && x < width - radius/2) {
        x = x + speedx;
      }
    }
    if (XDecrease == true && x > radius/2) {
      x = x - speedx;
    }
    yPos = yPos+speedy;
 
    if (yPos>=500) {
      speedy=0;
    }
    if (yPos<=300) {
      speedy=3;
    }
    if (bx>(xPos-50) && bx <(xPos+50) && by>(yPos-50) ) {
      bvx=abs(bvx);
      bvy=-bvy;
    }
  }
 
 
  void display() {
 
    noStroke();
    fill(0, 250, 0);
    xPos = x;
 
 
    fill (245, 22, 37);
    arc(xPos, yPos, 100, 100, radians(180), radians(360));
    fill (255, 255, 255);
    ellipse(xPos+26, yPos-24, 16, 16);
  }
}
 
class Slime2 {
  int radius = 20;
  int x = 750;
  int y = 500;
  int xPos=750;
  float yPos=500;
  float speedy=3;
  float speedx=6;
 
  void update() {
 
    if (yDecrease == true && y > radius) {
      speedy=-5;
    }
    if (xIncrease == true && x < width - radius) {
      x = x + 6;
    }
    if (xPos>570) {
    if (xDecrease == true && x > radius) {
      x = x - 6;
    }
    }
    yPos = yPos+speedy;
    if (yPos>=500) {
      speedy=0;
    }
    if (yPos<=300) {
      speedy=3;
    }
    if (bx>(xPos-50) && bx <(xPos+50) && by>(yPos-50) ) {
      bvx=-abs(bvx);
      bvy=-bvy;
    }
  }   
 
  void display() {
    noStroke();
    fill(0, 250, 250);
    xPos = x;
 
    fill (18, 277, 5);
    arc(xPos, yPos, 100, 100, radians(180), radians(360));
    fill (255, 255, 255);
    ellipse(xPos-26, yPos-24, 16, 16);
  }
  void keyPressed() {
  if (key=='r') {
    score1 = 0;
    score2 = 0;
  }
  }
}

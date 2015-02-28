
Ball myBall1;
Ball myBall2;
Ball myBall3;
Ball myBall4;

void setup() {
  size(600, 400);
  myBall1 = new Ball(50, 50, 50, 6);
  myBall2 = new Ball(100, 200, 70, 3);
  myBall3 = new Ball(300, 50, 100, 1);
  myBall4 = new Ball(500, 100, 20, 9);
}

void draw() {
  background(255);
  myBall1.go();
  myBall2.go();
  myBall3.go();
  myBall4.go();
}
class Ball {
  int speed;
  int Xspeed;
  int Yspeed;
  int Xp;
  int Yp;
  int dia;
  int depth;
  color Ballcolor;
  PImage b;
  PImage c;
  //x= starting X point, y= starting Y point
  //i= size of circle, s= moving speed
  Ball(int x, int y, int i, int s) {
    Xp = x;
    Yp = y;
    dia = i;
    Xspeed = s;
    Yspeed = s;
    speed = s;
    depth=s;
    // ellipse(Xp, Yp, dia, dia);  
    Xp++;
    Yp++;
  }

  void go() {
    bounce();
    Xp+=Xspeed;
    Yp+=Yspeed;
    b=loadImage("cyanball.png");
    b.resize(dia, dia);
     c=loadImage("redball.png");
    c.resize(dia, dia);
    blend(b, 0, 0, dia, dia, Xp, Yp,dia , dia, MULTIPLY);
    //image(c, Xp+depth, Yp);
    blend(c, 0, 0, dia, dia, Xp+depth, Yp,dia , dia, MULTIPLY);
    //    println(Xp+", "+Yp+", "+dia);
  }
  void bounce() {
    if (Xp>=width ) Xspeed = -speed;
    else if (Xp <= 0) Xspeed = speed;
    if (Yp>=height ) Yspeed = -speed;
    else if (Yp <= 0) Yspeed = speed;
  }
}



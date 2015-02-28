
Ball myBall1;
Ball myBall2;
Ball myBall3;
Ball myBall4;

void setup() {
  size(600, 400);
  myBall1 = new Ball(50, 50, 50, 6, #D30000);
  myBall2 = new Ball(100, 200, 70, 3, #1C3CFF);
  myBall3 = new Ball(300,50,100, 1, #F7F71E);
  myBall4 = new Ball(500,100,20, 9, #1EF76B);
}

void draw() {
  background(0);
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
  color Ballcolor;
  //x= starting X point, y= starting Y point
  //i= size of circle, s= moving speed
  Ball(int x, int y, int i, int s, color c) {
    Xp = x;
    Yp = y;
    dia = i; 
    Xspeed = s;
    Yspeed = s;
    speed = s;
    // ellipse(Xp, Yp, dia, dia);   
    Xp++;
    Yp++;
    Ballcolor = c;
  }

  void go() {
    bounce();
    Xp+=Xspeed;
    Yp+=Yspeed;
    smooth();
    noStroke();
    fill(Ballcolor);
    ellipse(Xp, Yp, dia, dia);
//    println(Xp+", "+Yp+", "+dia);
  }
  void bounce() {
    if (Xp>=width ) Xspeed = -speed;
    else if (Xp <= 0) Xspeed = speed;
    if (Yp>=height ) Yspeed = -speed;
    else if (Yp <= 0) Yspeed = speed;
  }
}


                
                                

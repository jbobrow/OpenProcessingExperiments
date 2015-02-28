
class Bez { // give Classes names that begin with a capital letter to differentiate
  float x1;
  float y1;
  float Xspeed;
  float Yspeed;
  float spin1; 
  float gravity;
  float spinSpeed;

  Bez(int tempX, int tempY, float tempSpin) { // "the constructor"
    x1 = tempX;
    y1 = tempY;
    Xspeed = random(-10,10);
    Yspeed = random(-10,10);
    spin1 = 0;
    spinSpeed = tempSpin;
    gravity = 0.5;
  }

  void move() {
    if (bezNOW) {

      // OBJECT 1
      spin1 = spin1 + spinSpeed;
      x1 = x1 + Xspeed;
      y1 = y1 - Yspeed;
      Yspeed = Yspeed - gravity;

      // If the object hits the right side, it bounces slightly
      if (x1 >= width-30 || x1 <= 20) {
        Xspeed = Xspeed/3 * -1;
      }

      // If the object rises above height 30, it begins to descend
      if(y1 == 30) {
        Yspeed = Yspeed * -1;
        //      Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops
      if (y1 > height-5) {
        spin1 = spin1 - spinSpeed;
        y1 = height-5;
        Xspeed = Xspeed / 2;
      }
    }
    if(mouseX>200 && mouseX<300 && mouseY>0 && mouseY<30) {
      if (mousePressed) {
        Bez1 = new Bez(150,190,random(.02,.3));
        Bez2 = new Bez(160,190,random(.02,.3));
        Bez3 = new Bez(170,190,random(.02,.3));
        Bez4 = new Bez(180,190,random(.02,.3));
        Bez5 = new Bez(190,190,random(.02,.3));
        Bez6 = new Bez(200,190,random(.02,.3));
        Bez7 = new Bez(210,190,random(.02,.3));
        Bez8 = new Bez(220,190,random(.02,.3));
        Bez9 = new Bez(230,190,random(.02,.3));
        Bez10 = new Bez(240,190,random(.02,.3));
        Bez11 = new Bez(145,230,random(.02,.3));
        Bez12 = new Bez(155,230,random(.02,.3));
        Bez13 = new Bez(165,230,random(.02,.3));
        Bez14 = new Bez(175,230,random(.02,.3));
        Bez15 = new Bez(185,230,random(.02,.3));
        Bez16 = new Bez(195,230,random(.02,.3));
        Bez17 = new Bez(205,230,random(.02,.3));
        Bez18 = new Bez(215,230,random(.02,.3));
        Bez19 = new Bez(225,230,random(.02,.3));
        Bez20 = new Bez(235,230,random(.02,.3));
        Bez21 = new Bez(245,230,random(.02,.3));
        Bez22 = new Bez(150,270,random(.02,.3));
        Bez23 = new Bez(160,270,random(.02,.3));
        Bez24 = new Bez(170,270,random(.02,.3));
        Bez25 = new Bez(180,270,random(.02,.3));
        Bez26 = new Bez(190,270,random(.02,.3));
        Bez27 = new Bez(200,270,random(.02,.3));
        Bez28 = new Bez(210,270,random(.02,.3));
        Bez29 = new Bez(220,270,random(.02,.3));
        Bez30 = new Bez(230,270,random(.02,.3));
        Bez31 = new Bez(240,270,random(.02,.3));
        Bez32 = new Bez(145,310,random(.02,.3));
        Bez33 = new Bez(155,310,random(.02,.3));
        Bez34 = new Bez(165,310,random(.02,.3));
        Bez35 = new Bez(175,310,random(.02,.3));
        Bez36 = new Bez(185,310,random(.02,.3));
        Bez37 = new Bez(195,310,random(.02,.3));
        Bez38 = new Bez(205,310,random(.02,.3));
        Bez39 = new Bez(215,310,random(.02,.3));
        Bez40 = new Bez(225,310,random(.02,.3));
        Bez41 = new Bez(235,310,random(.02,.3));
        Bez42 = new Bez(245,310,random(.02,.3));
        bezNOW = false;
      }
    }
  }

  void display() {
    fill(160,153,94,150);
    pushMatrix();
    translate(x1,y1);
    rotate(spin1);
    quad(0,0,-5,+30,0,+60,+5,+30);
    popMatrix();
  }
}




class Circ { // give Classes names that begin with a capital letter to differentiate
  float x1;
  float y1;
  float diam;
  float Xspeed;
  float Yspeed;
  boolean mouse;
  float gravity;
  float fade;
  color c;

  Circ(float tempX, float tempY, float diam_, color tempC) { // "the constructor"
    x1 = tempX;
    y1 = tempY;
    diam = diam_;
    Xspeed = random(-10,mouseX/20);
    Yspeed = random(-20,mouseY/8);
    mouse = false;
    gravity = 0.5;
    fade = 1;
    c = tempC;
  }

  void move() {
    if(go) {  //moves on click

      x1 = x1 + Xspeed;
      y1 = y1 + Yspeed;

      // If the object hits the side, it bounces slightly
      if (x1 >= width-10 || x1 <= 10) {
        Xspeed = Xspeed/2 * -1;
      }

      // If the object rises above height 10, it begins to descend?
      if(y1 == 10) {
        Yspeed = Yspeed * -1;
        Yspeed = Yspeed * gravity;
      }

      // If the object hits the bottom, it stops ,,, or not...
      if (y1 > height-10) {
        Yspeed = Yspeed/2.5*-1.05;
        //            y1 = 10+y1;//alt no floor
        Xspeed = Xspeed/1.02;
      }
    }
  }


  void display() {
    if (mouse) { 
      fill(240,255,0,150);
      //                      diam = diam + 1;
      if (mousePressed && (mouseButton == RIGHT)) {
        x1 = mouseX+random(Xspeed,-Xspeed)*5;
        y1 = mouseY+random(Yspeed,-Yspeed)*5;
      }
      if (keyPressed == true) {
        if (key == '=') {
          diam = diam + 1;
        }
      }
        if (keyPressed == true) {
          if (key == '-') {
            diam = diam - 1;
          }
        }
      }  
    else {
      fill(c);
    }
    if(goCount == 1) {
      ellipse(x1,y1,diam, diam);
    }
  }

  void rollover(int mx, int my) { 
    if (mx > x1-(diam+5) && mx < x1 + diam && my > y1-diam && my < y1 + (diam+5)) {
      mouse = true;
    } 
    else {
      mouse = false;
    }
  }
}// end class



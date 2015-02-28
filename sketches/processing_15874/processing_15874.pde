
class Circ { // give Classes names that begin with a capital letter to differentiate
  float x1;
  float y1;
  float diam;
  float Xspeed;
  float Yspeed;
  boolean mouse;
  float gravity;
  float fade;
  float spread;

  Circ(float tempX, float tempY, float diam_) { // "the constructor"
    x1 = tempX;
    y1 = tempY;
    diam = diam_;
    Xspeed = random(-1,1);
    Yspeed = random(-1,1);
    mouse = false;
    gravity = 0.5;
    fade = .01;
    spread = random(8,80);
  }

  void move() {
    if(go) {  //moves on click

      x1 = x1 + Xspeed/1.02;
      y1 = y1 + Yspeed/1.02;

      if (x1 >= width/2+spread || x1 <= width/2-spread) {
        Xspeed = Xspeed/1.02;
        //        Yspeed = Yspeed - .02;
      }

       if (y1 >= height/2+spread || y1 <= height/2-spread) {
        Yspeed = Yspeed/1.02;
      }
    }
  }

  void display() {
    if (mouse) { 
      fill(88,20,20);
//      diam = 10;
    }  
    else {
      fill(230,20,20,200);
//      diam = diam;
    }
    //    fill(250,250,255,150);
    if(go) {
      ellipse(x1,y1,diam, diam);
    }
    
  }

  void rollover(int mx, int my) { 
    // Left edge is x, Right edge is x + w
    if (mx > x1-diam/2 && mx < x1 + diam/2 && my > y1-diam/2 && my < y1 + diam/2) {
      mouse = true;
    } 
    else {
      mouse = false;
    }
  }
  
}// end class



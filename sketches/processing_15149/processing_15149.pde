
class Circ {
  float x = 0;
  float y = 0;
  float xtime = random(0,800);
  float ytime = random(0,800.0);
  float increment = 0.001;
  float diam;
  boolean mouse;
  float trans = 255;
  float pulse = 0;
  //  float r;
  //  float g;
  //  float b;

  Circ(float x_, float y_, float diam_) {
    x = x_;
    y = y_;
    diam = diam_;
    //    r = r_;
    //    g = g_;
    //    b = b_;
  }

  void display() {
    if (mouse) { 
      fill(0);
      ellipse(x,y,diam,diam);
      fill(0,trans);
      trans -= 15;
      if (trans <= 0) trans = 255;
      ellipse(x,y,diam+10,diam+10);
      noFill();
      pulse += 15;
      if (pulse >= 255) pulse = 0;
      stroke(0);
      if (mousePressed) ellipse(x,y,diam*pulse/90,diam*pulse/90);
    }
    if (mouse == false) {
      fill(0);
      ellipse(x,y,diam,diam);
    }
  }

  void move() {
    x = noise(xtime)*width;
    y = noise(ytime)*height;
    xtime += increment;
    ytime+= increment;
  }

  void rollover(int mx, int my) { 
    if (mx > x-(diam) && mx < x + diam && my > y-diam && my < y + diam) {
      mouse = true;
    } 
    else {
      mouse = false;
    }
  }

  void recto(float r_, float g_, float b_) {
    if(mouseX>circ1[3].x-10 && mouseX<circ1[3].x+10 && mouseY>circ1[3].y-10 && mouseY<circ1[3].y+10) {
      if (mousePressed) {
        fill(r_,g_,b_,100);
        rect(0,0,800,600);
      }
    }
  }
}// end class



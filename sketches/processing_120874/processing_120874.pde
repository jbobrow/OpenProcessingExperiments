
class particle {
  float xpos, ypos;
  int charge;
  float xspeed, yspeed;
  boolean affected=true;

  particle(float xpos, float ypos, int charge, float xspeed, float yspeed) {
    this.xpos=xpos;
    this.ypos=ypos;
    this.charge=charge;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
  }

  void render() {
    fill(active);
    ellipse(xpos+20,ypos+20,40,40);
    ellipse(xpos-20,ypos+20,40,40);
    ellipse(xpos+10,ypos+47,25,25);
    ellipse(xpos-10,ypos+47,25,25);
    fill(100,80,60);
    ellipse(xpos,ypos+7,15,15);
    ellipse(xpos,ypos+20,15,15);
    ellipse(xpos,ypos+42,15,35);
  }

  void move() {
    xpos+=xspeed;
    ypos+=yspeed;
    xspeed*=dragfactor;
    yspeed*=dragfactor;
    if (xpos> width) xpos-=width;
    else if (xpos < 0) xpos+=width;
    if (ypos> height) ypos-=height;
    else if (ypos < 0) ypos+=height;
  }
}



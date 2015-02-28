
class factory {
  int x, y;
  float en;
  float capac;
  int s=30;
  int ticker=0;
  float rspeed;
  int r=0;
  boolean killme;
  int killmeIndex;
  float convspeed=4;
  boolean ghost;

  factory(int cx, int cy) {
    x=cx;
    y=cy;
    en=-500;
    capac=50;
    ghost=false;
  }
  factory(int cx, int cy, String s) {
    x=cx;
    y=cy;
    en=-500;
    capac=50;
    ghost=true;
  }

  void update() {
    if(killme){
      removeF(killmeIndex);
    }
    ticker++;
    if (ghost && mouseY<height-100) {
      x=int(roundd(mouseX+vx));
      y=int(roundd(mouseY));
    }

    convspeed=map(en, 0, capac, 2, 8);

    if (en>convspeed && en>0 && en>-1 && !ghost) {
      en-=convspeed;
      cash+=convspeed/2;
    }

    display();
  }
  void display() {
    if (en>-1 &&!ghost) {
      rspeed=map(convspeed, 2, 8, 0, 30);
    }
    pushMatrix();
    translate(x, y);
    r+=rspeed;
    rotate(radians(r));
    fill(0);
    stroke(200, 0, 255);
    if (en<0 &&!ghost) {
      fill(153, 153);
      stroke(153);
    }
    ellipse(0, 0, s, s);
    fill(255, 100, 255, 100);
    if (en<0 &&!ghost) {
      fill(153);
    }
    ellipse(0, 0, s/2, s/2);

    for (int i=0;i<3;i++) {
      float a = (TWO_PI/3)*i;
      float x1 = 0 + cos(a)*s/4;
      float y1 = 0 + sin(a)*s/4;
      fill(255);
      noStroke();
      if (en<0 &&!ghost) {
        fill(253);
      }
      ellipse(x1, y1, s/6, s/6);
      float x2 = 0 + cos(a)*s/1.5;
      float y2 = 0 + sin(a)*s/1.5;
      stroke(255, 0, 255);
      if (en<0 &&!ghost) {
        fill(153, 153);
        stroke(153);
      }
      line(0, 0, x2, y2);
    }
    popMatrix();
  }
}



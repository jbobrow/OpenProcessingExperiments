
drop[] pops = new drop[15];
void setup() {
  size(700, 500);
  smooth();
  background(150);
  stroke(255);
  for(int i = 0; i < pops.length; i++) {
    pops[i] = new drop(i);
  }
  frameRate(60);
}
void draw() {
  fill(150, 150, 150, 30);
  rect(0, 0, width, height);
  for(int i = 0; i < pops.length; i++) {
    pops[i].fall();
  }
}
class drop {
  float x;
  float y;
  float xv;
  float yv;
  float lL = 5;
  boolean pud;
  int count;
  int ring;
  float sound;
  float spac;
  float gro;
  int mi;
  public drop(int m) {
    nu();
    y = random(0, height-10);
    mi = m;
  }
  void fall() {
    if(pud) {
      strokeWeight(1);
      stroke(255, 255, 255, 255-255*(count/sound));
      drop(x, y, ring, spac, 2, count*gro);
      count++;
      if(count>sound)
        nu();
    }else{
      xv += (noise(x/20, y/20)-0.5)/20;
      yv += (noise(y/20, x/20)-0.4)/40;
      for(int i = 0; i < pops.length; i++) {
        if(i != mi) {
          if(dist(pops[i].x, pops[i].y, x, y)<80) {
            xv += (pops[i].x-x)/8000;
          }
        }
      }
      x += xv;
      y += yv;
      if(x<0)
        x = width;
      if(x>width)
        x = 0;
      if(y<0)
        y = height;
      if(y>height)
        y = 0;
      if((y>height-40&&random(10)>9)||y>height-5) {
        pud = true;
        strokeWeight(1);
      }
      stroke(255);
      strokeWeight(2/(dist(0, 0, xv, yv)*dist(0, 0, xv, yv)));
      line(x, y, x-xv*lL, y-yv*lL);
    }
  }
  void nu() {
    pud = false;
    x = random(width);
    y = 0;
    xv = random(0.2, 0.22);
    yv = random(0.7, 1);
    ring = (int)random(3, 7);
    spac = random(4, 12);
    sound = random(30, 80);
    gro = random(0.5, 0.7);
    count = 0;
  }
}
void drop(float x, float y, int rings, float spacing, float ratio, float plus) {
  noFill();
  for(int i = 0; i < rings; i++) {
    ellipse(x, y, ratio*(i*spacing + plus), i*spacing + plus);
  }
}
void mousePressed() {
  saveFrame("Output.png");
}


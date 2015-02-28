
ball[] balls = new ball[8];
void setup() {
  size(400, 400);
   
  for(int i = 0; i < 8; i ++) {
    balls[i] = new ball(random(10, 50), random(TWO_PI), random(20, width-20), random(20, height-20));
  }
}
void draw() {
  background(0);
  for(int i = 0; i < 8; i ++) {
    balls[i].move();
    balls[i].screenBump();
    balls[i].draw();
    balls[i].collide(i);
  }
}
class ball {
  float x, y, s, d, xm, ym;
  ball(float sv, float dv, float xv, float yv) {
    s=sv;
    d=dv;
    x=xv;
    y=yv;
    xm=sin(d)*3;
    ym=cos(d)*3;
  }
  void move() {
    x+=xm;
    y+=ym;
  }
  void screenBump() {
    if(x<0+s/2 || x>width-s/2) {
      xm*=-1;
    }
    if(y<0+s/2 || y>height-s/2) {
      ym*=-1;
    }
  }
  void draw() {
    ellipse(x, y, s, s);
  }
  void collide(int ballnum) {
    for(int i = 0; i < 8; i++) {
      if((dist(x, y, balls[i].x, balls[i].y) < (s/2)+(balls[i].s/2)) && (i == ballnum)==false) {
        xm=(x-balls[i].x)/20;
        ym=(y-balls[i].y)/20;
      }
    }
}
}


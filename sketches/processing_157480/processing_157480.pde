

int startPoint;
int endPoint;

int xDim=20;
int yDim=10;
int d=30;
LedGrid lg = new LedGrid(xDim, yDim);

void setup() {
  rectMode(CENTER);
  smooth();
  noStroke();
  size((xDim+1)*d, (yDim+1)*d);

  frameRate(10);
}

int e=0;
int eInc=5;

void draw() {
  background(0);
  translate(d, d);
  lg.render();

  for (int i=0;i<e;i++) {
    lg.on((int)random(xDim), (int)random(yDim));
    lg.off((int)random(xDim), (int)random(yDim));
  }

  e+=eInc;
  if (e<0 || e>100  ) {
    eInc*=(-1);
  }
}

class LedGrid {
  Led l[][];
  int xD = 0;
  int yD=0;
  
  public LedGrid(int x, int y) {
    this.xD = x;
    this.yD=y;
    l = new Led[x][y];

    for (int ii=0; ii < yD;ii++) {
      for (int i=0; i < xD;i++) {
        l[i][ii] = new Led(i*d, ii*d, 3*(d/4));
      }
    }
  }
  public void on(int x, int y) {
    l[x][y].on();
  }
  public void off(int x, int y) {
    l[x][y].off();
  }
  public void render() {
    for (int ii=0; ii < yD;ii++) {
      for (int i=0; i < xD;i++) {
        l[i][ii].render();
      }
    }
  }
}
class Led {
  int x=0;
  int y=0;
  int d=0;
  boolean state=false;

  public Led(int x, int y, int d) {
    this.x=x;
    this.y=y;
    this.d=d;
  }

  public void on() {
    state=true;
  }

  public void off() {
    state=false;
  }
  public void render() {
    if (state) {
      fill(100, 230, 0);
    }
    else {
      fill(100, 230, 0, 50);
    }
     rect(x, y, d, d);
    //ellipse(x, y, d, d);
  }
}


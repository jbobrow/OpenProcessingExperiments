
int WIDTH = 16;
int HEIGHT = 13;
long time;
Ball[] balls = new Ball[WIDTH*HEIGHT];
void setup() {
  //size(30*WIDTH-30,int((HEIGHT-1)*60/sqrt(2)));
  size(450,509);
  for (int i=0; i<WIDTH; i+=1) {
    for (int j=0; j<HEIGHT; j+=1) {
      balls[WIDTH*j+i] = new Ball((i+j)%2,i*30,j*60/sqrt(2));
    }
  }
  time = 0;
  smooth();
}
void draw() {
  background(0);
  for (int i=0; i<balls.length; i+=1) {
    balls[i].update(time);
    balls[i].show();
  }
  time += 1;
  /* uses to create gif:
  if (time < 63) {
    time += 1;
    saveFrame("frames/####.png");
  }
  */
}

class Ball {
  int col;
  float x,y,r;
  public Ball(int col,float x,float y) {
    this.col = col;
    this.x = x;
    this.y = y;
    this.r = 10;
    if (col == 0) {
      this.r = 20;
    }
  }
  public void update(long time) {
    //y += 1.;
    if (this.col == 0) {
      r = 20*sin(time/10.) + 30;
    } else {
      r = 20*sin(time/10.+PI) + 30;
    }
  }
  public void show() {
    pushMatrix();
    noStroke();
    if (col == 0) {
      //fill(255,0,0);
      fill(255);
    } else {
      //fill(0,0,255);
      fill(255);
    }
    ellipse(x,y,r,r);
    popMatrix();
  }
}




int x = 0;
int y = 0;

int speed=2;

int state=0;
void setup() {
  size (400, 400);
  background(0);
}

void draw() {
  float r;
  float g;
  float b;
  r=random(255);
  g=random(255);
  b=random(255);
  fill(r, g, b);
  ellipse(x, y, 50, 50);

  if (state==0) {
    x=x+speed;
    if (x>width-10) {
      x=width-10;
      state=1;
    }
    } else if (state==1) {
      y=y+speed;
      if (y>height+10) {
        y = height+10;
        state =2;
      }
      }  else if (state==2) {
        x=x-speed;
        if (x<0) {
          x=0;
          state=3;
        }
      }else if (state ==3) {
  y=y-speed;
  if (y<0) {
    y=0;
    state=0;
  }
}
}
    





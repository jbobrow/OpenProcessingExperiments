
int x=0; //Where we start
int y=300;

int x2=0;
int y2=100;

int x2speed=3;
int y2speed=2;

int xspeed=2;//my speed for x equal 2
int yspeed=3;//my speed for y equal -3


void setup() {
  size(400, 400);
  frameRate(500);
  background(255, 255, 255, 5);
}

void draw () {
  fill(245, 0, 255,40);
  ellipse(x, y, 10, 10);
  

  x+=xspeed;
  y-=yspeed;

  if (y<=5) {
    yspeed=-3;
  }
  if (x>= width-5) {
    xspeed=-2;
  }
  if (y>= height-5) {
    yspeed=3;
  }
  if (x<=5) {
    xspeed=2;
  }


  if (y2<= 15) {
    y2speed=2;
  }

  if (x2>= width-15) {
    x2speed=-3;
  }
  
  if (y2>= height-20) {
    y2speed=-2;
  }
  if (x2<=15) {
    x2speed=3;
  }
  
  x2+=x2speed;
  y2+=y2speed;
  
  fill(0,245,255,40);
  ellipse(x2,y2,30,30);

}





int smallBall=400;
int smallBall2=400;
int smallBall3=400;
int randomY=random(0,400);
int randomY2=random(0,400);
int randomY3=random(0,400);

void setup () {
size(400,400);
}

void draw () {
background(100,255,0);
if (smallBall2<49) {
smallBall3=smallBall3-7;
fill(0,0,255);
ellipse(smallBall3,randomY3,30,30);
  }
if (smallBall<49) {
smallBall2=smallBall2-7;
fill(0,0,255);
ellipse(smallBall2,randomY2,30,30);
  }
smallBall=smallBall-7;
fill(0,0,255);
ellipse(smallBall,randomY,30,30);
fill(255,115,0);
ellipse(15,mouseY,50,50);
}

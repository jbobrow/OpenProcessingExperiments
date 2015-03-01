
void setup() {
  size(500,500);
  background(0);
}
int xSpeed=5;
int ySpeed=4;
int ballPositionX=250;
int ballPositionY=50;
int ballSize=25;
int y1=250;
int y2=250;
void draw() {
  stroke(255);
  line(250,0,250,height);
  if(keyPressed) {
      if(key == CODED) {
    if(keyCode == UP) {
      y2-=15;
    } 
    if(keyCode == DOWN) {
      y2+=15;
    } 
      }
    if(key == 'w' || key == 'W') {
      y1-=15;
    }
    if(key == 's' || key == 'S') {
      y1+=15;
    }
  }
  background(0);
  rect(20,y1,20,75);
  rect(460,y2,20,75);
    if(ballPositionX<62 && ballPositionX>20 && ballPositionY>y1 && ballPositionY<y1+75) {
    xSpeed=5;
  }
  if(ballPositionX<480 && ballPositionX>438 && ballPositionY>y2 && ballPositionY<y2+75) {
    xSpeed=5;
    xSpeed*=-1;
  }
 if(ballPositionY>height-12 || ballPositionY<12) {
    ySpeed*=-1;
  }
 if(ballPositionX<-50 || ballPositionX>width+50) {
    ballPositionX=250;
    xSpeed=3;
  }


  ellipse(ballPositionX,ballPositionY,ballSize,ballSize);
  ballPositionX+=xSpeed;
  ballPositionY+=ySpeed;
}


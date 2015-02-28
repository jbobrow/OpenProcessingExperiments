
import netscape.javascript.*;


Ball myBall;
PImage bg;

void setup() {
  size(500, 500);
  smooth();
  myBall=new Ball();
}
//All functions are called here. Background is drawn as well.
void draw() {
  bg=loadImage("compsci6bg.gif");
  image(bg, 0, 0);

  myBall.keepTime();
  myBall.moveArm();
  myBall.throwBall();
  myBall.drawBall();
}

class Ball {
  float rotatearoundx;
  float rotatearoundy;
  float scal;
  float rot;
  float rotoffset;
  float stopx;
  float stopy;
  float speed;
  float gravity;
  int t;
  int increment;
  PImage leftarmup;
  PImage leftarmdown;
  Ball() {
    rot=0;
    scal=1;
    rotatearoundx=300;
    rotatearoundy=250;
    rotoffset=PI/30;
    stopx=280;
    stopy=246;
    gravity=.9;
    speed=1;
    t=0;
    increment=10;
    leftarmup=loadImage("manleftarmup.gif");
    leftarmdown=loadImage("manleftarm.gif");
  }
  //This function keeps the time in terms of t
  void keepTime() {
    t=t+1;
  }
  //A red ellipse is drawn.
  void drawBall() {
    if (t<600&&t>5) {
      fill(230, 0, 0);
      ellipse(0, 0, 200, 200);
    } 
    //here after t>600, the ball begins to blink and then
    //vanishes after t is no longer less than 800
    else if (t>600&&t<800&&t%2==0) {
      fill(230, 0, 0);
      ellipse(0, 0, 200, 200);
    } 
    else if (t>600&&t<800&&t%2==1) {
      fill(230, 0, 0, 45);
      ellipse(0, 0, 200, 200);
    }
  }
  //This animates the ball
  void throwBall() {
    if (scal>0.05) {
      //Ball will slow down while rotating
      rotoffset=rotoffset-rotoffset*.01;
      rot=rot+rotoffset;
      scal=scal-0.005;
      //Ball will be translated around rotatearoundx and y
      translate(rotatearoundx, rotatearoundy);
      //It rotates around this point
      rotate(rot);
      //The ball and distance from point are both scaled
      scale(scal);
      translate(275, 275);
    }
    else {
      //The ball will stop 
      translate(stopx, stopy);
      scale(0.05);
      if (t>340) {
        //The ball is thrown horizontally
        stopx+=increment;
        stopy+=speed;
        speed=speed+gravity;
        //Here is what makes the ball bounce against walls
        //and the floor
        if (stopy>(height-59)) {
          speed*=-.9;
        }
        if (stopx>455) {
          increment*=-1;
        } 
        else if (stopx<45) {
          increment*=-1;
        }
      }
    }
    //Ball no longer moves
    if (t>=700&&t<=800) {
      increment=0;
      speed=0;
      gravity=0;
    }
    //Everything resets
    if (t>850) {
      rot=0;
      rotoffset=PI/30;
      scal=1;
      stopx=280;
      stopy=246;
      t=0;
      gravity=.9;
      speed=1;
      increment=10;
    }
  }
  //Arm moves according to t
  void moveArm() {
    if (t<150) {
      image(leftarmdown, 222, 290);
    } 
    else if (t>150&&t<340) {
      image(leftarmup, 231, 230);
    } 
    else if (t>340) {
      image(leftarmdown, 222, 290);
    }
  }
}



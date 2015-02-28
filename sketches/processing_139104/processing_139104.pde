
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/132688*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="face.jpg"; */

PImage[] racoon = new PImage[10];
PImage racoonPit;
int pic = 0;
float x=320;
float y=400;
float inc=1.0;
float index=0.0;
int dir=1;
boolean pause = false;
boolean jump = false;
float timer = 1;

void setup() {
  size(640, 480);
  frameRate(30);
  inc = .5;
  for (int i=0;i<10;i++) {
    racoon[i] = requestImage("racoon"+(i+1)+".png");
  }
  racoonPit = requestImage("raccoonPit.PNG");
  println("UP=Jump");
}

void draw() {

  if (!pause) {

    background(0);
    if (pic<=9&&pic>=-9) {
      index+=inc;
      pic=abs(int(index));
      //println("index = "+index);
    }
    if (index>9.9) {
      index=0;
    }
    if (index<-9.9) {
      index=0;
    }
    if (pic>9||pic<0) { 
      pic = 0;
    }

    //println("pic = "+pic);
    image(racoon[pic], 0, 0, width, height);
  }
}
/*
void keyReleased() {
 
 if (key == '1') {
 if (inc<0) {
 inc+=.05*dir;
 }
 if (inc>0) {
 inc+=.05*dir;
 }
 if (inc>=1) {
 inc=.9;
 dir*=-1;
 }
 if (inc<=-1) {
 inc=-.9;
 dir*=-1;
 }
 //println(inc);
 }
 if (key == '2') {
 //inc-=.05;
 //inc*=-1;
 inc*=-1;
 if (inc<-1) {
 inc=-1;
 }
 }
 }
 */

void keyPressed() {
  if (keyCode== UP) {
    if (jump=false) {
      jump=true;

      if (timer>0) {
        timer-=.1;
        if (timer<.5) {
          image(racoon[pic], x, y, width, height);
        }
      }
    }
  }
  else {
    pause=false;
  }
}




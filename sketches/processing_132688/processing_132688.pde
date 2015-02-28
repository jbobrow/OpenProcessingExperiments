
/* @pjs preload="face.jpg"; */

PImage[] racoon = new PImage[10];
PImage racoonPit;
int pic = 0;
float inc=1.0;
float index=0.0;
int dir=1;
boolean pause = false;

void setup() {
  size(640, 480);
  frameRate(60);
  inc = 1/frameRate;
  for (int i=0;i<10;i++) {
    racoon[i] = requestImage("racoon"+(i+1)+".png");
  }
  racoonPit = requestImage("raccoonPit.PNG");
  println(" 1 = change speed, 2 = change direction, 3 = random image");
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

  println("speed "+inc);
  //println("index: "+index);
  println("Frame: "+pic);
  println(" 1 = change speed, 2 = change direction, 3 = random image");
  // println("inc "+inc);
  // println("index "+index);
  // println("pic "+pic);
}
void keyPressed() {
  if (key=='3') {
    background(0);
    image(racoon[int(random(9))], 0, 0, width, height);
    pause = true;
  }
  else {
    pause=false;
  }
}




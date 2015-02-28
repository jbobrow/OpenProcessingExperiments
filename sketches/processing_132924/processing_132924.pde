
/* @pjs preload="face.jpg"; */

PImage[] racoon = new PImage[10];
PImage chicken;
PImage[] kitchen = new PImage[60];
PImage racoonPit;
PImage cosby;
PImage cosbyMouth;
PImage vign;
PImage valley;
int pic = 0;
float kitchTime=0;
float inc=1;
float index=0.0;
int dir=1;
int w=0;
int h=0;
int _w=0;
int _h=0;
int count=640;
float a = 0.0;
float _inc = TWO_PI/25.0;
float old_x = 0, old_y = 320, x=640, y=0;
boolean pause = false;
boolean oneOff = false;

void setup() {
  size(640, 480);
  frameRate(60);
  inc = 1/(15);

  for (int i=0;i<10;i++) {
    racoon[i] = requestImage("racoon"+(i+1)+".png");
  }
  for (int i=0;i<60;i++) {
    kitchen[i] = requestImage("kitch"+(i)+".png");
  }
  vign = requestImage("vig.png");
  racoonPit = requestImage("raccoonPit.PNG");
  chicken = requestImage("chicken.png");
  cosby = requestImage("cosby.png");
  cosbyMouth = requestImage("cosbyMouth.png");
  valley = requestImage("valley.jpg");
  println(" 1 = change speed, 2 = change direction, 3 = random image");
}

void draw() {

  if (!pause) {

    //background(0);
    image(valley, 0, 0, width, width);
    if (kitchTime<10&&kitchTime>=0) {
      image(kitchen[int(kitchTime)], 0, 0, width, height);
      image(racoon[pic], 0, 0, width, height);
      kitchTime+=inc*dir;
      w=0;
      h=0;
    }

    if (kitchTime>10&&kitchTime<20) {
      image(kitchen[int(kitchTime)], 0, 0, width, height);
      pushMatrix(); 

      translate(w, h); 

      fill(0);  

      image(racoon[pic], 0, 0, width, height);

      popMatrix();
      kitchTime+=inc;
      w-=1.5;
      h+=4;
    }
    if (kitchTime<46&&kitchTime>=20) {
      if (oneOff==false) {
        _w=400;
        _h=100;
        oneOff=true;
      }
      image(kitchen[int(kitchTime)], 0, 0, width, height);

      pushMatrix(); 

      translate(_w, _h); 

      fill(0);  

      image(chicken, 0, 0, 480, 480);

      popMatrix();
      if (kitchTime<32&&kitchTime>20) {
        _h-=.25;
        _w-=1;
      }
      if (kitchTime<50&&kitchTime>32) {
        _h-=1.5;
        _w-=7;
      }
      kitchTime+=inc*dir;
      if (int(kitchTime)>46) {
      kitchTime-=inc/2;
      }
    }
    if (kitchTime>40&&kitchTime<59) {

      image(kitchen[int(kitchTime)], 0, 0, width, height);



      count=count-int(4+4*inc);
      x = count;
      y = 150 + sin(a) * 50.0;
      // image(cosby, x-200, y, 258, 64);
      //  image(cosbyMouth, x-200, y+12, 258, 64);
      image(cosby, old_x, y, 240, 240);
      image(cosbyMouth, old_x, old_y+8, 240, 240);

      old_x = x;
      old_y = y;
      a = a + .1;

      if (kitchTime>50&&kitchTime<59) {
        if (w>0) {
          w-=3;
        }
        if (h>0) {
          h-=3;
        }
        image(racoon[pic], w, h, width, height);
      }
    }
    if (kitchTime>46&&kitchTime<59) {
      kitchTime+=(inc/2)*dir;
    }
    if (kitchTime>=59||kitchTime<0) {

      oneOff=false;
      old_x = 0;
      old_y = 320;
      x=0;
      y=0;
      count=640;
      a = 0.0;
      kitchTime=0;
    }
    image(vign, 0, 0, width, height);
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
  }
}

void keyReleased() {
  if (key == '1') {
    pause=false;
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
    pause=false;
    //inc-=.05;
    //inc*=-1;
    inc*=-1;
    if (inc<-1) {
      inc=-1;
    }
  }

  println("speed "+inc);
  println("kitchTime: "+kitchTime);
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




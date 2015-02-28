
/*
Final Project
Author: David Hartsough
Date: 14 May 2013
Purpose: Create the ever entertaining game, Happy Balls!
*/
/* @pjs preload="http://davidhartsough.com/happyballs/libs/back.png,libs/down.png,http://davidhartsough.com/happyballs/libs/downleft.png,http://davidhartsough.com/happyballs/libs/downright.png,http://davidhartsough.com/happyballs/libs/happyfaceblue.png,http://davidhartsough.com/happyballs/libs/happyfaces.png,http://davidhartsough.com/happyballs/libs/happyfacesred.png,http://davidhartsough.com/happyballs/libs/left.png,http://davidhartsough.com/happyballs/libs/play.png,http://davidhartsough.com/happyballs/libs/refresh.png,http://davidhartsough.com/happyballs/libs/right.png,http://davidhartsough.com/happyballs/libs/ssdown.png,http://davidhartsough.com/happyballs/libs/ssleft.png,http://davidhartsough.com/happyballs/libs/ssright.png,http://davidhartsough.com/happyballs/libs/ssup.png,http://davidhartsough.com/happyballs/libs/stop.png,libs/up.png,libs/upleft.png,libs/upright.png,libs/ahh.wav,libs/complaywithme.wav,libs/happyballsss.wav,libs/hello.wav,http://davidhartsough.com/happyballs/libs/owie.wav,http://davidhartsough.com/happyballs/libs/playme.wav,http://davidhartsough.com/happyballs/libs/playmeplease.wav,http://davidhartsough.com/happyballs/libs/shaup.wav,http://davidhartsough.com/happyballs/libs/wahoo.wav,http://davidhartsough.com/happyballs/libs/weee.wav,http://davidhartsough.com/happyballs/libs/woopdeedoo.wav,http://davidhartsough.com/happyballs/libs/yea.wav,http://davidhartsough.com/happyballs/libs/yip.wav"; */
//below are the global variables
import ddf.minim.*;
Minim minim;
AudioSample woopdeedoo;
AudioSample happyballs;
AudioSample wahoo;
AudioSample weee;
AudioSample shaup;
AudioSample owie;
AudioSample ahh;
Startscreen startscreen;
Levelselect levelselect;
Redball redball;
Greenball greenball;
Blueball blueball;
Level level;
ObstacleWide obstaclewide;
ObstacleLong obstaclelong;


int state;
int lvl;

//below is the starting setup
void setup() {
  //size(1920, 1080);
  //size(1366, 768);
  //1366×768
  size(960, 540);
  smooth();
  state = 1;
  lvl=1;
  minim = new Minim(this);
  ahh = minim.loadSample("http://davidhartsough.com/happyballs/libs/ahh.wav", 512);
  woopdeedoo = minim.loadSample("http://davidhartsough.com/happyballs/libs/woopdeedoo.wav", 512);
  happyballs = minim.loadSample("http://davidhartsough.com/happyballs/libs/happyballsss.wav", 512);
  wahoo = minim.loadSample("http://davidhartsough.com/happyballs/libs/wahoo.wav", 512);
  weee = minim.loadSample("http://davidhartsough.com/happyballs/libs/weee.wav", 512);
  shaup = minim.loadSample("http://davidhartsough.com/happyballs/libs/shaup.wav", 512);
  owie = minim.loadSample("http://davidhartsough.com/happyballs/libs/owie.wav", 512);
  startscreen = new Startscreen();
  levelselect = new Levelselect();
  blueball = new Blueball();
  redball = new Redball();
  greenball = new Greenball();
  level = new Level();
  obstaclewide = new ObstacleWide();
  obstaclelong = new ObstacleLong();
  imageMode(CENTER);
  rectMode(CENTER);
}

//below is the draw function which calls the methods from the classes
void draw() {
  background(255);
  smooth();
  if (state == 1) {
    startscreen.titlescreen();
  }
  if (state == 3) {
    level.grid();
    level.buttons();
    level.snappin();
    blueball.displayA();
    redball.displayE();
    blueball.bumpin();
    greenball.winnin();
    greenball.displayG();
    obstaclewide.addobstacle();
    obstaclelong.addobstacle();
    if (lvl == 8) {
      greenball.eighth();
    }
  }
  if (state == 2) {
    levelselect.selectscreen();
  }
}
class Blueball {
  //below are the properties
  PImage blueface;
  float x;
  float y;
  float xmove;
  float ymove;
  int radiusA;
  //below is the constructor
  /* @pjs preload="http://davidhartsough.com/happyballs/libs/happyfaceblue.png";*/
  Blueball() {
    smooth();
    x = height/18*2.5;
    y = height/18*2.5;
    xmove = 0;
    ymove = 0;
    radiusA = height/18;
    blueface = loadImage("http://davidhartsough.com/happyballs/libs/happyfaceblue.png");
  }
  //below is a method to display the player's character
  void displayA() {
    noStroke();
    fill(0, 0, 255);
    ellipse(x, y, radiusA, radiusA);
    y=y+ymove;
    x=x+xmove;
    if (x > width-radiusA/2-5) {
      xmove=-xmove;
      owie.trigger();
    }
    if (x < radiusA/2+5) {
      xmove=-xmove;
      owie.trigger();
    }
    if (y < height/18+radiusA/2+5) {
      ymove=-ymove;
      owie.trigger();
    }
    if (y > height-radiusA/2-5) {
      ymove=-ymove;
      owie.trigger();
    }
    image(blueface, x, y, height/18, height/18);
  }
  //below is the method to make the ball bounce
  void bumpin() {
    if ((dist(x, y, redball.i, redball.j) < radiusA) && (x != height/18*2.5) && (y != height/18*2.5)) {
      x = height/18*2.5;
      y = height/18*2.5;
      xmove = 0;
      ymove = 0;
      ahh.trigger();
    }
    if ((dist(x, y, redball.i2, redball.j2) < radiusA) && (x != height/18*2.5) && (y != height/18*2.5)) {
      x = height/18*2.5;
      y = height/18*2.5;
      xmove = 0;
      ymove = 0;
      ahh.trigger();
    }
    if ((y > obstaclewide.yobstacle1-obstaclewide.hobstacle/2-radiusA/2-5) && (x > obstaclewide.xobstacle1-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle1+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclewide.yobstacle1+obstaclewide.hobstacle/2+radiusA/2+5) && (x > obstaclewide.xobstacle1-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle1+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclewide.xobstacle1-obstaclewide.wobstacle/2-radiusA/2-5) && (y > obstaclewide.yobstacle1-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle1+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclewide.xobstacle1+obstaclewide.wobstacle/2+radiusA/2+5) && (y > obstaclewide.yobstacle1-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle1+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((y > obstaclelong.yob1-obstaclelong.hobl/2-radiusA/2-5) && (x > obstaclelong.xob1-obstaclelong.wobl/2) && (x < obstaclelong.xob1+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclelong.yob1+obstaclelong.hobl/2+radiusA/2+5) && (x > obstaclelong.xob1-obstaclelong.wobl/2) && (x < obstaclelong.xob1+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclelong.xob1-obstaclelong.wobl/2-radiusA/2-5) && (y > obstaclelong.yob1-obstaclelong.hobl/2) && (y < obstaclelong.yob1+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclelong.xob1+obstaclelong.wobl/2+radiusA/2+5) && (y > obstaclelong.yob1-obstaclelong.hobl/2) && (y < obstaclelong.yob1+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
    if ((y > obstaclewide.yobstacle2-obstaclewide.hobstacle/2-radiusA/2-5) && (x > obstaclewide.xobstacle2-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle2+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclewide.yobstacle2+obstaclewide.hobstacle/2+radiusA/2+5) && (x > obstaclewide.xobstacle2-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle2+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclewide.xobstacle2-obstaclewide.wobstacle/2-radiusA/2-5) && (y > obstaclewide.yobstacle2-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle2+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclewide.xobstacle2+obstaclewide.wobstacle/2+radiusA/2+5) && (y > obstaclewide.yobstacle2-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle2+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((y > obstaclelong.yob2-obstaclelong.hobl/2-radiusA/2-5) && (x > obstaclelong.xob2-obstaclelong.wobl/2) && (x < obstaclelong.xob2+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclelong.yob2+obstaclelong.hobl/2+radiusA/2+5) && (x > obstaclelong.xob2-obstaclelong.wobl/2) && (x < obstaclelong.xob2+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclelong.xob2-obstaclelong.wobl/2-radiusA/2-5) && (y > obstaclelong.yob2-obstaclelong.hobl/2) && (y < obstaclelong.yob2+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclelong.xob2+obstaclelong.wobl/2+radiusA/2+5) && (y > obstaclelong.yob2-obstaclelong.hobl/2) && (y < obstaclelong.yob2+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
    if ((y > obstaclewide.yobstacle3-obstaclewide.hobstacle/2-radiusA/2-5) && (x > obstaclewide.xobstacle3-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle3+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclewide.yobstacle3+obstaclewide.hobstacle/2+radiusA/2+5) && (x > obstaclewide.xobstacle3-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle3+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclewide.xobstacle3-obstaclewide.wobstacle/2-radiusA/2-5) && (y > obstaclewide.yobstacle3-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle3+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclewide.xobstacle3+obstaclewide.wobstacle/2+radiusA/2+5) && (y > obstaclewide.yobstacle3-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle3+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((y > obstaclelong.yob3-obstaclelong.hobl/2-radiusA/2-5) && (x > obstaclelong.xob3-obstaclelong.wobl/2) && (x < obstaclelong.xob3+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclelong.yob3+obstaclelong.hobl/2+radiusA/2+5) && (x > obstaclelong.xob3-obstaclelong.wobl/2) && (x < obstaclelong.xob3+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclelong.xob3-obstaclelong.wobl/2-radiusA/2-5) && (y > obstaclelong.yob3-obstaclelong.hobl/2) && (y < obstaclelong.yob3+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclelong.xob3+obstaclelong.wobl/2+radiusA/2+5) && (y > obstaclelong.yob3-obstaclelong.hobl/2) && (y < obstaclelong.yob3+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
    if ((y > obstaclewide.yobstacle4-obstaclewide.hobstacle/2-radiusA/2-5) && (x > obstaclewide.xobstacle4-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle4+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclewide.yobstacle4+obstaclewide.hobstacle/2+radiusA/2+5) && (x > obstaclewide.xobstacle4-obstaclewide.wobstacle/2) && (x < obstaclewide.xobstacle4+obstaclewide.wobstacle/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclewide.xobstacle4-obstaclewide.wobstacle/2-radiusA/2-5) && (y > obstaclewide.yobstacle4-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle4+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclewide.xobstacle4+obstaclewide.wobstacle/2+radiusA/2+5) && (y > obstaclewide.yobstacle4-obstaclewide.hobstacle/2) && (y < obstaclewide.yobstacle4+obstaclewide.hobstacle/2)) {
      xmove=-xmove;
    }
    if ((y > obstaclelong.yob4-obstaclelong.hobl/2-radiusA/2-5) && (x > obstaclelong.xob4-obstaclelong.wobl/2) && (x < obstaclelong.xob4+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((y > obstaclelong.yob4+obstaclelong.hobl/2+radiusA/2+5) && (x > obstaclelong.xob4-obstaclelong.wobl/2) && (x < obstaclelong.xob4+obstaclelong.wobl/2)) {
      ymove=-ymove;
    }
    if ((x > obstaclelong.xob4-obstaclelong.wobl/2-radiusA/2-5) && (y > obstaclelong.yob4-obstaclelong.hobl/2) && (y < obstaclelong.yob4+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
    if ((x > obstaclelong.xob4+obstaclelong.wobl/2+radiusA/2+5) && (y > obstaclelong.yob4-obstaclelong.hobl/2) && (y < obstaclelong.yob4+obstaclelong.hobl/2)) {
      xmove=-xmove;
    }
  }
}

class Greenball {
  //below are the properties for the green ball
  PImage greenface;
  float m;
  float n;
  float mmove;
  float nmove;
  float radiusG;
  //below is the constructor
    /* @pjs preload="http://davidhartsough.com/happyballs/libs/happyfaces.png";*/
  Greenball() {
    smooth();
    greenface = loadImage("http://davidhartsough.com/happyballs/libs/happyfaces.png");
    m = width-height/18*2.5;
    n = height-height/18*2.5;
    mmove=8;
    nmove=8;
    radiusG = height/18;
  }
  //below is the method to display the green ball
  void displayG() {
    noStroke();
    fill(0, 255, 0);
    ellipse(m, n, radiusG, radiusG);
    image(greenface, m, n, height/18, height/18);
  }
  //below is the method used in the last level
  void eighth() {
    m=m+mmove;
    n=n+nmove;

    if (m > width-radiusG/2-5) {
      mmove=-mmove;
    }
    if (m < radiusG/2+5) {
      mmove=-mmove;
    }
    if (n < height/18+radiusG/2+5) {
      nmove=-nmove;
    }
    if (n > height-radiusG/2-5) {
      nmove=-nmove;
    }
  }
  //below is the method used when the player wins a level
  void winnin() {
    if (dist(m, n, blueball.x, blueball.y) < radiusG) {
      state = 2;
      wahoo.trigger();
      if (lvl==1) {
        levelselect.colour2red = 0;
        levelselect.colour2green = 255;
      }

      if (lvl==2) {
        levelselect.colour3red = 0;
        levelselect.colour3green = 255;
      
      }
      if (lvl==3) {
        levelselect.colour4red = 0;
        levelselect.colour4green = 255;
      }
      if (lvl==4) {
        levelselect.colour5red = 0;
        levelselect.colour5green = 255;
      }
      if (lvl==5) {
        levelselect.colour6red = 0;
        levelselect.colour6green = 255;
      }
      if (lvl==6) {
        levelselect.colour7red = 0;
        levelselect.colour7green = 255;
      }
      if (lvl==7) {
        levelselect.colour8red = 0;
        levelselect.colour8green = 255;
      }
      if (lvl==8) {
        m = width-height/18*2.5;
        n = height-height/18*2.5;
        mmove=8;
        nmove=8;
      }
    }
  }
}

class Level {
  //below are the properties
  PImage back;
  PImage refresh;
  PImage play;
  PImage stop;
  PImage up;
  PImage down;
  PImage left;
  PImage right;
  PImage upright;
  PImage upleft;
  PImage downright;
  PImage downleft;
  float xup;
  float yup;
  float xdown;
  float ydown;
  float xright;
  float yright;
  float xleft;
  float yleft;
  float xupright;
  float yupright;
  float xdownright;
  float ydownright;
  float xupleft;
  float yupleft;
  float xdownleft;
  float ydownleft;
  float xupoff=0;
  float yupoff=0;
  float xdownoff=0;
  float ydownoff=0;
  float xrightoff=0;
  float yrightoff=0;
  float xleftoff=0;
  float yleftoff=0;
  float xuprightoff=0;
  float yuprightoff=0;
  float xdownrightoff=0;
  float ydownrightoff=0;
  float xupleftoff=0;
  float yupleftoff=0;
  float xdownleftoff=0;
  float ydownleftoff=0;
  boolean uplocked=false;
  boolean downlocked=false;
  boolean leftlocked=false;
  boolean rightlocked=false;
  boolean uprightlocked=false;
  boolean upleftlocked=false;
  boolean downrightlocked=false;
  boolean downleftlocked=false;
  //below is the constructor
    /* @pjs preload="http://davidhartsough.com/happyballs/libs/back.png,http://davidhartsough.com/happyballs/libs/refresh.png,http://davidhartsough.com/happyballs/libs/play.png,libs/stop.png,libs/up.png,libs/down.png,libs/left.png,libs/right.png,libs/upright.png,libs/upleft.png,libs/downright.png,libs/downleft.png";*/
  Level() {
    smooth();
    back = loadImage("http://davidhartsough.com/happyballs/libs/back.png");
    refresh = loadImage("http://davidhartsough.com/happyballs/libs/refresh.png");
    play = loadImage("http://davidhartsough.com/happyballs/libs/play.png");
    stop = loadImage("http://davidhartsough.com/happyballs/libs/stop.png");
    up = loadImage("http://davidhartsough.com/happyballs/libs/up.png");
    down = loadImage("http://davidhartsough.com/happyballs/libs/down.png");
    left = loadImage("http://davidhartsough.com/happyballs/libs/left.png");
    right = loadImage("http://davidhartsough.com/happyballs/libs/right.png");
    upright = loadImage("http://davidhartsough.com/happyballs/libs/upright.png");
    upleft = loadImage("http://davidhartsough.com/happyballs/libs/upleft.png");
    downright = loadImage("http://davidhartsough.com/happyballs/libs/downright.png");
    downleft = loadImage("http://davidhartsough.com/happyballs/libs/downleft.png");
    imageMode(CENTER);
    xup = height/18*4.5;
    yup = height/18/2;
    xdown = height/18*5.5;
    ydown = height/18/2;
    xright = height/18*6.5;
    yright = height/18/2;
    xleft = height/18*7.5;
    yleft = height/18/2;
    xupright = height/18*8.5;
    yupright = height/18/2;
    xupleft = height/18*9.5;
    yupleft = height/18/2;
    xdownright = height/18*10.5;
    ydownright = height/18/2;
    xdownleft = height/18*11.5;
    ydownleft = height/18/2;
  }
  //below the method creates a visual grid
  void grid() {
    stroke(100);
    strokeWeight(width/384);
    line(0, 0, width, 0);
    line(0, height/18, width, height/18);
    line(0, 0, 0, height/18);
    for (int i = 0; i < 13; i++) {
      line(height/18*i, height/18, height/18*i, 0);
    }
    for (int z = 0; z < width; z++) {
      line((height/18)*z, height/18, (height/18)*z, height);
    }
    for (int z = 2; z < height; z++) {
      line(0, (height/18)*z, width, (height/18)*z);
    }
  }
  //below the buttons are displayed and given functions
  void buttons() {
    image(back, height/18*.5, height/18/2, height/18, height/18);
    image(refresh, height/18*1.5, height/18/2, height/18, height/18);
    image(play, height/18*2.5, height/18/2, height/18, height/18);
    image(stop, height/18*3.5, height/18/2, height/18, height/18);
    if ((lvl != 2) && (lvl != 4) && (lvl != 5)) {
      image(up, xup, yup, height/18, height/18);
      image(down, xdown, ydown, height/18, height/18);
      image(right, xright, yright, height/18, height/18);
      image(left, xleft, yleft, height/18, height/18);
    }
    if (lvl != 7) {
      image(upright, xupright, yupright, height/18, height/18);
      image(upleft, xupleft, yupleft, height/18, height/18);
      image(downright, xdownright, ydownright, height/18, height/18);
      image(downleft, xdownleft, ydownleft, height/18, height/18);
    }
    if (dist(xup, yup, blueball.x, blueball.y) < 1) {
      blueball.ymove=-6;
      blueball.xmove=0;
      weee.trigger();
    }
    if (dist(xdown, ydown, blueball.x, blueball.y) < 1) {
      blueball.ymove=6;
      blueball.xmove=0;
      weee.trigger();
    }
    if (dist(xright, yright, blueball.x, blueball.y) < 1) {
      blueball.xmove=6;
      blueball.ymove=0;
      weee.trigger();
    }
    if (dist(xleft, yleft, blueball.x, blueball.y) < 1) {
      blueball.xmove=-6;
      blueball.ymove=0;
      weee.trigger();
    }
    if (dist(xupright, yupright, blueball.x, blueball.y) < 1) {
      blueball.ymove=-6;
      blueball.xmove=6;
      weee.trigger();
    }
    if (dist(xupleft, yupleft, blueball.x, blueball.y) < 1) {
      blueball.ymove=-6;
      blueball.xmove=-6;
      weee.trigger();
    }
    if (dist(xdownright, ydownright, blueball.x, blueball.y) < 1) {
      blueball.ymove=6;
      blueball.xmove=6;
      weee.trigger();
    }
    if (dist(xdownleft, ydownleft, blueball.x, blueball.y) < 1) {
      blueball.ymove=6;
      blueball.xmove=-6;
      weee.trigger();
    }
  }
  //below is the code used for snapping the buttons on the grid
  void snappin() {    
    for (int i=0; i < 22; i++) {
      if ((yup > height/18*i) && (yup < height/18*(i+1))) {
        yup = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xup > height/18*i) && (xup < height/18*(i+1))) {
        xup = height/18*(i+.5);
      }
    }
    for (int i=0; i < 22; i++) {
      if ((ydown > height/18*i) && (ydown < height/18*(i+1))) {
        ydown = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xdown > height/18*i) && (xdown < height/18*(i+1))) {
        xdown = height/18*(i+.5);
      }
    }
    for (int i=0; i < 22; i++) {
      if ((yleft > height/18*i) && (yleft < height/18*(i+1))) {
        yleft = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xleft > height/18*i) && (xleft < height/18*(i+1))) {
        xleft = height/18*(i+.5);
      }
    }
    for (int i=0; i < 22; i++) {
      if ((yright > height/18*i) && (yright < height/18*(i+1))) {
        yright = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xright > height/18*i) && (xright < height/18*(i+1))) {
        xright = height/18*(i+.5);
      }
    }
    for (int i=0; i < 22; i++) {
      if ((yupright > height/18*i) && (yupright < height/18*(i+1))) {
        yupright = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xupright > height/18*i) && (xupright < height/18*(i+1))) {
        xupright = height/18*(i+.5);
      }
    }
    for (int i=0; i < 20; i++) {
      if ((yupleft > height/18*i) && (yupleft < height/18*(i+1))) {
        yupleft = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xupleft > height/18*i) && (xupleft < height/18*(i+1))) {
        xupleft = height/18*(i+.5);
      }
    }
    for (int i=0; i < 22; i++) {
      if ((ydownright > height/18*i) && (ydownright < height/18*(i+1))) {
        ydownright = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xdownright > height/18*i) && (xdownright < height/18*(i+1))) {
        xdownright = height/18*(i+.5);
      }
    }
    for (int i=0; i < 22; i++) {
      if ((ydownleft > height/18*i) && (ydownleft < height/18*(i+1))) {
        ydownleft = height/18*(i+.5);
      }
    }
    for (int i=0; i < 32; i++) {
      if ((xdownleft > height/18*i) && (xdownleft < height/18*(i+1))) {
        xdownleft = height/18*(i+.5);
      }
    }
  }
}

class Levelselect {
  //below are the properties
  float level1x;
  float level1y;
  float level2x;
  float level2y;
  float level3x;
  float level3y;
  float level4x;
  float level4y;
  float colour2red;
  float colour2green;
  float colour3red;
  float colour3green;
  float colour4red;
  float colour4green;
  float level5x;
  float level5y;
  float level6x;
  float level6y;
  float level7x;
  float level7y;
  float level8x;
  float level8y;
  float colour5red;
  float colour5green;
  float colour6red;
  float colour6green;
  float colour7red;
  float colour7green;
  float colour8red;
  float colour8green;
  float radiuslevel;
  PFont myFont;
  //below is the constructor
  Levelselect() {
    smooth();
    level1x = width/6;
    level1y = width/12;
    level2x = width/6*2.25;
    level2y = width/12;
    level3x = width/6*3.5;
    level3y = width/12;
    level4x = width/6*4.75;
    level4y = width/12;
    colour2red = 255;
    colour2green = 0;
    colour3red = 255;
    colour3green = 0;
    colour4red = 255;
    colour4green = 0;
    level5x = width/6;
    level5y = width/5;
    level6x = width/6*2.25;
    level6y = width/5;
    level7x = width/6*3.5;
    level7y = width/5;
    level8x = width/6*4.75;
    level8y = width/5;
    colour5red = 255;
    colour5green = 0;
    colour6red = 255;
    colour6green = 0;
    colour7red = 255;
    colour7green = 0;
    colour8red = 255;
    colour8green = 0;
    radiuslevel = width/12;
    myFont = createFont("Arial", 35);
  }
  //below is the basic level selection screen
  void selectscreen() {

    level.xup = height/18*4.5;
    level.yup = height/18/2;
    level.xdown = height/18*5.5;
    level.ydown = height/18/2;
    level.xright = height/18*6.5;
    level.yright = height/18/2;
    level.xleft = height/18*7.5;
    level.yleft = height/18/2;
    level.xupright = height/18*8.5;
    level.yupright = height/18/2;
    level.xupleft = height/18*9.5;
    level.yupleft = height/18/2;
    level.xdownright = height/18*10.5;
    level.ydownright = height/18/2;
    level.xdownleft = height/18*11.5;
    level.ydownleft = height/18/2;
    blueball.x = height/18*2.5;
    blueball.y = height/18*2.5;
    blueball.xmove = 0;
    blueball.ymove = 0;

    noStroke();
    fill(0, 255, 0);
    ellipse(level1x, level1y, radiuslevel, radiuslevel);
    fill(colour2red, colour2green, 0);
    ellipse(level2x, level2y, radiuslevel, radiuslevel);
    fill(colour3red, colour3green, 0);
    ellipse(level3x, level3y, radiuslevel, radiuslevel);
    fill(colour4red, colour4green, 0);
    ellipse(level4x, level4y, radiuslevel, radiuslevel);
    fill(colour5red, colour5green, 0);
    ellipse(level5x, level5y, radiuslevel, radiuslevel);
    fill(colour6red, colour6green, 0);
    ellipse(level6x, level6y, radiuslevel, radiuslevel);
    fill(colour7red, colour7green, 0);
    ellipse(level7x, level7y, radiuslevel, radiuslevel);
    fill(colour8red, colour8green, 0);
    ellipse(level8x, level8y, radiuslevel, radiuslevel);
    fill(100);
    textFont(myFont);
    textAlign(LEFT, CENTER);
    text("- Drag and drop the directional boxes from the toolbar", (height/18*2.5), height/2+(height/18*.5));
    text("- Drop the blue ball with the play button", (height/18*2.5), height/2+(height/18*2.5));
    text("- Navigate the blue ball to the green ball", (height/18*2.5), height/2+(height/18*4.5));
    text("- Avoid red balls", (height/18*2.5), height/2+(height/18*6.5));
    textAlign(CENTER, CENTER);
    text("1", level1x+radiuslevel, level1y-10);
    text("2", level2x+radiuslevel, level2y-10);
    text("3", level3x+radiuslevel, level3y-10);
    text("4", level4x+radiuslevel, level4y-10);
    text("5", level5x+radiuslevel, level5y-10);
    text("6", level6x+radiuslevel, level6y-10);
    text("7", level7x+radiuslevel, level7y-10);
    text("8", level8x+radiuslevel, level8y-10);
  }
}

//below is code called when the mouse is clicked
void mouseClicked() {
  if (state == 2) { // level selection
    if (dist(mouseX, mouseY, levelselect.level1x, levelselect.level1y) < levelselect.radiuslevel/2) {
      lvl=1;
      state = 3;
      woopdeedoo.trigger();
      redball.i = height/18*15.5;
      redball.j = height/18*7.5;
      redball.i2 = width*2;
      redball.j2 = height*2;
    }
    if ((dist(mouseX, mouseY, levelselect.level2x, levelselect.level2y) < levelselect.radiuslevel/2) && (levelselect.colour2green == 255)) {
      lvl=2;
      state = 3;
      woopdeedoo.trigger();
      redball.i = height/18*15.5;
      redball.j = height/18*7.5;
      redball.i2 = height/18*5.5;
      redball.j2 = height/18*8.5;
    }
    if ((dist(mouseX, mouseY, levelselect.level3x, levelselect.level3y) < levelselect.radiuslevel/2) && (levelselect.colour3green == 255)) {
      lvl=3;
      state = 3;
      woopdeedoo.trigger();
    }
    if ((dist(mouseX, mouseY, levelselect.level4x, levelselect.level4y) < levelselect.radiuslevel/2) && (levelselect.colour4green == 255)) {
      lvl=4;
      state = 3;
      woopdeedoo.trigger();
      redball.i = height/18*24.5;
      redball.i2 = height/18*9.5;
      redball.j2 = height/18*10.5;
      redball.imove2=6;
      redball.jmove2=0;
    }
    if ((dist(mouseX, mouseY, levelselect.level5x, levelselect.level5y) < levelselect.radiuslevel/2) && (levelselect.colour5green == 255)) {
      lvl=5;
      state = 3;
      woopdeedoo.trigger();
      redball.i = height/18*25.5;
      redball.i2 = height/18*15.5;
      redball.j2 =height/18*12.5;
    }
    if ((dist(mouseX, mouseY, levelselect.level6x, levelselect.level6y) < levelselect.radiuslevel/2) && (levelselect.colour6green == 255)) {
      lvl=6;
      state = 3;
      woopdeedoo.trigger();
      redball.i = height/18*15.5;
      redball.j = height/18*7.5;
      redball.i2 = greenball.m-height/18*4;
      redball.j2 = greenball.n;
      redball.imove2=0;
      redball.jmove2=6;
    }
    if ((dist(mouseX, mouseY, levelselect.level7x, levelselect.level7y) < levelselect.radiuslevel/2) && (levelselect.colour7green == 255)) {
      lvl=7;
      state = 3;
      woopdeedoo.trigger();
      redball.i = height/18*25.5;
      redball.j= height/18*16.5;
      redball.imove=6;
      redball.jmove=0;
      redball.i2=height/18*12.5;
      redball.j2=height/18*10.5;
      redball.imove2=6;
      redball.jmove2=6;
    }
    if ((dist(mouseX, mouseY, levelselect.level8x, levelselect.level8y) < levelselect.radiuslevel/2) && (levelselect.colour8green == 255)) {
      lvl=8;
      state = 3;
      woopdeedoo.trigger(); 
      redball.i = height/18*25.5;
      redball.j= height/18*7.5;
      redball.imove=8;
      redball.jmove=-8;
      redball.i2=height/18*12.5;
      redball.j2=height/18*10.5;
      redball.imove2=8;
      redball.jmove2=8;
    }
  }
  if (state == 3) { //gameplay
    if ((blueball.x == height/18*2.5) && (blueball.y == height/18*2.5) && (mouseX > height/18*2) && (mouseX < height/18*3) && (mouseY > 0) && (mouseY < height/18)) {
      blueball.ymove=6;
      blueball.y=blueball.y+blueball.ymove;
    }
    if ((mouseX > height/18*3) && (mouseX < height/18*4) && (mouseY > 0) && (mouseY < height/18)) {
      blueball.x = height/18*2.5;
      blueball.y = height/18*2.5;
      blueball.ymove=0;
      blueball.xmove=0;
    }
    if ((mouseX > 0) && (mouseX < height/18) && (mouseY > 0) && (mouseY < height/18)) {
      state = 2;
    }
    if ((mouseX > height/18) && (mouseX < height/18*2) && (mouseY > 0) && (mouseY < height/18)) {
      level.xup = height/18*4.5;
      level.yup = height/18/2;
      level.xdown = height/18*5.5;
      level.ydown = height/18/2;
      level.xright = height/18*6.5;
      level.yright = height/18/2;
      level.xleft = height/18*7.5;
      level.yleft = height/18/2;
      level.xupright = height/18*8.5;
      level.yupright = height/18/2;
      level.xupleft = height/18*9.5;
      level.yupleft = height/18/2;
      level.xdownright = height/18*10.5;
      level.ydownright = height/18/2;
      level.xdownleft = height/18*11.5;
      level.ydownleft = height/18/2; 
      blueball.x = height/18*2.5;
      blueball.y = height/18*2.5;
      blueball.ymove=0;
      blueball.xmove=0;
    }
  }
}

//below is code called for when the mouse is pressed
void mousePressed() { // used for moving buttons
  if (state == 3) { // gameplay
    if (lvl != 2) {
      if (dist(mouseX, mouseY, level.xup, level.yup) < height/18/2) {
        level.uplocked = true;
        shaup.trigger();
      }
      else {
        level.uplocked = false;
      }
      if (dist(mouseX, mouseY, level.xdown, level.ydown) < height/18/2) {
        level.downlocked = true;
        shaup.trigger();
      } 
      else {
        level.downlocked = false;
      }
      if (dist(mouseX, mouseY, level.xright, level.yright) < height/18/2) {
        level.rightlocked = true;
        shaup.trigger();
      } 
      else {
        level.rightlocked = false;
      }
      if (dist(mouseX, mouseY, level.xleft, level.yleft) < height/18/2) {
        level.leftlocked = true;
        shaup.trigger();
      } 
      else {
        level.leftlocked = false;
      }
    }
    if (dist(mouseX, mouseY, level.xupright, level.yupright) < height/18/2) {
      level.uprightlocked = true;
      shaup.trigger();
    } 
    else {
      level.uprightlocked = false;
    }
    if (dist(mouseX, mouseY, level.xupleft, level.yupleft) < height/18/2) {
      level.upleftlocked = true;
      shaup.trigger();
    } 
    else {
      level.upleftlocked = false;
    }
    if (dist(mouseX, mouseY, level.xdownright, level.ydownright) < height/18/2) {
      level.downrightlocked = true;
      shaup.trigger();
    } 
    else {
      level.downrightlocked = false;
    }
    if (dist(mouseX, mouseY, level.xdownleft, level.ydownleft) < height/18/2) {
      level.downleftlocked = true;
      shaup.trigger();
    } 
    else {
      level.downleftlocked = false;
    }
    level.xupoff = mouseX-level.xup;
    level.yupoff = mouseY-level.yup;
    level.xdownoff = mouseX-level.xdown;
    level.ydownoff = mouseY-level.ydown;
    level.xrightoff = mouseX-level.xright;
    level.yrightoff = mouseY-level.yright;
    level.xleftoff = mouseX-level.xleft;
    level.yleftoff = mouseY-level.yleft;
    level.xuprightoff = mouseX-level.xupright;
    level.yuprightoff = mouseY-level.yupright;
    level.xupleftoff = mouseX-level.xupleft;
    level.yupleftoff = mouseY-level.yupleft;
    level.xdownrightoff = mouseX-level.xdownright;
    level.ydownrightoff = mouseY-level.ydownright;
    level.xdownleftoff = mouseX-level.xdownleft;
    level.ydownleftoff = mouseY-level.ydownleft;
  }
}

//below is the code called when the mouse is dragged
void mouseDragged() {
  if (state == 3) { //used in gameplay when moving buttons
    if (level.uplocked) {
      level.xup = mouseX-level.xupoff;
      level.yup = mouseY-level.yupoff;
    }  
    if (level.downlocked) {
      level.xdown = mouseX-level.xdownoff;
      level.ydown = mouseY-level.ydownoff;
    }
    if (level.rightlocked) {
      level.xright = mouseX-level.xrightoff;
      level.yright = mouseY-level.yrightoff;
    }  
    if (level.leftlocked) {
      level.xleft = mouseX-level.xleftoff;
      level.yleft = mouseY-level.yleftoff;
    }
    if (level.uprightlocked) {
      level.xupright = mouseX-level.xuprightoff;
      level.yupright = mouseY-level.yuprightoff;
    }  
    if (level.upleftlocked) {
      level.xupleft = mouseX-level.xupleftoff;
      level.yupleft = mouseY-level.yupleftoff;
    }
    if (level.downrightlocked) {
      level.xdownright = mouseX-level.xdownrightoff;
      level.ydownright = mouseY-level.ydownrightoff;
    }  
    if (level.downleftlocked) {
      level.xdownleft = mouseX-level.xdownleftoff;
      level.ydownleft = mouseY-level.ydownleftoff;
    }
  }
}

//below is the code called when the mouse is released
void mouseReleased() {
  if (state == 3) { //placing the buttons
    level.uplocked = false;
    level.downlocked = false;
    level.rightlocked = false;
    level.leftlocked = false;
    level.uprightlocked = false;
    level.upleftlocked = false;
    level.downrightlocked = false;
    level.downleftlocked = false;
  }
}

class ObstacleWide {
  //below are the properties
  float wobstacle;
  float hobstacle;
  float xobstacle1;
  float yobstacle1;
  float xobstacle2;
  float yobstacle2;
  float xobstacle3;
  float yobstacle3;
  float xobstacle4;
  float yobstacle4;
  //below is the constructor
  ObstacleWide() {
    smooth();
    rectMode(CENTER);
    wobstacle=height/18*5;
    hobstacle=height/18;
  }
  //below is the method for adding the obstacle to the specific level
  void addobstacle() {
    fill(100);
    rect(xobstacle1, yobstacle1, wobstacle, hobstacle);
    rect(xobstacle2, yobstacle2, wobstacle, hobstacle);
    rect(xobstacle3, yobstacle3, wobstacle, hobstacle);
    rect(xobstacle4, yobstacle4, wobstacle, hobstacle);


    if (lvl == 1) {
      xobstacle1 = height/18*10.5;
      yobstacle1 = height/18*10.5;
      xobstacle2 = height/18*6.5;
      yobstacle2 = height/18*10.5;
      xobstacle3 = width*2;
      yobstacle3 = height*2;
      xobstacle4 = width*2;
      yobstacle4 = height*2;
    }
    if (lvl == 2) {
      xobstacle1 = height/18*10.5;
      yobstacle1 = height/18*10.5;
      xobstacle2 = height/18*6.5;
      yobstacle2 = height/18*10.5;
      xobstacle3 = height/18*20.5;
      yobstacle3 = height/18*10.5;
      xobstacle4 = height/18*27.5;
      yobstacle4 = height/18*10.5;
    }
    if (lvl == 6) {
      xobstacle1 = height/18*3.5;
      yobstacle1 = height/18*5.5;
      xobstacle2 = height/18*7.5;
      yobstacle2 = height/18*9.5;
      xobstacle3 = height/18*24.5;
      yobstacle3 = height/18*14.5;
      xobstacle4 = height/18*11.5;
      yobstacle4 = height/18*7.5;
    }
    if (lvl == 4) {
      xobstacle1 = height/18*15.5;
      yobstacle1 = height/18*10.5;
      xobstacle2 = height/18*20.5;
      yobstacle2 = height/18*10.5;
      xobstacle3 = height/18*15.5;
      yobstacle3 = height/18*15.5;
      xobstacle4 = height/18*27.5;
      yobstacle4 = height/18*5.5;
    }
    if (lvl == 5) {
      xobstacle1 = height/18*7.5;
      yobstacle1 = height/18*5.5;
      xobstacle2 = height/18*16.5;
      yobstacle2 = height/18*9.5;
      xobstacle3 = height/18*21.5;
      yobstacle3 = height/18*9.5;
      xobstacle4 = width-height/18*2.5;
      yobstacle4 = height/18*11.5;
    }
    if (lvl == 3) {
      xobstacle1 = height/18*7.5;
      yobstacle1 = height/18*13.5;
      xobstacle2 = height/18*13.5;
      yobstacle2 = height/18*10.5;
      xobstacle3 = height/18*10.5;
      yobstacle3 = height/18*6.5;
      xobstacle4 = height/18*26.5;
      yobstacle4 = height/18*9.5;
    }
    if (lvl == 7) {
      xobstacle1 = height/18*2.5;
      yobstacle1 = height/18*5.5;
      xobstacle2 = height/18*14.5;
      yobstacle2 = height/18*12.5;
      xobstacle3 = height/18*20.5;
      yobstacle3 = height/18*1.5;
      xobstacle4 = height/18*27.5;
      yobstacle4 = height/18*14.5;
    }
    if (lvl == 8) {
      xobstacle1 = width*2;
      yobstacle1 = height*2;
      xobstacle2 = width*2;
      yobstacle2 = height*2;
      xobstacle3 = width*2;
      yobstacle3 = height*2;
      xobstacle4 = width*2;
      yobstacle4 = height*2;
    }
  }
}

class ObstacleLong {
  //below are the properties
  float wobl;
  float hobl;
  float xob1;
  float yob1;
  float xob2;
  float yob2;
  float xob3;
  float yob3;
  float xob4;
  float yob4;

  //below is the constructor
  ObstacleLong() {
    smooth();
    rectMode(CENTER);
    wobl=height/18;
    hobl=height/18*5;
  }
  //below is the code for adding an obstacle on the specific level
  void addobstacle() {
    fill(100);
    rect(xob1, yob1, wobl, hobl);
    rect(xob2, yob2, wobl, hobl);
    rect(xob3, yob3, wobl, hobl);
    rect(xob4, yob4, wobl, hobl);

    if (lvl == 1) {
      xob1=height/18*13.5;
      yob1=height/18*8.5;
      xob2=height/18*13.5;
      yob2=height/18*3.5;
      xob3=width*2;
      yob3=height*2;
      xob4=width*2;
      yob4=height*2;
    }
    if (lvl == 2) {
      xob1=height/18*13.5;
      yob1=height/18*8.5;
      xob2=height/18*13.5;
      yob2=height/18*3.5;
      xob3=width*2;
      yob3=height*2;
      xob4=width*2;
      yob4=height*2;
    }
    if (lvl == 6) {
      xob1=height/18*10.5;
      yob1=height/18*3.5;
      xob2=height/18*17.5;
      yob2=height/18*8.5;
      xob3=height/18*28.5;
      yob3=height/18*6.5;
      xob4=height/18*28.5;
      yob4=height/18*11.5;
    }
    if (lvl == 4) {
      xob1=height/18*7.5;
      yob1=height/18*7.5;
      xob2=height/18*7.5;
      yob2=height/18*13.5;
      xob3=height/18*22.5;
      yob3=height/18*6.5;
      xob4=height/18*27.5;
      yob4=height-height/18*3.5;
    }
    if (lvl == 3) {
      xob1=height/18*19.5;
      yob1=height/18*3.5;
      xob2=height/18*19.5;
      yob2=height/18*9.5;
      xob3=height/18*19.5;
      yob3=height/18*14.5;
      xob4=width-height/18*4.5;
      yob4=height-height/18*2.5;
    }
    if (lvl == 5) {
      xob1=height/18*7.5;
      yob1=height/18*12.5;
      xob2=height/18*24.5;
      yob2=height/18*3.5;
      xob3=height/18*20.5;
      yob3=height/18*13.5;
      xob4=width-height/18*4.5;
      yob4=height-height/18*1.5;
    }
    if (lvl == 7) {
      xob1=height/18*23.5;
      yob1=height/18*4.5;
      xob2=height/18*11.5;
      yob2=height/18*9.5;
      xob3=height/18*3.5;
      yob3=height/18*4.5;
      xob4=height/18*22.5;
      yob4=height/18*15.5;
    }
    if (lvl == 8) {
      xob1=width*2;
      yob1=height*2;
      xob2=width*2;
      yob2=height*2;
      xob3=width*2;
      yob3=height*2;
      xob4=width*2;
      yob4=height*2;
    }
  }
}

class Redball {
  //below are the properties
  PImage redface;
  float i;
  float j;
  float i2;
  float j2;
  float imove;
  float jmove;
  float imove2;
  float jmove2;
  int radiusE;
  int radiusE2;
  //below is the constructor
  /* @pjs preload="libs/happyfacesred.png";*/
  Redball() {
    smooth();
    imove = 0;
    jmove = 6;
    imove2 = 6;
    jmove2 = 0;
    radiusE = height/18;
    radiusE2 = height/18;
    redface = loadImage("http://davidhartsough.com/happyballs/libs/happyfacesred.png");
  }
  //below is the method for displaing the red ball and allowing it to bounce
  void displayE() {
    noStroke();
    fill(255, 0, 0);
    ellipse(i, j, radiusE, radiusE);
    ellipse(i2, j2, radiusE2, radiusE2);
    i2=i2+imove2;
    j2=j2+jmove2;
    i=i+imove;
    j=j+jmove;
    if (i > width-radiusE/2) {
      imove=-imove;
    }
    if (i < radiusE/2) {
      imove=-imove;
    }
    if (j < height/18+radiusE/2) {
      jmove=-jmove;
    }
    if (j > height-radiusE/2) {
      jmove=-jmove;
    }
    if (i2 > width-radiusE2/2) {
      imove2=-imove2;
    }
    if (i2 < radiusE2/2) {
      imove2=-imove2;
    }
    if (j2 < height/18+radiusE2/2) {
      jmove2=-jmove2;
    }
    if (j2 > height-radiusE2/2) {
      jmove2=-jmove2;
    }

    image(redface, i, j, height/18, height/18);
    image(redface, i2, j2, height/18, height/18);

    if ((j > obstaclewide.yobstacle1-obstaclewide.hobstacle/2-radiusE/2-5) && (i > obstaclewide.xobstacle1-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle1+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclewide.yobstacle1+obstaclewide.hobstacle/2+radiusE/2+5) && (i > obstaclewide.xobstacle1-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle1+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclewide.xobstacle1-obstaclewide.wobstacle/2-radiusE/2-5) && (j > obstaclewide.yobstacle1-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle1+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((i > obstaclewide.xobstacle1+obstaclewide.wobstacle/2+radiusE/2+5) && (j > obstaclewide.yobstacle1-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle1+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((j > obstaclelong.yob1-obstaclelong.hobl/2-radiusE/2-5) && (i > obstaclelong.xob1-obstaclelong.wobl/2) && (i < obstaclelong.xob1+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclelong.yob1+obstaclelong.hobl/2+radiusE/2+5) && (i > obstaclelong.xob1-obstaclelong.wobl/2) && (i < obstaclelong.xob1+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclelong.xob1-obstaclelong.wobl/2-radiusE/2-5) && (j > obstaclelong.yob1-obstaclelong.hobl/2) && (j < obstaclelong.yob1+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((i > obstaclelong.xob1+obstaclelong.wobl/2+radiusE/2+5) && (j > obstaclelong.yob1-obstaclelong.hobl/2) && (j < obstaclelong.yob1+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((j > obstaclewide.yobstacle2-obstaclewide.hobstacle/2-radiusE/2-5) && (i > obstaclewide.xobstacle2-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle2+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclewide.yobstacle2+obstaclewide.hobstacle/2+radiusE/2+5) && (i > obstaclewide.xobstacle2-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle2+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclewide.xobstacle2-obstaclewide.wobstacle/2-radiusE/2-5) && (j > obstaclewide.yobstacle2-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle2+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((i > obstaclewide.xobstacle2+obstaclewide.wobstacle/2+radiusE/2+5) && (j > obstaclewide.yobstacle2-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle2+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((j > obstaclelong.yob2-obstaclelong.hobl/2-radiusE/2-5) && (i > obstaclelong.xob2-obstaclelong.wobl/2) && (i < obstaclelong.xob2+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclelong.yob2+obstaclelong.hobl/2+radiusE/2+5) && (i > obstaclelong.xob2-obstaclelong.wobl/2) && (i < obstaclelong.xob2+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclelong.xob2-obstaclelong.wobl/2-radiusE/2-5) && (j > obstaclelong.yob2-obstaclelong.hobl/2) && (j < obstaclelong.yob2+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((i > obstaclelong.xob2+obstaclelong.wobl/2+radiusE/2+5) && (j > obstaclelong.yob2-obstaclelong.hobl/2) && (j < obstaclelong.yob2+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((j > obstaclewide.yobstacle3-obstaclewide.hobstacle/2-radiusE/2-5) && (i > obstaclewide.xobstacle3-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle3+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclewide.yobstacle3+obstaclewide.hobstacle/2+radiusE/2+5) && (i > obstaclewide.xobstacle3-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle3+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclewide.xobstacle3-obstaclewide.wobstacle/2-radiusE/2-5) && (j > obstaclewide.yobstacle3-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle3+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((i > obstaclewide.xobstacle3+obstaclewide.wobstacle/2+radiusE/2+5) && (j > obstaclewide.yobstacle3-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle3+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((j > obstaclelong.yob3-obstaclelong.hobl/2-radiusE/2-5) && (i > obstaclelong.xob3-obstaclelong.wobl/2) && (i < obstaclelong.xob3+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclelong.yob3+obstaclelong.hobl/2+radiusE/2+5) && (i > obstaclelong.xob3-obstaclelong.wobl/2) && (i < obstaclelong.xob3+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclelong.xob3-obstaclelong.wobl/2-radiusE/2-5) && (j > obstaclelong.yob3-obstaclelong.hobl/2) && (j < obstaclelong.yob3+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((i > obstaclelong.xob3+obstaclelong.wobl/2+radiusE/2+5) && (j > obstaclelong.yob3-obstaclelong.hobl/2) && (j < obstaclelong.yob3+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((j > obstaclewide.yobstacle4-obstaclewide.hobstacle/2-radiusE/2-5) && (i > obstaclewide.xobstacle4-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle4+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclewide.yobstacle4+obstaclewide.hobstacle/2+radiusE/2+5) && (i > obstaclewide.xobstacle4-obstaclewide.wobstacle/2) && (i < obstaclewide.xobstacle4+obstaclewide.wobstacle/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclewide.xobstacle4-obstaclewide.wobstacle/2-radiusE/2-5) && (j > obstaclewide.yobstacle4-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle4+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((i > obstaclewide.xobstacle4+obstaclewide.wobstacle/2+radiusE/2+5) && (j > obstaclewide.yobstacle4-obstaclewide.hobstacle/2) && (j < obstaclewide.yobstacle4+obstaclewide.hobstacle/2)) {
      imove=-imove;
    }
    if ((j > obstaclelong.yob4-obstaclelong.hobl/2-radiusE/2-5) && (i > obstaclelong.xob4-obstaclelong.wobl/2) && (i < obstaclelong.xob4+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((j > obstaclelong.yob4+obstaclelong.hobl/2+radiusE/2+5) && (i > obstaclelong.xob4-obstaclelong.wobl/2) && (i < obstaclelong.xob4+obstaclelong.wobl/2)) {
      jmove=-jmove;
    }
    if ((i > obstaclelong.xob4-obstaclelong.wobl/2-radiusE/2-5) && (j > obstaclelong.yob4-obstaclelong.hobl/2) && (j < obstaclelong.yob4+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((i > obstaclelong.xob4+obstaclelong.wobl/2+radiusE/2+5) && (j > obstaclelong.yob4-obstaclelong.hobl/2) && (j < obstaclelong.yob4+obstaclelong.hobl/2)) {
      imove=-imove;
    }
    if ((j2> obstaclewide.yobstacle1-obstaclewide.hobstacle/2-radiusE/2-5) && (i2> obstaclewide.xobstacle1-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle1+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclewide.yobstacle1+obstaclewide.hobstacle/2+radiusE/2+5) && (i2> obstaclewide.xobstacle1-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle1+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclewide.xobstacle1-obstaclewide.wobstacle/2-radiusE/2-5) && (j2> obstaclewide.yobstacle1-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle1+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclewide.xobstacle1+obstaclewide.wobstacle/2+radiusE/2+5) && (j2> obstaclewide.yobstacle1-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle1+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((j2> obstaclelong.yob1-obstaclelong.hobl/2-radiusE/2-5) && (i2> obstaclelong.xob1-obstaclelong.wobl/2) && (i2< obstaclelong.xob1+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclelong.yob1+obstaclelong.hobl/2+radiusE/2+5) && (i2> obstaclelong.xob1-obstaclelong.wobl/2) && (i2< obstaclelong.xob1+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclelong.xob1-obstaclelong.wobl/2-radiusE/2-5) && (j2> obstaclelong.yob1-obstaclelong.hobl/2) && (j2< obstaclelong.yob1+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclelong.xob1+obstaclelong.wobl/2+radiusE/2+5) && (j2> obstaclelong.yob1-obstaclelong.hobl/2) && (j2< obstaclelong.yob1+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }
    if ((j2> obstaclewide.yobstacle2-obstaclewide.hobstacle/2-radiusE/2-5) && (i2> obstaclewide.xobstacle2-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle2+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclewide.yobstacle2+obstaclewide.hobstacle/2+radiusE/2+5) && (i2> obstaclewide.xobstacle2-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle2+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclewide.xobstacle2-obstaclewide.wobstacle/2-radiusE/2-5) && (j2> obstaclewide.yobstacle2-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle2+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclewide.xobstacle2+obstaclewide.wobstacle/2+radiusE/2+5) && (j2> obstaclewide.yobstacle2-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle2+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((j2> obstaclelong.yob2-obstaclelong.hobl/2-radiusE/2-5) && (i2> obstaclelong.xob2-obstaclelong.wobl/2) && (i2< obstaclelong.xob2+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclelong.yob2+obstaclelong.hobl/2+radiusE/2+5) && (i2> obstaclelong.xob2-obstaclelong.wobl/2) && (i2< obstaclelong.xob2+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclelong.xob2-obstaclelong.wobl/2-radiusE/2-5) && (j2> obstaclelong.yob2-obstaclelong.hobl/2) && (j2< obstaclelong.yob2+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclelong.xob2+obstaclelong.wobl/2+radiusE/2+5) && (j2> obstaclelong.yob2-obstaclelong.hobl/2) && (j2< obstaclelong.yob2+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }
    if ((j2> obstaclewide.yobstacle3-obstaclewide.hobstacle/2-radiusE/2-5) && (i2> obstaclewide.xobstacle3-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle3+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclewide.yobstacle3+obstaclewide.hobstacle/2+radiusE/2+5) && (i2> obstaclewide.xobstacle3-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle3+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclewide.xobstacle3-obstaclewide.wobstacle/2-radiusE/2-5) && (j2> obstaclewide.yobstacle3-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle3+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclewide.xobstacle3+obstaclewide.wobstacle/2+radiusE/2+5) && (j2> obstaclewide.yobstacle3-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle3+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((j2> obstaclelong.yob3-obstaclelong.hobl/2-radiusE/2-5) && (i2> obstaclelong.xob3-obstaclelong.wobl/2) && (i2< obstaclelong.xob3+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclelong.yob3+obstaclelong.hobl/2+radiusE/2+5) && (i2> obstaclelong.xob3-obstaclelong.wobl/2) && (i2< obstaclelong.xob3+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclelong.xob3-obstaclelong.wobl/2-radiusE/2-5) && (j2> obstaclelong.yob3-obstaclelong.hobl/2) && (j2< obstaclelong.yob3+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclelong.xob3+obstaclelong.wobl/2+radiusE/2+5) && (j2> obstaclelong.yob3-obstaclelong.hobl/2) && (j2< obstaclelong.yob3+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }

    if ((j2> obstaclewide.yobstacle4-obstaclewide.hobstacle/2-radiusE/2-5) && (i2> obstaclewide.xobstacle4-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle4+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclewide.yobstacle4+obstaclewide.hobstacle/2+radiusE/2+5) && (i2> obstaclewide.xobstacle4-obstaclewide.wobstacle/2) && (i2< obstaclewide.xobstacle4+obstaclewide.wobstacle/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclewide.xobstacle4-obstaclewide.wobstacle/2-radiusE/2-5) && (j2> obstaclewide.yobstacle4-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle4+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclewide.xobstacle4+obstaclewide.wobstacle/2+radiusE/2+5) && (j2> obstaclewide.yobstacle4-obstaclewide.hobstacle/2) && (j2< obstaclewide.yobstacle4+obstaclewide.hobstacle/2)) {
      imove2=-imove2;
    }
    if ((j2> obstaclelong.yob4-obstaclelong.hobl/2-radiusE/2-5) && (i2> obstaclelong.xob4-obstaclelong.wobl/2) && (i2< obstaclelong.xob4+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((j2> obstaclelong.yob4+obstaclelong.hobl/2+radiusE/2+5) && (i2> obstaclelong.xob4-obstaclelong.wobl/2) && (i2< obstaclelong.xob4+obstaclelong.wobl/2)) {
      jmove2=-jmove2;
    }
    if ((i2> obstaclelong.xob4-obstaclelong.wobl/2-radiusE/2-5) && (j2> obstaclelong.yob4-obstaclelong.hobl/2) && (j2< obstaclelong.yob4+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }
    if ((i2> obstaclelong.xob4+obstaclelong.wobl/2+radiusE/2+5) && (j2> obstaclelong.yob4-obstaclelong.hobl/2) && (j2< obstaclelong.yob4+obstaclelong.hobl/2)) {
      imove2=-imove2;
    }
  }
}

class Startscreen {
  //below are the properties
  PImage facered;
  PImage faceblue;
  PImage facegreen;
  PFont title;
  float redballx;
  float redmovex;
  float radiusred;
  float blueballx;
  float bluebally;
  float radiusblue;
  float bluemovex;
  float bluemovey;
  int s;
  PImage ssup;
  PImage ssdown;
  PImage ssright;
  PImage ssleft;
  //below is the constructor
  /* @pjs preload="http://davidhartsough.com/happyballs/libs/ssup.png,http://davidhartsough.com/happyballs/libs/ssdown.png,http://davidhartsough.com/happyballs/libs/ssright.png,http://davidhartsough.com/happyballs/libs/ssleft.png,http://davidhartsough.com/happyballs/libs/happyfaces.png,http://davidhartsough.com/happyballs/libs/happyfacesred.png,http://davidhartsough.com/happyballs/libs/happyfacesblue.png";*/
  Startscreen() {
    smooth();
    title = createFont("Arial", 125);
    redballx = width/2;
    redmovex = 8;
    radiusred = height/18;
    radiusblue = height/18;
    blueballx = width/2-100;
    bluebally = height-height/4;
    bluemovex = 0;
    bluemovey = 6;
    ssup = loadImage("http://davidhartsough.com/happyballs/libs/ssup.png");
    ssdown = loadImage("http://davidhartsough.com/happyballs/libs/ssdown.png");
    ssright = loadImage("http://davidhartsough.com/happyballs/libs/ssright.png");
    ssleft = loadImage("http://davidhartsough.com/happyballs/libs/ssleft.png");
    facegreen = loadImage("http://davidhartsough.com/happyballs/libs/happyfaces.png");
    facered = loadImage("http://davidhartsough.com/happyballs/libs/happyfacesred.png");
    faceblue = loadImage("http://davidhartsough.com/happyballs/libs/happyfaceblue.png");
    s = second();
  }

  //below is the method for the title screen
  void titlescreen() {

    smooth();
    fill(100);
    textFont(title);
    textAlign(CENTER, CENTER);
    text("HAPPY BALLS", width/2, height/4);
    fill(255, 0, 0);
    noStroke();
    ellipse(redballx, height/4+12, radiusred, radiusred);
    image(facered, redballx, height/4+12, height/18, height/18);
    redballx = redballx + redmovex;
    if (redballx > width-radiusred/2) {
      redmovex=-redmovex;
    }
    if (redballx < radiusred/2) {
      redmovex=-redmovex;
    }
    image(ssup, width/2+100, height-height/4+100, height/18, height/18);
    image(ssdown, width/2-100, height-height/4-100, height/18, height/18);
    image(ssright, width/2-100, height-height/4+100, height/18, height/18);
    image(ssleft, width/2+100, height-height/4-100, height/18, height/18);
    fill(0, 255, 0);
    ellipse(width/2, height-height/4, height/18, height/18);
    image(facegreen, width/2, height-height/4, height/18, height/18);
    fill(0, 0, 255);
    ellipse(blueballx, bluebally, radiusblue, radiusblue);
    image(faceblue, blueballx, bluebally, height/18, height/18);
    blueballx=blueballx+bluemovex;
    bluebally=bluebally+bluemovey;
    if (dist(blueballx, bluebally, width/2-100, height-height/4+100) < 3) {
      bluemovex=6;
      bluemovey=0;
    }
    if (dist(blueballx, bluebally, width/2+100, height-height/4+100) < 3) {
      bluemovex=0;
      bluemovey=-6;
    }
    if (dist(blueballx, bluebally, width/2+100, height-height/4-100) < 3) {
      bluemovex=-6;
      bluemovey=0;
    }
    if (dist(blueballx, bluebally, width/2-100, height-height/4-100) < 3) {
      bluemovex=0;
      bluemovey=6;
    }
    if ((dist(mouseX, mouseY, width/2, height-height/4) < height/18) && (mousePressed == true)) {
      state = 2;
      happyballs.trigger();
    }
  }
}




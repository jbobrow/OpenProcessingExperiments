

//PHOTOGRAPHY by JUSTIN SALEHI & NICK CROCKETT (photos used with permission)
//MUSIC by MASSIVE ATTACK
//IMAGE & AUDIO EDITING by NICK CROCKETT

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int timer; //actual second count
int endFrame= 6000; //total length of movie (frames)
float frame=0; //current frame of movie
float pComplete; //percent through movie (for calculating probabilities)
String scene;
String newScene;
String mode;
int sceneFrame;
Boolean sceneStart;

//=====audio=====
Minim minim;
AudioPlayer player;

PFont OCR;

PImage A1;
PImage A2;
PImage A2_2;
PImage A3;
PImage A4;
PImage A4_2;
PImage A5;
PImage A5_2;
PImage B1;
PImage B1_2;
PImage B2;
PImage B2_2;
PImage B3;
PImage C1;
PImage C2;
PImage C3;
PImage Men;
PImage Men2;
PImage flare;
PImage flare_garage;
PImage currentImage;
PImage nextImage;

PShape Man;

float x;
float y;
float speed;

int timerOffset;

void setup() {
  size(600,600);
  //size(600, 600, OPENGL);
  
  OCR = loadFont("OCRAExtended-12.vlw");
  textFont(OCR);
  background(0);
  noSmooth();
  //load images
  A1=loadImage("A-1.jpg");
  A2=loadImage("A-2.jpg");
  A2_2=loadImage("A-2-2.jpg");
  A3=loadImage("A-3.jpg");
  A4=loadImage("A-4.jpg");
  A4_2=loadImage("A-4-2.jpg");
  A5=loadImage("A-5.jpg");
  A5_2=loadImage("A-5-2.jpg");
  B1=loadImage("B-1.jpg");
  B1_2=loadImage("B-1-2.jpg");
  B2=loadImage("B-2.jpg");
  B2_2=loadImage("B-2-2.jpg");
  B3=loadImage("B-3.jpg");
  C1=loadImage("C-1.jpg");
  C2=loadImage("C-2.jpg");
  C3=loadImage("C-3.jpg");
  Men = loadImage("men.jpg");
  Men2 = loadImage("men2.png");
  Man = loadShape("Man.svg");
  flare = loadImage("flare.jpg");
  flare_garage = loadImage("flare_garage.jpg");

  //load music
  minim = new Minim(this);
  player = minim.loadFile("Fatalism_Short.mp3");
  player.play();
  //set up opening scene
  mode = "A";
  scene = "A1";
  currentImage = A1;
  sceneFrame = 300;
  sceneStart=true;
  timerOffset=millis();
}

void draw() {
  timer = (millis()-timerOffset)/1000;

  background(0);
  noSmooth();
  if (scene == "A1") {
    a1();
  }
  if (scene == "A2") {
    a2();
  }
  if (scene == "A3") {
    a3();
  }
  if (scene == "A4") {
    a4();
  }
  if (scene == "A5") {
    a5();
  }
  if (scene == "B1") {
    b1();
  }
  if (scene == "B2") {
    b2();
  }
  if (scene == "B3") {
    b3();
  }
  if (scene == "C1") {
    c1();
  }
  if (scene == "C2") {
    c2();
  }
  if (scene == "C3") {
    c3();
  }



  frame++;
  if (timer>98&& timer<=102) {
    c3();
  }
  if (timer>99) {
    fill(255);
    scene="end";
  }

  if (timer==3) {
    smooth();
    pushMatrix();
    shapeMode(CENTER);
    translate(width/2, height/2);
    scale(1+random(0, 1));
    shape(Man, 0, 0);
    popMatrix();
  }
  if (timer>=18&&timer<=22) {
    smooth();
    pushMatrix();
    shapeMode(CENTER);

    scale(2+random(0, 2));
    translate(width/2, height/2);
    shape(Man, 0, 0);
    popMatrix();
  }
if(timer==29){
   smooth();
   shapeMode(CORNER);
    shape(Man, width/2, height/2,500,500);
}
  if (timer>52&&timer<70) {
    if (timer==55) {
      imageMode(CORNER);
      currentImage=Men;
      x=0;
      y=0;
      speed=1;
    }
    fill(255);
    if (timer>56&&timer<63) {
      noTint();

      x-=speed;
      image(currentImage, x, 0);
    }
    if (timer==63) { 
      currentImage=C2;
      speed=.5;
    }
    if (timer>=63) {

      y-=speed;
      image(currentImage, -100, y);
    }

    scene="middle1";
  }
  if (timer==69) {
    x=0;
  }
  if (timer>=70 && x >= -1001 && timer<=78) {
    fill(255);
    textSize(16);
    noTint();
    //println(x);
    x-=2;
    image(Men2, x, 0);
    scene="middle1";
    if (x < -1000) {
      scene="C3";
    }
  }
  if (timer>106) {
    fill(255);
    textSize(10);
    noSmooth();
    text("project 2: expanded cinema", 10, height-45);
    text("photography - nick crockett and justin salehi (used with permission)", 10, height-30);
    text("music - massive attack | fatalism (ryuichi sakamoto & yukihiro takahashi remix)", 10, height-15);
  }
}

void chooseScene() {
  pComplete=map(frame, 0, endFrame, 0, 1); //calculate percent of movie complete 
  float aProb = (pComplete-1)*(pComplete-1); //calculate probability of group A
  float cProb = pComplete*pComplete; //calculate probability of group B
  float bProb=1-aProb-cProb; //calculate probability of group C

  float modeSelect = random(0, 1);
  if (modeSelect<=aProb) {
    chooseA();
  } 
  else if (modeSelect>aProb+bProb) {
    chooseC();
  } 
  else {
    chooseB();
  }
}

void chooseA() {
  int i = int(random(5));
  switch(i) {
  case 0:
    newScene = "A1";
    nextImage = A1;
    break;
  case 1:
    newScene = "A2";
    nextImage = A2;
    break;
  case 2:
    newScene = "A3";
    nextImage = A3;
    break;
  case 3:
    newScene = "A4";
    nextImage = A4_2;
    break;
  case 4:
    newScene = "A5";
    nextImage = A5_2;
  }
}

void chooseB() {
  int i = int(random(3));
  switch(i) {
  case 0:
    newScene = "B1";
    nextImage = B1;
    break;
  case 1:
    newScene = "B2";
    nextImage = B2;
    break;
  case 2:
    newScene = "B3";
    nextImage = B3;
    break;
  }
}

void chooseC() {
  int i = int(random(3));
  switch(i) {
  case 0:
    newScene = "C1";
    nextImage = C1;
    break;
  case 1:
    newScene = "C2";
    nextImage = C2;
    break;
  case 2:
    newScene = "C3";
    nextImage = C3;
    break;
  }
}

void startNewScene() {
  if (sceneFrame<0) {
    imageMode(CORNER);
    noSmooth();
    scene = newScene;
    sceneStart=true;
    //println(scene);
    sceneFrame = 100+int(random(200));
  }
}

void stop()
{
  player.close();
  minim.stop();
  super.stop();
}



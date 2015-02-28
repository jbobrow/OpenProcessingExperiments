
import krister.Ess.*;
import processing.opengl.*;

PImage ensotitle;
PImage mainback;
PImage seal;
PImage instructions;

AudioChannel backgroundmusic;
AudioChannel ensointro;
AudioChannel yesSeal;
AudioChannel savegong;
AudioChannel newpagegong;
AudioChannel brush0;
AudioChannel brush1;
AudioChannel brush2;
AudioChannel brush3;
AudioChannel brush4;
AudioChannel brush5;

float newX;
float easing = 0.05;
float x;
float y;
float px;
float py;

float opac = 30;

int brushtips = 2800;
int cycleBrush = brushtips;
int brushsize = 5;

int moveMult = 7;
boolean increase = true;
boolean decrease = true;

float minmove = -20;
float maxmove = 20;

float minopac = -20;
float maxopac = 20;

float minWC = -5;
float maxWC = 5;

float actualWeight;
float weightdivider = 10;

float moveRatio;
float actualMoveX;
float actualMoveY;
float fillon = 0;
float realOpac;

float tintopac = 255;
float clearscreen = 0;
float runprogram = 0;
boolean instructON = false;
float saveEnso = 0;
float makeSeal = 0;

float[] moveX = new float[brushtips];
float[] moveY = new float[brushtips];
float[] opacChange = new float[brushtips];
float[] weightChange = new float[brushtips];
float[] brushPX = new float[brushtips];
float[] brushPY = new float[brushtips];

void setup() {

  size(1800, 1000, OPENGL);

  Ess.start(this);

  SoundandMusic();
  loadPictures();

  fill(0);
  smooth();
  stroke(0);
  frameRate(120);
  for(int i = 0; i < brushtips; i++) {
    moveX[i] = random(minmove, maxmove);
    moveY[i] = random(minmove, maxmove);
    opacChange[i] = random(minopac, maxopac);
    weightChange[i] = random(minWC, maxWC);
  }
  println(moveX);
}


void draw() {
  if(runprogram == 0) {
    fill(255, tintopac);
    image(ensotitle, 0, 0);
    rect(0, 0, 1800, 1000);
    tintopac-= 1;
  }
  if(instructON) {
    image(instructions, 0, 0);
  }
  
  if(saveEnso == 1) {
    saveFrame("SavedEnso-###.tif");
    savegong.play();
    saveEnso = -1;
  }
  if(clearscreen == 1) {
    //background(255);
    image(mainback, 0, 0);
    newpagegong.play();
  }
  if(makeSeal == 1) {
    image(seal, (width-250), (height-250));
    yesSeal.play();
    makeSeal = 0;
  }
 
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight);
  if(frameCount > 2) {
    stroke(0, opac*fillon);
    line(x, y, px, py);
    for(int b = 0; b < cycleBrush; b++) {

      realOpac = opac + opacChange[b];
      stroke(0, realOpac*fillon);

      actualWeight = (weight + weightChange[b])/weightdivider;
      strokeWeight(actualWeight);

      moveRatio = map(actualWeight, 0, 5, 0, 1);
      actualMoveX = (moveX[b]*moveMult)*moveRatio;
      actualMoveY = (moveY[b]*moveMult)*moveRatio;

      line(x + actualMoveX, y + actualMoveY, brushPX[b], brushPY[b]);

      brushPX[b] = x + actualMoveX;
      brushPY[b] = y + actualMoveY;
    }
  }
  py = y;
  px = x;
}


void mousePressed() {
  fillon = 1;
}

void mouseReleased() {
  fillon = 0;
}

void keyPressed() {
  if(key == ' '){
    runprogram = 1;
    instructON = false;
    clearscreen = 1;
  }
  if(key == 's'){
    saveEnso = 1;
  }
  if(key == 'a'){
    makeSeal = 1;
  }
  if(key == '-'){
    brushsize-=1;
    if(brushsize<=0) {
      brushsize=0;
    }
    brushSwitch();
  }
  if(key == '='){
    brushsize+=1;
    if(brushsize>=5){
      brushsize=5;
    }
    brushSwitch();
  }
  if(key == 'i'){
    instructON = true;
  }
}

void keyReleased() {
  if(key == ' '){
    clearscreen = 0;
  }
}
  
void brushSwitch() {
  switch(brushsize) {
  case 0:
    cycleBrush = 300;
    moveMult = 1;
    brush0.play();
    break;
  case 1:
    cycleBrush = 500;
    moveMult = 2;
    brush1.play();
    break;
  case 2:
    cycleBrush = 700;
    moveMult = 3;
    brush2.play();
    break;
  case 3:
    cycleBrush = 900;
    moveMult = 4;
    brush3.play();
    break;
  case 4:
    cycleBrush = 1200;
    moveMult = 5;
    brush4.play();
    break;
  case 5:
    cycleBrush = 2800;
    moveMult = 7;
    brush5.play();
    break;
  }
}

void SoundandMusic() {
  backgroundmusic= new AudioChannel("ambientmono.wav");
  ensointro = new AudioChannel("ensointro2.wav");
  yesSeal = new AudioChannel("Yes.wav");
  savegong = new AudioChannel("savegong.wav");
  newpagegong = new AudioChannel("newpagegongmono.wav");
  brush0 = new AudioChannel("brush0.wav");
  brush1 = new AudioChannel("brush1.wav");
  brush2 = new AudioChannel("brush2.wav");
  brush3 = new AudioChannel("brush3.wav");
  brush4 = new AudioChannel("brush4.wav");
  brush5 = new AudioChannel("brush5.wav");
  ensointro.play();
  backgroundmusic.play(Ess.FOREVER);
}

void loadPictures() {
  ensotitle = loadImage("EnsoTitle3KM.jpg");
  mainback = loadImage("MainBG.jpg");
  seal = loadImage("newseal1.jpg");
  instructions = loadImage("instructionsKM.jpg");
}

public void stop() {
  Ess.stop();
  super.stop();
}




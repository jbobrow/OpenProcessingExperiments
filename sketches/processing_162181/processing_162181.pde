
import ddf.minim.*;

Minim myMinim;
AudioPlayer chaChing;

PImage hundred;
PImage hundred2;
PImage hundred3;
int butX = 200;
int butY = 200;
int butW = 150;
int butH = 150;
int x, y, posX, posY, posY2;
boolean moneyOn = false;

/* @pjs preload="hundred.png"; */  
/* @pjs preload="hundred2.png"; */  
/* @pjs preload="hundred3.png"; */ 
//Assignment 4: Button Activation by Vincent Ong

void setup() {
  size(400,400);
  fill(0,220,0);
  noStroke();
  smooth();
  //myMinim = new Minim(this);
  //chaChing = myMinim.loadFile("Cash.wav");
  hundred = loadImage("hundred.png");
  hundred2 = loadImage("hundred2.png");
  hundred3 = loadImage("hundred3.png");
}

void draw() {
  if (moneyOn) {
    background(200);
    moneyMaker();
    textSize(100);
    text("$$$",115,380);
  } else {
    background(200);
     x = 0;
     posY = 0;
     posY2 = 0;
  }
  ellipse(butX,butY,butW,butH);
}

void mousePressed() {
  if (mouseX > 100 && mouseX < 300 && mouseY > 100 && mouseY < 300) {
    moneyOn = !moneyOn;
    fill(0,255,0);
    chaChing.rewind();
    chaChing.play();
  }
}

void mouseReleased() {
  fill(0,220,0);
}

void moneyMaker(){
  if ( x < 50){
    image (hundred,1,posY, 80, 34);
    image (hundred,70,posY2, 80, 34);
    image (hundred,140,posY, 80, 34);
    image (hundred,210,posY2, 80, 34);
    image (hundred,280,posY, 80, 34);
    image (hundred,350,posY2, 80, 34);
    image (hundred2,1,posY2, 100, 81);
    image (hundred2,70,posY, 100, 81);
    image (hundred2,140,posY2, 100, 81);
    image (hundred2,210,posY, 100, 81);
    image (hundred2,280,posY2, 100, 81);
    image (hundred2,350,posY, 100, 81);
    image (hundred3,10,posY-80, 100, 81);
    image (hundred3,100,posY2-80, 100, 81);
    image (hundred3,200,posY-80, 100, 81);
    image (hundred3,270,posY2-80, 100, 81);
    image (hundred3,320,posY-80, 100, 81);
    image (hundred3,400,posY2-80, 100, 81);
    posY+=2;
    posY2+=3;
  }
}



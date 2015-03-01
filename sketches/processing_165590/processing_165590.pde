
/*Homework 6
 by Leiah Fournier */

//BIG thanks to Anthony for the original code!
// And another BIG thanks to Laurenz and Danny for helping work on the code!
Creature mask = new Creature();
CreatureFans [] fairy = new CreatureFans [200];

//Thanks to Processing.org!
import ddf.minim.*;
AudioPlayer player;
Minim minim;

boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;

float d;

void setup () {
  smooth();
  size (800, 800);

  minim = new Minim(this);
  player = minim.loadFile("http://hiddentriforce.com/zelda-original-soundtracks/Ocarina-of-Time-3D/Soundtrack/22-Great-Fairys-Fountain.mp3", 2048);
  player.play();

  mask = new Creature();
  mask.prime();

  for (int i = 0; i<200; i++) { 
    fairy[i] = new CreatureFans();
    fairy[i].prime();
  }
}

void draw () {
  background(255);
  mask.update();

  //Fairies Data
  for (int f = 0; f<200; f++) {
    d = dist(mask.xPos, mask.yPos, fairy[f].xPos, fairy[f].yPos);
    fairy[f].update();
  }

  for (int k=0; k<200; k++) {
    for (int m=1; m<200-1; m++) {
      if (dist(fairy[k].xPos, 0, fairy[m].xPos, 0) < (fairy[k].sizing)/2
        ||
        dist(fairy[k].yPos, 0, fairy[m].yPos, 0) < (fairy[k].sizing)/2 ) {
      }
    }
  }
}

void keyPressed() {
  if (keyCode == 'W') {
    upPressed=true;
  }

  if (keyCode== 'S') {
    downPressed=true;
  }
  if (keyCode=='A') {
    leftPressed=true;
  }
  if (keyCode=='D') {
    rightPressed=true;
  }
}

void keyReleased() {
  if (keyCode == 'W') {
    upPressed=false;
  }

  if (keyCode== 'S') {
    downPressed=false;
  }
  if (keyCode=='A') {
    leftPressed=false;
  }
  if (keyCode=='D') {
    rightPressed=false;
  }
}
class CreatureFans {

  PImage fairy;

  float sizing;
  float xPos;
  float yPos;
  float fanSpeed;
  
  float lerp = .01;
  float d;

  void prime() {
    xPos = random(sizing*50, width-sizing*50);
    yPos = random (sizing*50, height-sizing*50);
    sizing = 1;
    fanSpeed = 5;

    fairy = loadImage("fairy.png");
  }

  void update () {
    image(fairy, xPos, yPos, 50, 50);

 
      fanSpeed=5;
      xPos=lerp(xPos, mask.xPos, lerp);
      yPos=lerp(yPos, mask.yPos, lerp);
    }
  }
  class Creature {

  PImage mask;

  float sizing;
  float xPos;
  float yPos;
  float Playerspeed;

  void prime() {
    imageMode(CENTER);
    xPos = width/2;
    yPos = height/2;
    sizing = 1;
    Playerspeed = 5;

    mask = loadImage("mask.png");
  }

  void update () {
    image(mask, xPos, yPos);

    //MOVEMENT
    if (upPressed==true) {


      yPos-=Playerspeed;
    }
    if (downPressed==true) {
      yPos+=Playerspeed;
    }
    if (leftPressed==true) {
      xPos-=Playerspeed;
    }
    if (rightPressed==true) {
      xPos+=Playerspeed;
    }
  }
}


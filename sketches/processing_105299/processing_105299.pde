
import ddf.minim.*;
Minim minim;
AudioPlayer meow;
AudioPlayer groan;
AudioPlayer plonk;
// this is the code for emiles bum game... 

PImage[] bumFrame = new PImage[24];
PImage[] catFrame = new PImage[16];
PImage[] pooFrame = new PImage[10];
poo[] Poo = new poo[100];
bubbles[] Bubbles = new bubbles[10];
fish[] Fish = new fish[10];

PImage[] bubbleFrame = new PImage[6];
PImage[] waves = new PImage[3];
PImage[] fishFrame = new PImage[10];

PImage poop;
long gameFrame, lastMillis, lastCat, lastBubble, lastFish;
int frameTime = 50; //20 fps
int bumX, bumY, bumDir;
int catX, catY, catDir;
boolean bumTurn,moveLeft, moveRight;
int turnFrame, turnStop, pooNum;
int score;
int bubbleThreshold,bubbleNum;
int fishThreshold, fishNum;
float manAngle;

void setup() {
  size(1200, 800);
  background(0);
  loadImages();
  bumX = width/2;
  bumY = 100;
  catX = width/2;
  catY = height-130;
  pooNum = 0;
  
  //AUDIO SETUP
  minim = new Minim(this);
  meow = minim.loadFile("/SOUNDS/meow.wav", 2048);
  groan = minim.loadFile("/SOUNDS/groans.wav", 2048);
  plonk = minim.loadFile("/SOUNDS/plonk.wav", 2048);
  
  //Make Poos
  for(int i =0 ; i < 100; i++){
Poo[i] = new poo(00,height,i,gameFrame);
  }
  //make Bubbles & fish
  for(int i =0 ; i < 10; i++){
Bubbles[i] = new bubbles(0,0,i,0);
Fish[i] = new fish(0,0,i,0);
  }
  bubbleThreshold = 5000;
}

void draw() {
  background(0);
  counters();
  theBum();
  theCat();
  
  theFish();
  theBubbles();
  waves();
  
          for(int i = 0; i < 100; i++){
          Poo[i].drawPoo();
          Poo[i].crashCheck();
          
          }
  textSize(40);
  fill(255);
  text(score, 100,100);
  
}

void counters() {
  if ((millis()-lastMillis) > frameTime) {
    lastMillis = millis();
    gameFrame++;
    if (bumTurn == true)
      if (bumDir == 1)
      {
        turnFrame++;
      }
    if (bumDir == 0)
    {
      turnFrame--;
    }
  }
}


void loadImages() {
  //swim forward
  bumFrame[0] = loadImage("/images/Poopman_0023_Layer-1.png");
  bumFrame[1] = loadImage("/images/Poopman_0022_Layer-2.png");
  bumFrame[2] = loadImage("/images/Poopman_0021_Layer-3.png");
  bumFrame[3] = loadImage("/images/Poopman_0020_Layer-4.png");
  bumFrame[4] = loadImage("/images/Poopman_0019_Layer-5.png");
  bumFrame[5] = loadImage("/images/Poopman_0018_Layer-6.png");
  bumFrame[6] = loadImage("/images/Poopman_0017_Layer-7.png");
  //turn around
  bumFrame[7] = loadImage("/images/Poopman_0016_Layer-8.png");
  bumFrame[8] = loadImage("/images/Poopman_0015_Layer-9.png");
  bumFrame[9] = loadImage("/images/Poopman_0014_Layer-10.png");
  bumFrame[10] = loadImage("/images/Poopman_0013_Layer-11.png");
  bumFrame[11] = loadImage("/images/Poopman_0012_Layer-12.png");
  bumFrame[12] = loadImage("/images/Poopman_0011_Layer-13.png");
  bumFrame[13] = loadImage("/images/Poopman_0010_Layer-14.png");
  //swim backwards
  bumFrame[14] = loadImage("/images/Poopman_0009_Layer-15.png");
  bumFrame[15] = loadImage("/images/Poopman_0008_Layer-16.png");
  bumFrame[16] = loadImage("/images/Poopman_0007_Layer-17.png");
  bumFrame[17] = loadImage("/images/Poopman_0006_Layer-18.png");
  bumFrame[18] = loadImage("/images/Poopman_0005_Layer-19.png");
  bumFrame[19] = loadImage("/images/Poopman_0004_Layer-20.png");
  bumFrame[20] = loadImage("/images/Poopman_0003_Layer-21.png");
  bumFrame[21] = loadImage("/images/Poopman_0002_Layer-22.png");
  bumFrame[22] = loadImage("/images/Poopman_0001_Layer-23.png");
  bumFrame[23] = loadImage("/images/Poopman_0000_Layer-24.png");

  // be a cat
  /*
  catFrame[0] = loadImage("/images/catwalk_0006_Layer-1.png");
  catFrame[1] = loadImage("/images/catwalk_0005_Layer-2.png");
  catFrame[2] = loadImage("/images/catwalk_0004_Layer-3.png");
  catFrame[3] = loadImage("/images/catwalk_0003_Layer-4.png");
  catFrame[4] = loadImage("/images/catwalk_0002_Layer-5.png");
  catFrame[5] = loadImage("/images/catwalk_0001_Layer-6.png");
  catFrame[6] = loadImage("/images/catwalk_0000_Layer-7.png");
  //go the other way
  catFrame[7] = loadImage("/images/catBack_0006_Layer-1.png");
  catFrame[8] = loadImage("/images/catBack_0005_Layer-2.png");
  catFrame[9] = loadImage("/images/catBack_0004_Layer-3.png");
  catFrame[10] = loadImage("/images/catBack_0003_Layer-4.png");
  catFrame[11] = loadImage("/images/catBack_0002_Layer-5.png");
  catFrame[12] = loadImage("/images/catBack_0001_Layer-6.png");
  catFrame[13] = loadImage("/images/catBack_0000_Layer-7.png");
  */
  catFrame[0] = loadImage("/images/cat2_0013_Layer-1.png");
  catFrame[1] = loadImage("/images/cat2_0012_Layer-2.png");
  catFrame[2] = loadImage("/images/cat2_0011_Layer-3.png");
  catFrame[3] = loadImage("/images/cat2_0010_Layer-4.png");
  catFrame[4] = loadImage("/images/cat2_0009_Layer-5.png");
  catFrame[5] = loadImage("/images/cat2_0008_Layer-6.png");
  catFrame[6] = loadImage("/images/cat2_0007_Layer-7.png");
  //go the other way
  catFrame[7] = loadImage("/images/cat2_0006_Layer-8.png");
  catFrame[8] = loadImage("/images/cat2_0005_Layer-9.png");
  catFrame[9] = loadImage("/images/cat2_0004_Layer-10.png");
  catFrame[10] = loadImage("/images/cat2_0003_Layer-11.png");
  catFrame[11] = loadImage("/images/cat2_0002_Layer-12.png");
  catFrame[12] = loadImage("/images/cat2_0001_Layer-13.png");
  catFrame[13] = loadImage("/images/cat2_0000_Layer-14.png");
  
  pooFrame[0] = loadImage("/images/pooframes_0000_1poo.png");
  pooFrame[1] = loadImage("/images/pooframes_0001_2poo.png");
  pooFrame[2] = loadImage("/images/pooframes_0002_3poo.png");
  pooFrame[3] = loadImage("/images/pooframes_0003_4poo.png");
  pooFrame[4] = loadImage("/images/pooframes_0004_5poo.png");
  pooFrame[5] = loadImage("/images/pooframes_0005_6poo.png");
  pooFrame[6] = loadImage("/images/pooframes_0006_7poo.png");
  //go the other way
  pooFrame[7] = loadImage("/images/pooframes_0007_8poo.png");
  pooFrame[8] = loadImage("/images/pooframes_0008_9poo.png");
  pooFrame[9] = loadImage("/images/pooframes_0009_10poo.png");
  
  poop = loadImage("/images/Poop.png");
  
//PImage[] bubbles = new PImage[6];
//PImage[] waves = new PImage[3];
//PImage[] fish = new PImage[10]

  fishFrame[0] = loadImage("/images/fish1/fish1.png");
  fishFrame[1] = loadImage("/images/fish1/fish2.png");
  fishFrame[2] = loadImage("/images/fish1/fish3.png");

  fishFrame[3] = loadImage("/images/fish2/2fish1.png");
  fishFrame[4] = loadImage("/images/fish2/2fish2.png");
  fishFrame[5] = loadImage("/images/fish2/2fish3.png");

  fishFrame[6] = loadImage("/images/fish3/3fish1.png");
  fishFrame[7] = loadImage("/images/fish3/3fish2.png");
  fishFrame[8] = loadImage("/images/fish3/3fish3.png");

  
  // load waves, these will go over the top of everything and make it look underwater
  waves[0] = loadImage("/images/WAVES/wave1.png");
  waves[1] = loadImage("/images/WAVES/wave2.png");
  waves[2] = loadImage("/images/WAVES/wave3.png");
  // load the bubbles in - these will be made into objects which track upwards.
  bubbleFrame[0] = loadImage("/images/bubbles/bubble1.png");
  bubbleFrame[1] = loadImage("/images/bubbles/bubble2.png");
  bubbleFrame[2] = loadImage("/images/bubbles/bubble3.png");
  bubbleFrame[3] = loadImage("/images/bubbles/bubble4.png");
  bubbleFrame[4] = loadImage("/images/bubbles/bubble5.png");

}

void theBum() {
  //bumFrame[]
  int bumNum, frameOffset;

if(manAngle > 2){manAngle -= 0.2;}
if(manAngle < 2){manAngle += 0.2;}


if(moveLeft == true){
  bumX++;
  //manAngle += 0.5;
  if(groan.isPlaying()==false)
groan.rewind();
groan.play();
}
if(moveRight == true){ 
  bumX--;
    //manAngle -= 0.5;
if(groan.isPlaying()==false)
groan.rewind();
groan.play();
}

  bumNum = (int(gameFrame % 7)+(12*bumDir));
  //print(bumNum);
  if (bumTurn == false) {
   // pushMatrix();
    //translate(bumX,bumY);
    //rotate(radians(manAngle));
     
    image(bumFrame[bumNum], bumX, bumY, 300, 400);
    //image(bumFrame[bumNum], 0, 0, 300, 400);
   
    //popMatrix();
  }

  if (bumTurn == true) {
    image(bumFrame[turnFrame+7], bumX, bumY, 300, 400);
    if (turnFrame == turnStop)
    {
      bumTurn = false;
      turnFrame = 0;
    }
  }
}

void theCat(){
int catNum;
int catMoveTime = 1000;
catX = constrain(catX, 0, width-(catFrame[0].width));

catNum = (int(gameFrame % 14))/2;

if(catDir == 0){
image(catFrame[catNum], catX, catY);
}

if(catDir == 1){
image(catFrame[catNum], catX, catY);
}

if(catDir == 2){
  
image(catFrame[catNum+7], catX, catY);

}



if((millis()-lastCat)> catMoveTime){
lastCat = millis();
catDir = int(random(-0.5,2.5));
}

if(catDir == 0){
//cat moves Left
catX--;
}
if(catDir == 2){
//cat moves right
catX++;


}
}
void theFish(){
if(millis()-lastFish > fishThreshold){
  lastFish = millis();
  fishThreshold = int(random(1000,8000));
  if(Fish[fishNum].existing == false){
  Fish[fishNum] = new fish(width,int(random(250,600)),fishNum,int(random(1,3)));
  fishNum++;
  fishNum = fishNum % 3;
  }}
  
  for(int i = 0; i<3; i++){
  Fish[i].drawFish();
  }
  
}



class fish {

  float fishX;
  int fishY;
  int fishID;
  int fishPic; 
  boolean existing;

  fish(float xPos, int yPos, int id, int fishFrame) {
    fishX = xPos;
    fishY = yPos;
    fishID = id;
    existing = true;
    fishPic = fishFrame;
  }

        void drawFish() {
          int fishNum;
          if(fishX < 00){existing = false;}
        if (existing == true) {
          fishX -= 1.5;
    
    fishNum = (int(gameFrame % 6))/2;
    fishNum = (fishNum + fishPic*3);
    
          //image(pooFrame[frame], pooX, pooY);
          image(fishFrame[fishNum], fishX, fishY, 100,75);
          }
        }
}

void keyPressed() {
  if (key == 'd') {
   moveLeft = true;
    if (bumDir != 1) {
      bumTurn = true;
      turnFrame = 0;
      turnStop = 7;
      bumDir = 1;
       
    }  
  }
  
  if (key == 'a') {
   moveRight = true;
    if (bumDir != 0) {
      bumTurn = true;
      turnFrame = 7;
      turnStop = 0;
      bumDir = 0;
    }
  }
  
  if(key == 's'){
    plonk.play();
    plonk.rewind();
    if(bumDir == 1){
  Poo[pooNum] = new poo(bumX-90+150,bumY+220,pooNum,gameFrame);
  pooNum++;
  pooNum = (pooNum % 90);
    }
    if(bumDir == 0){
  Poo[pooNum] = new poo(bumX+50+150,bumY+220,pooNum,gameFrame);
  pooNum++;
  pooNum = (pooNum % 90);
    }
  }
}

void keyReleased(){
if(key == 'd'){
moveLeft = false; 
}

if(key == 'a'){
moveRight = false;
}

}


class poo {
  
int frame = 0;
int numFrames = 10;
long firstFrame;
int pooX;
int pooY;
int pooID;
boolean existing;

poo(int xPos, int yPos, int id, long startFrame){
    pooX = xPos;
    pooY = yPos;
    pooID = id;
    firstFrame = startFrame;
    existing = true;
    }

void drawPoo(){
  if(existing == true){
  frame = int((gameFrame-firstFrame) % numFrames);
  pooY++;
  pooY++;
//image(pooFrame[frame], pooX, pooY);
image(poop, pooX,pooY);

if(pooY > height){existing = false;}

}
}

void crashCheck(){
  
  for(int i = 0; i < 4; i++){
    if( abs( pooY-(Fish[i].fishY+37)) < 35){
      //print("Y CLOSE");
        if( abs(pooX-(Fish[i].fishX + 50)) < 50){
        existing = false; 
        pooX = 0;
        pooY = 0;
        score--;
        //print("SHIT HIT");
        }
        }
  }  
  
  if(pooY == height-100){
    if(abs(pooX - (catX +125)) < 50){
     // background(255);
      score++;
      existing = false; 
      pooX = 0;
      pooY = 0;
         meow.play();
         meow.rewind();
          }    
      }

}

}





void waves() {
  int waveNum;
  waveNum = (int(gameFrame % 12))/4;
  image(waves[waveNum], 0, 0, width, height);
}

void theBubbles() {
  if(millis()-lastBubble > bubbleThreshold){
  lastBubble = millis();
  bubbleThreshold = int(random(5,1200));
  
  Bubbles[bubbleNum] = new bubbles(int(random(0,width)),height,bubbleNum,int(random(0,4)));
  bubbleNum++;
  bubbleNum = bubbleNum % 10;
  }
  
  for(int i = 0; i<10; i++){
  Bubbles[i].drawBubble();
  }
  
}

class bubbles {

  int bubbleX;
  int bubbleY;
  int bubbleID;
  int bubblePic; 
  boolean existing;

  bubbles(int xPos, int yPos, int id, int bubbleFrame) {
    bubbleX = xPos;
    bubbleY = yPos;
    bubbleID = id;
    existing = true;
    bubblePic = bubbleFrame;
  }

        void drawBubble() {
          if(bubbleY < 200){existing = false;}
        if (existing == true) {
          bubbleY -= 3;
    
          //image(pooFrame[frame], pooX, pooY);
          image(bubbleFrame[bubblePic], bubbleX, bubbleY);
          }
        }
}






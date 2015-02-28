
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/114676*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// Assignment 4
// By Wong Hiu Tung, Christine
// Student ID: 53405140

import ddf.minim.*;

//Import the background music and sound effect.
Minim minim;
AudioSample ding;
AudioPlayer bgsound;

//Name the picture.
PImage imgSTART;
PImage imgRULES;
PImage imgBGPIC;

//The function of movving the bad chick.
boolean harvestTime;

//Set arrays on the movement of chicks.
PImage[] imgChick = new PImage[3];
float[] ChickMove = new float[5];

//The frame of the program.
int STARTframe = 0;

//Set the motion of the bad chick.
int ChickDown;
int speed;

void setup(){
   
  size(500, 500);
  frameRate(5);
  
  ChickDown = 255;
  speed = 3;
  
  minim = new Minim(this);
  ding = minim.loadSample("correct.mp3");
  bgsound = minim.loadFile("bgm.mp3");
  bgsound.loop();
  
  ChickMove[0] = 500;
  ChickMove[1] = 700;
  ChickMove[2] = 900;
  ChickMove[3] = 1100;
  ChickMove[4] = 1300;
  
  imgChick[0] = loadImage( "chick01.png");
  imgChick[1] = loadImage( "chick02.png");
  imgChick[2] = loadImage( "chick03.png");
    
  imgSTART = loadImage("GAMESTART.png");
  imgRULES = loadImage("RULES.png");
  imgBGPIC = loadImage("BGPIC.png");    
 
 }


void draw(){
  
  background(255);
 
//The first frame of the program.  
   STARTframe = STARTframe + 1;
   image(imgSTART, 0, 0);
 
//Load to the second frame of the program.    
   if ( STARTframe > 18){
     
     image(imgRULES, 0, 0);
   }
   
//Load to the third frame of the program.       
   if (STARTframe > 40){
     
   image(imgBGPIC, 0, 0);   
   
   frameRate(20);

//Set the motion of the chicks which the chicks' movement can be looped.    
   for(int i = 0; i < ChickMove.length; i++){
   ChickMove[i] = ChickMove[i] - 10;
   }

    
    if ( ChickMove[0] < 0 && ChickMove[1] < 0 && ChickMove[2] < 0 && ChickMove[3] < 0 && ChickMove[4] < 0 ){
    ChickMove[0] = 500;
    ChickMove[1] = 700;
    ChickMove[2] = 900; 
    ChickMove[3] = 1100;
    ChickMove[4] = 1300;
    }

// If clicking the mouse, the bad chick will move.
  if (harvestTime == true) {
    
    ChickDown= ChickDown + speed;

   image(imgChick[0], ChickMove[1], 255); 
   image(imgChick[1], ChickMove[2], 255); 
   image(imgChick[2], ChickMove[3], ChickDown);
    
   if (ChickDown >= 450){
     
//When the bad chick is chose, a message is shown and there will be sound effect.     
    ding.trigger();
    noLoop();
             
    textAlign(CENTER);
    textSize(10);
    text("YOU GOT THE CHICK!", 250, 250);

   }
  
    
   
  }
  
//If users don't click the bad chick, the chick will remain their movement.
  if (harvestTime == false) {
    image(imgChick[0], ChickMove[1], 255); 
    image(imgChick[1], ChickMove[2], 255); 
    image(imgChick[2], ChickMove[3], ChickDown);

}
   }
  }

//Call the function of mouseClicked() for the bad chick.   
void mouseClicked() {
  harvestTime = true;
}

//Reference: http://www.openprocessing.org/sketch/105640




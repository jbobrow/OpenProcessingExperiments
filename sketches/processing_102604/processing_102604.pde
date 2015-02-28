

Maxim maxim;


AudioPlayer heartbeat;
AudioPlayer scream;

float screamVolume = 0;
float audioSpeed=2.0;

PImage[] eyeImgs;
float[] obj;
PShader blur;

////////////////////
int ME = 0;
int WIDTH = 3;
int HEIGHT = 4;
int SCALE = 5;
int X = 1;
int Y = 2;
///////////////////

int forcedWidth = 960;
int forcedHeight = (int) (((float) forcedWidth) *0.5625);

float pow = 0;
float t = 0;
float restPosition = 0;
float restValue = 0;
float newPosition = 0;
float newVelocity = 0;
float wiggleSpeed = 1;
float startAmp = 1;
float damping = .5;
float springTension = .2;
float xoff = 10;
float yoff = 30;
float soff = 50;
float foff = 70;
float currentframe = 0;
float panic = 0;
float panicAtRest = 0;
float SKIP_FRAMES = 1;
float MAX_FRAMES = 295/SKIP_FRAMES;
float SEEK_FRAME_SPEED = .7;
float dir = 1;
int forcedReverse = 1;

float currentframeTarget = 0;
float waitAfterTouched = 0;

int quadrantRow = 0;
int quadrantCol = 0;

float FPS = 60;
float FPS_FACTOR = 60/FPS;

float redTint = 255;
float greenTint = 255;
float blueTint = 255;

float heartSpeed = 2;

int [][][] eyeGrid = {
      // Rows
        {  // TOP ROW
          {273},  // Top Left
          {117},  // Top Middle
          {117}  // Top Right [same as Top Middle]
        },
        {  // MIDDLE ROW
          {79},           // Middle Left
          {20,48,60,161,229}, // Middle MIDDLE
          {211}           // Middle Right
        },
        {  // BOTTOM ROW
          {132,253},      // BOTTOM LEFT
          {37, 195},      // BOTTOM MIDDLE
          {208}           // BOTTOM RIGHT
        }      
      };


int [] eyeGridBackup = {
      20, // Middle
      37, // Bottom Middle
      48, // Middle
      60, // Middle
      79, // Left
      117,// Top Middle
      132,// Bottom Right
      161,// Middle
      195,// Bottom Middle
      202,// Bottom Right
      211,// Right
      229,// Straight
      253,// Bottom Left
      273 // Top Left
};


void setup () {

  size (960, 540); 
  background(0);


  //size (forcedWidth, forcedHeight); 
  //frameRate((int)FPS);
  maxim = new Maxim(this);
  
  
  eyeImgs = new PImage[0];
  obj = new float[6];
  
  //////////////////
  // I don't know the syntax for object/classes yet, so this will do
  obj[ME] = 0;
  obj[X] = 0;
  obj[Y] = 0;
  obj[WIDTH] = forcedWidth;
  obj[HEIGHT] = forcedHeight;
  obj[SCALE] = 1;
  //////////////////
  
 
}

int loadSequence = 0;
int imgIndex = 0;
void draw () {   
 
  if (loadSequence < 10) {
   
    switch (loadSequence) {
      case 0:
        fill(0);
        rect (0,0,width, height);
        textSize(20);
        fill(155);
        text(("loading the creepyness "+imgIndex+" of " + MAX_FRAMES), width/2-150, height/2-30);
        
         imgIndex = (imgIndex) + (int)SKIP_FRAMES;
        
         if (imgIndex <=  (int)MAX_FRAMES*(int)SKIP_FRAMES) {
           String stub = "tiny/Eye25s_";
           String extension = ".jpg";
           String it = "";
           it = (imgIndex < 10) ? ("0000" + imgIndex) : it;
           it = (imgIndex >= 10) ? ("000" + imgIndex) : it;
           it = (imgIndex >= 100 && imgIndex < 1000) ? ("00" + imgIndex) : it;
           PImage img = loadImage(stub+it+extension);
           if(img != null) {
              eyeImgs = (PImage [])append(eyeImgs,img);
           }
           
         } else {
          // eyeImgs = loadImages("tiny/Eye25s_", ".jpg", (int)MAX_FRAMES,(int)SKIP_FRAMES);
            ++loadSequence; 
         }
        break;
      case 1:
        if (eyeImgs[eyeImgs.length-1].width > 0) {
           ++loadSequence;
        }
        break;
      case 2: 
        
        heartbeat = maxim.loadFile("Heartbeat.mp3");
        scream = maxim.loadFile("scream.mp3");
        heartbeat.setAnalysing(true);
        scream.setLooping(true);
        heartbeat.setLooping(true);
 
        ++loadSequence;
        break;
      case 3:
        if (heartbeat.isLoaded() && scream.isLoaded()) {
          ++loadSequence;
        }
        break;
      case 4:
       
       
        
        fadeFromBlack = 0;
        fadeTarget = 10;
        fadeSpeed = 15;
        
        ++loadSequence;
        break;
      case 5:
         if (doFade() == false) {
           ++loadSequence;
         };
         break;
      case 6:
        fadeFromBlack = 255;
        fadeTarget = 0;
        fadeSpeed = 120;
        loadSequence = 100;
         
        break;
      
    }
  } else {
      doDraw();
  }
 
}
float floatSeekFrame = 0;

float fadeTarget = 0;
float fadeFromBlack =255;
float fadeSpeed = 30;

void doDraw (){
  
 
  
  FPS_FACTOR += (1-FPS_FACTOR )/100;
  heartSpeed += (2-heartSpeed)/100;
  panic += (panicAtRest -panic) /(4);
  noiseDetail(8+((int) panic),0.25);
  t += (0.015*FPS_FACTOR);
  xoff += (.05*FPS_FACTOR)+panic/3;
  yoff += (.05*FPS_FACTOR)+panic/3;
  soff += (.1*FPS_FACTOR)+panic;
  foff += (.01*FPS_FACTOR)+panic;

  closeness();
  wiggle();
  
 
  
  if (waitAfterTouched/FPS_FACTOR > 0) {
   --waitAfterTouched;
  } else {
    dir = (noise(foff)-.5) < 0 ? -1 : 1;
  }
   //currentframe = currentframe + (.34*dir*forcedReverse*(panic*3+1));
  // if (abs(floatSeekFrame) > 1) {
     currentframeTarget += ((.34*FPS_FACTOR)*dir*forcedReverse);
    floatSeekFrame = (currentframeTarget-currentframe)*SEEK_FRAME_SPEED;
   //} else {
     currentframe+= floatSeekFrame;
  // }
  
  // currentframe = currentframe + 
   
  //currentframe = (noise(foff) * MAX_FRAMES);
 //  println("FIND: " + currentframe);
  if ((int) currentframe > (int)MAX_FRAMES-1) {
   forcedReverse *= -1 ;
   currentframe = (int)MAX_FRAMES-1;
   //println ("---------");
  } else if ((int) currentframe < 0) {
    forcedReverse *= -1 ;
    currentframe =  0;
     //println ("---!!!!---");
  }
  //println("PP:"+ eyeImgs.length+"|"+(int) currentframe);
 // println("DRAWING: " + eyeImgs.length + "|" + (int)currentframe);
 
  image(eyeImgs[(int) currentframe], obj[X], obj[Y], obj[SCALE]*obj[WIDTH], obj[SCALE]*obj[HEIGHT]);
  heartbeat.play();

  scream.play(); 
  float tPow = heartbeat.getAveragePower();
  pow = map (tPow*-1, 0.15, 0.55, -.5, 1.3);

  //float[] spec = heartbeat.getPowerSpectrum();
  //println("pow:" + pow + "|" + (tPow*-1));
  //redTint = pow*10*200;
  redTint = 255;
  //  redTint = pow*255;
  blueTint = 255-(pow*255)-waitAfterTouched/2;
  greenTint = 255-(pow*255)-waitAfterTouched/2;
  
  blueTint = blueTint > 255 ? 255 : blueTint < 0 ? 0 : blueTint ;
  greenTint = greenTint > 255 ? 255 : greenTint < 0 ? 0 : greenTint ;

 // redTint += (255-redTint)/(6*FPS_FACTOR);
 // blueTint += ((255-blueTint)/(6*FPS_FACTOR))/(noise(foff)*3);
  //greenTint += ((255-greenTint)/(6*FPS_FACTOR))/(noise(foff)*3);
  doFade();
  tint((int)redTint, (int)blueTint, (int)greenTint);
 // println(screamVolume +"|"+ scream.isPlaying());
  heartbeat.speed(heartSpeed);
  heartbeat.setLow(map(heartSpeed, 1, 4, 20000, 200));
  screamVolume += (0-screamVolume)/30;
  scream.volume(screamVolume);
  
  
 // filter(POSTERIZE, 4); 
}


boolean doFade() {
 if (abs(fadeTarget-fadeFromBlack) > 1) {
    fill (0,fadeFromBlack);
    fadeFromBlack += (fadeTarget-fadeFromBlack)/fadeSpeed;
    rect(0,0,width, height);
    return true;
  } else {
     return false; 
  }
}

void checkStageQuadrant (){  
  if (mouseX < width/3) {
    quadrantCol = 0;
  } else if (mouseX < (width/3)*2) {
    quadrantCol = 1;
  } else {
    quadrantCol = 2;
  } 
  
  if (mouseY < height/3) {
    quadrantRow = 0;
  } else if (mouseY < (height/3)*2) {
    quadrantRow = 1;
  } else {
    quadrantRow = 2;
  } 
}


void closeness () {
  float wiggleNoise = panic > .1 ? 1 : noise(soff);
   
  if (scale_dampening < MINIMUM_DAMP) {
    scale_dampening += (MINIMUM_DAMP-scale_dampening)*dampening_dampening;
  }
  float scaleWithBeat = targetScale+pow/3;
  scaleWithBeat = scaleWithBeat < 1 ? 1 : scaleWithBeat;
  scaleVelocity = (((scaleWithBeat)-obj[SCALE])*scale_dampening)*(wiggleNoise);
  obj[SCALE] += scaleVelocity;
  boolean getCloseAgain = random(1) > (1-(0.01*FPS_FACTOR)) ? true : false;
  if (targetScale != REGULAR_SCALE &&  abs(scaleVelocity) < .0005 && getCloseAgain) {
   untouched();
  }
}

float scaleVelocity = 0;
float SCARED_SCALE = 1.1;
float REGULAR_SCALE = 1.25;
float SCARED_DAMP = .1*FPS_FACTOR;
float REGULAR_DAMP = .01*FPS_FACTOR;
float MINIMUM_DAMP = .01*FPS_FACTOR;
float WIGGLE_SCALE = 1.05;
float targetScale = REGULAR_SCALE;
float scale_dampening = SCARED_DAMP;
float dampening_dampening = .008*FPS_FACTOR;

void touched () {
  screamVolume = .7;
  scream.volume(screamVolume);
  scream.speed(.2*heartSpeed);
  //scream.cue((int)random(scream.getLengthMs()));
  //scream.stop();
  scream.play();
  //println(">>" + (int)random(scream.getLengthMs()));
  FPS_FACTOR += (5-FPS_FACTOR)/3;
  targetScale = SCARED_SCALE;
  scale_dampening = SCARED_DAMP;
  panic += 20;
  checkStageQuadrant();
  setCurrentFrame();
  waitAfterTouched = 200;
  redTint = 255;
  blueTint = 100;
  greenTint = 100;
  dir = 1;
  forcedReverse = 1;
  heartSpeed = 3;
}

void setCurrentFrame () {
  if (quadrantCol == 1 && quadrantRow == 0) quadrantCol = 0;
  int [] framePositions = eyeGrid[quadrantRow][quadrantCol];
  currentframeTarget = (float)framePositions[(int)random(framePositions.length-1)]/SKIP_FRAMES-random(5);
 // println(">>"+currentframeTarget +"|"+ quadrantRow + "|" + quadrantCol + ">>>>>"+ framePositions.length);
 // currentframe = currentframeTarget;
}

void untouched () {
  //scream.ramp(0, 500);
  panic += 3;
  targetScale = REGULAR_SCALE;
  scale_dampening = REGULAR_DAMP;
 // checkStageQuadrant();
 //quadrantRow = 1;
 //quadrantCol = 1;
 // setCurrentFrame();
  waitAfterTouched = 100;
}

void wiggle() {
  
  float xMarginAvailable = abs(obj[SCALE]*forcedWidth-width);
  float yMarginAvailable = abs(obj[SCALE]*forcedHeight-height);
  float x = (noise(xoff) * (xMarginAvailable)) - (xMarginAvailable/2);
  float y = (noise(yoff) * (yMarginAvailable)) - (yMarginAvailable/2);
  
  float newX = -(xMarginAvailable)/2+x;
  float newY = -(yMarginAvailable)/2+y;
  
  if (newX > 0) {
    newX = 0;
  }
  if (newY > 0) {
    newY = 0; 
  }
  
  obj[X] = newX;
  obj[Y] = newY;
}

void mousePressed () {
  touched();
}


//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int numImages, int skipFrames) {
  PImage [] images = new PImage[0];
  String it = "";
  for(int i =0; i < numImages*skipFrames; i++) {
    i = (i-1) + skipFrames;
   // println(i);
    it = (i < 10) ? ("0000" + i) : it;
    it = (i >= 10) ? ("000" + i) : it;
    it = (i >= 100 && i < 1000) ? ("00" + i) : it;
    PImage img = loadImage(stub+it+extension);
    if(img != null) {
      images = (PImage [])append(images,img);
    } else {
      break;
    }
  }
  return images;
}



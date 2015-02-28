
//file=finalProj.pde
//author=
//dateStarted=20131209
//dateLastUpdated=20131211
//description:This is the pde for the final project for the course introduction to computational art.
//            It contains a processing script, image file, and audio file.
//            The processing script displays different color trees upon each mouseclick.
//            The tree is built with a simple recursive function;
//             user should mouseclick slowly within the canvas for at least 15 times.
//            Yes, I am making a political statement that I hold strongly and dearly in my heart.
//            The background image is a small section from a personal photo.
//            The audio file is from a midi file generated via python code I wrote
//             using pyknon package.
//            The music is not original (but I believe no copyright is violated).
//            This is not for commercial use and no copyright infringement is intended.
//title:A tribute to a great man

import ddf.minim.*;
PImage gImg;
Minim gMinim;
AudioPlayer gAudio;

int gWidth = 600; //1280
int gHeight = 800; //720
int gTopLeftX = 0;
int gTopLeftY = 0;
int gCount = 0;
int gFirstIter = 12;
int gSecondIter = 15;

void setup(){
  //background(255,255,255); 
  size(gWidth,gHeight); //20131210.size must preceed loadImage
  //20131210.default background 
  background(135,206,250); //20131209,red,green,blue lightSkyBlue
  gImg = loadImage("blueSky_20131210a.jpg");
  background(gImg); 
  gMinim = new Minim(this);
  gAudio = gMinim.loadFile("sa.mp3");
}

void draw(){
  noStroke();
}

void branch(float vOrigX, float vOrigY, float vStroke, float vAngle){
  strokeWeight(vStroke * 0.04);
  vAngle += radians(random(-7,7));
  float vNewX = vOrigX + cos(vAngle)*vStroke;
  float vNewY = vOrigY + sin(vAngle)*vStroke;
  line(vOrigX,vOrigY,vNewX,vNewY);
  if(vStroke > 3){
    branch(vNewX, vNewY, vStroke*(random(0.55,0.70)), vAngle - radians(random(17,12)));
    branch(vNewX, vNewY, vStroke*(random(0.55,0.70)), vAngle + radians(random(17,12)));
    if(random(0,2) > 0.9){
      branch(vNewX, vNewY, vStroke*(random(0.55,0.70)), vAngle);
    }
  }
}

void mousePressed(){
  gCount = gCount + 1;
  float vHorizon = 0.00;
  if(gCount < gFirstIter){
    if(random(0,2) > 0.9){
      stroke(255,255,255); //20131210.white
      vHorizon = random(gWidth*0.5, gWidth*0.9);
      branch(vHorizon, gHeight, gHeight/random(9,10), radians(270));
    } else {
      stroke(0,0,0); //20131210.black
      vHorizon = random(gWidth*0.1, gWidth*0.45);
      branch(vHorizon, gHeight, gHeight/random(10,11), radians(270));
    }
  } else {
    if(gCount < gSecondIter){
      if(random(0,2) > 0.9){
        stroke(255,255,255); //20131210.white
        vHorizon = random(gWidth*0.1, gWidth*0.45);
        branch(vHorizon, gHeight, gHeight/random(13,14), radians(270));
      } else {
        stroke(0,0,0); //20131210.black
        vHorizon = random(gWidth*0.5, gWidth*0.9);
        branch(vHorizon, gHeight, gHeight/random(13,14), radians(270));
      }
    } else {
      if(gCount == gSecondIter){
        gAudio.play();
      }
      stroke(random(130,170),random(220,255),random(170)); //20131210.shade of green
      vHorizon = random(gWidth*0.1, gWidth*0.9);
      branch(vHorizon, gHeight, gHeight/random(3,5), radians(270));
    }
  }
}



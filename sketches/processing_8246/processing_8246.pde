
// Hello ! ///////////////////////////

//////////////////////////////////////
// by Jeremy Vey /////////////////////
// Graphic designer //////////////////
//////////////////////////////////////
// www (dot) jeremyvey (dot) net /////
//////////////////////////////////////
// hello (at) jeremyvey (dot) net ////
// +33 (0) 6 72 91 82 13 /////////////
// F — 31000 Toulouse ////////////////
//////////////////////////////////////

//////////////////////////////////////

import krister.Ess.*;

AudioInput myInput;
FFT myFFT;
int bufferSize = 128;

float posX;
float posY;
float deplace_x;
float deplace_y;
float niveau;
float freq;
float freq_x;
float freq_y;
float direction_x = 1;
float direction_y = 1;
float d_x = 1;
float d_y = 1;
float f_x = 1;
float f_y = 1;

///////////////////////////////////////////////////////////////////////////////////////////
void setup(){

  size(770,578);
  background(255);
  smooth();

  Ess.start(this);
  myInput = new AudioInput(bufferSize);
  myFFT = new FFT(bufferSize*2);
  myInput.start();

  frameRate(600);

  posX = width/2;
  posY = height/2;

}
///////////////////////////////////////////////////////////////////////////////////////////
void draw(){  

  for(int i= 0; i<bufferSize; i++){

    float niveau = myFFT.getLevel(myInput)*1000;

    if(niveau>0){

      deplace_x = (i+random(-niveau,niveau));
      deplace_y = (i+random(-niveau,niveau));

      if(deplace_x>(niveau)){
        d_x = -1;
      }
      if(deplace_x<0){
        d_x = 1;
      }
      if(deplace_y>(niveau)){
        d_y = -1;
      }
      if(deplace_y<0){
        d_y = 1;
      }

      freq = myFFT.spectrum[i]*10000;

      freq_x = (i+random(-freq,freq));
      freq_y = (i+random(-freq,freq));

      if(freq_x>(freq)){
        f_x = -1;
      }
      if(freq_x<0){
        f_x = 1;
      }
      if(freq_y>(freq)){
        f_y = -1;
      }
      if(freq_y<0){
        f_y = 1;
      }

      posX += direction_x*(sin((deplace_x*freq_x)));
      posY += direction_y*(cos((deplace_y*freq_y)));

      if(posX>width){
        posX = 0;

      }
      if(posX<0){
        posX = width;

      }
      if(posY>height){
        posY = 0;

      }
      if(posY<0){
        posY = height;

      }

      noStroke();
      fill(0,30);
      rect(posX,posY,1,1);

    }

  }

  if(mousePressed) {

    noStroke();
    fill(255);
    rect(0,0,width,height);

    posX = width/2;
    posY = height/2;
  }

}





















//import ESS library
import krister.Ess.*;

//------global variables------\\
FFT myfft;
AudioInput myinput;
int bufferSize=512;
float volume = .09;
float R=700;
float G=550;
float B=300;

float greenColorR = 900;
float greenColorG = 2000;
float greenColorB = 200;


float redColorR = 2100;
float redColorG = 200;
float redColorB = 200;


//----------built in functions----------\\ 
void setup() {
  size(1000, 1000);
  smooth();
  frameRate(30);
  noStroke();
  fill(0);

  Ess.start(this);
  myinput=new AudioInput(bufferSize);
  myfft=new FFT(bufferSize*2);
  myinput.start();
  //sensitivity
  myfft.damp(volume);
  myfft.equalizer(true);
  //spectrum limits
  myfft.limits(.005, .05);
}

//-------key function------\\
void keyPressed() {
  //if key '-' is pressed: decrease sensitivity.
  if (key == '-') {
    volume=volume-0.01;
  }

  //if key '-' is pressed: increase sensitivity.
  if (key == '=') {
    volume=volume+0.01;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      R = random(300, 900);
      B = random(300, 900);
      G = random(300, 900);
      greenColorR = random(200, 2000);
      greenColorG = random(200, 2000);
      greenColorB = random(200, 2000);
      redColorR = random(200, 2100);
      redColorG = random(200, 2100);
      redColorB = random(200, 2100);
    } 
    else if (keyCode == DOWN) {
      R = 700;
      B = 300;
      G = 550;
      greenColorR = 900;
      greenColorG = 2000;
      greenColorB = 200;
      redColorR = 2100;
      redColorG = 200;
      redColorB = 200;
    }
  }
}


//-----------------------------draw function---------------------------------\\
void draw() {
  //background (boarder) 
  background(myfft.spectrum[500]*210, myfft.spectrum[500]*120, myfft.spectrum[500]*70);

  //accessing input sound spectrum
  for (int i=0; i<bufferSize;i++) {

    //orange
    fill(myfft.spectrum[i]*R, myfft.spectrum[i]*G, myfft.spectrum[i]*B);
    rect(-i+width-10, height-10, 1, -height+20);
    rect(i+10, height-10, 1, -height+20);

    //red
    fill(myfft.spectrum[i]* redColorR, myfft.spectrum[i]* redColorG, myfft.spectrum[i]* redColorB);
    rect(i+10, height-10, 1, myfft.spectrum[i]*-500);
    rect(-i+width-10, height-10, 1, myfft.spectrum[i]*-500);

    //green
    fill(myfft.spectrum[i]*greenColorR, myfft.spectrum[i]*greenColorG, myfft.spectrum[i]*greenColorB);
    rect(i+10, 10, 1, myfft.spectrum[i]*500);
    rect(-i+width-10, 10, 1, myfft.spectrum[i]*500);

    //yellow(middle)
    fill(myfft.spectrum[i]*2000, myfft.spectrum[i]*1000, myfft.spectrum[i]*200);
    rect(i+10, height/2, 1, myfft.spectrum[i]*-300);
    rect(i+10, height/2, 1, myfft.spectrum[i]*300);
    rect(-i+width-10, height/2, 1, myfft.spectrum[i]*-300);
    rect(-i+width-10, height/2, 1, myfft.spectrum[i]*300);
  }
  //middle spectrum
  for (int i=0; i<bufferSize/2-105;i++) {
    fill(myfft.spectrum[i]*2000, myfft.spectrum[i]*1000, myfft.spectrum[i]*200);
    rect(-i+width/2+78, height/2, 1, 30+myfft.spectrum[i]*400);
    rect(-i+width/2+78, height/2, 1, (-30)+myfft.spectrum[i]*-400);

    fill(myfft.spectrum[i]*200, myfft.spectrum[i]*300, myfft.spectrum[i]*30);
    rect(-i+width/2+78, 10, 1, (height/2)-50+myfft.spectrum[i]*-400);

    fill(myfft.spectrum[i]*310, myfft.spectrum[i]*30, myfft.spectrum[i]*30);
    rect(-i+width/2+78, height-10, 1, (-height/2)+50+myfft.spectrum[i]*400);
  }


  //if spectrum[510]*100 is greater than 25
  if (myfft.spectrum[510]*100>25) {
    //draw white rect over sketch leaving boarder
    fill(myfft.spectrum[510]*2000, myfft.spectrum[510]*2000, myfft.spectrum[510]*2000, myfft.spectrum[510]*500);
    rect(10, 10, width-20, height-20);
  }
  //show sensitivity
  println (volume);


  //curve
  pushStyle();
  //if spectrum[510]*100 is greater than 25
  if (myfft.spectrum[510]*100>25) {
    //make curve black and thicker
    stroke(0);
    strokeWeight(5);
  } 
  else { 
    //otherwise (orange)
    stroke(myfft.spectrum[510]*B, myfft.spectrum[510]*R, myfft.spectrum[510]*G);
    strokeWeight(2);
  }
  noFill();
  int interp=max(0, (((millis()-myinput.bufferStartTime)/myinput.duration)*myinput.size));
  //draw curve
  beginShape();
  for (int i=0;i<(width-2)/5;i++) {
    //draw in the middle
    float pos=height/2;
    if (i+interp+1<myinput.buffer2.length) {
      pos-=myinput.buffer2[i+interp]*400*2;
    }
    //curve
    curveVertex(10+i*5, pos);
  }
  endShape();
  popStyle();
}


public void audioInputData(AudioInput theInput) {
  myfft.getSpectrum(myinput);
}



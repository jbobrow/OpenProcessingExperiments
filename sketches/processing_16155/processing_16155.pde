
/*////////////////////////////////////////////////////////////////////////////
 *
 * 08.2010 Cécile P-L for Fuscia - ccl.picard@gmail.com - 
 * Analyseur FFT avec bandes de fréquences ajustables 
 * pour noter l'influence de la résolution des bandes sur le spectre
 *
 * Inspired from Linear Averages
 * by Damien Di Fede.
 *  
 */

import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioInput in;
AudioPlayer jingle;
FFT fft,fftS;
AudioOutput out;
SineWave sine;

int nb;
String path = null;
PFont f;
boolean info = false, sounding = false;
float fs = 44100;
int k = 0;
void setup()
{
  size(700, 270, P2D);
  background(0);
  
  f = createFont("Arial Bold",14,true);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
  //fft = new FFT(in.bufferSize(), in.sampleRate());
  nb = 128;
  //fft.linAverages(nb);
  
  
  /*//TEST Sine
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  out = minim.getLineOut(Minim.STEREO,2048);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate from line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 200 milliseconds
  sine.portamento(200);
  // add the oscillator to the line out
  out.addSignal(sine);
  fftS = new FFT(out.bufferSize(), out.sampleRate());
  // use 'nb' averages (between 64 and 1024).
  // the maximum number of averages we could ask for is half the spectrum size. 
  fftS.linAverages(nb);*/
  
  rectMode(CORNERS);
  
}

void draw()
{
  fill(255);

  /*fft = new FFT(in.bufferSize(), in.sampleRate());
    fft.linAverages(nb);
  fft.forward(in.mix);
  int w = int(fft.specSize()/nb);
  strokeWeight(w);
  strokeCap(SQUARE);
  stroke(255);
  for(int i = 0; i < fft.avgSize(); i++) {
    if(i==k) stroke(255, 0, 0);
    else stroke(255); 
    line((i*w)  + w, height-5, (i*w)  + w, height-5 - fft.getAvg(i)  );
  }
  noStroke();*/
  update();
  /*//TEST Sine
  fftS.forward(out.mix);
  int w = int(fftS.specSize()/nb);
  strokeWeight(w);
  strokeCap(SQUARE);
  stroke(255);
  for(int i = 0; i < fftS.avgSize(); i++) {
    if(i==k) stroke(255, 0, 0);
    else stroke(255); 
    line((i*w)  + w, height-5, (i*w)  + w, height-5 - fftS.getAvg(i)  );
  }
  noStroke();*/
  
  printInfo();
 
  
}

void printInfo() {

  if(info) {
    fill(0);
    rect(0, 100, width, -10);
    textFont(f);
    textAlign(LEFT);
    fill(255, 150, 0);
    text("\n " + 
      ".  Clic Gauche : joue enregistrement (Nina Hagen, ''Born in Xixas'') \n " +
      ".  Clic Droit : stop la lecture, analyse de l'entrée micro \n " +
      ".  Clic Centre + souris à droite/gauche: élargit/rafine les bandes de fréquences (entre 32 et 128) \n " +
      ".  Pointe une bande de fréquence pour savoir ses valeurs.", 10, 15);

  } else {
    fill(0);
      rect(0, 100, width, -10);
      textFont(f);
      textAlign(LEFT);
      fill(255, 150, 0);
      text("- INFO - ", 10, 15);
  } 
}

void update() {
  int coeff;
  if(path != null) {
    fft = new FFT(jingle.bufferSize(), jingle.sampleRate());
    fs = jingle.sampleRate();
    fft.linAverages(nb);
    fft.forward(jingle.mix);
    coeff = 1;
  } 
  else {
    fft = new FFT(in.bufferSize(), in.sampleRate());
    fft.linAverages(nb);
    fft.forward(in.mix);
    coeff = 5;
  }
  
  //fft.linAverages(nb);
  int w = int(fft.specSize()/nb);
  //strokeWeight(w);
  //strokeCap(SQUARE);
  for(int i = 0; i < fft.avgSize(); i++) {
    /*if(i==k) fill(100); //stroke(255, 0, 0);
    else fill(255); //stroke(255);   */
    if(mouseX<width/2) {
      fill(0); rect(0 , height-5+10, width/2, height-10);
      fill(255, 0, 0); ellipse(k*w , height-5, 5, 5); 
    }
    fill(255);
    //line((i*w)  + w, height-5, (i*w)  + w, height-5 - fft.getAvg(i)  );
    rect(i*w , height-10, (i*w)  + w, height-10 - fft.getAvg(i)*coeff);
  }
  //noStroke();
  
  /*//TEST Sine
  fftS.linAverages(nb);
  int w = int(fftS.specSize()/nb);
  strokeWeight(w);
  strokeCap(SQUARE);
  for(int i = 0; i < fftS.avgSize(); i++) {
    if(i==k) stroke(255, 0, 0);
    else stroke(255);    
    line((i*w)  + w, height-5, (i*w)  + w, height-5 - fftS.getAvg(i)  );
  }
  noStroke(); */
    
}

void mouseMoved() {
  // Print info
  if(mouseX<50 && mouseY<20) {
    info = true;
  } else {
    info = false;
    textFont(f,12);
    fill(0);
    rect(width, 150, width/2+80, height/3);
    fill(255);
    text("nombre de bandes = "+ nb , width-170, int(height/2)-20);
    if(mouseY>height/2) k = getClosestBand(mouseX);
    text(" Fréquences = [" + (int)getClosestBand(mouseX)*(fs/2/nb) + " - "+ (int)(getClosestBand(mouseX)+1)*(fs/2/(nb)) + " Hz]", width-270, int(height/2));
  }
  
}

int getClosestBand(int mx) {
  int ix = 0;
  ix = (mx/int(fft.specSize()/nb));//ix = (mx/int(fftS.specSize()/nb));
  return ix; 
}


void mouseReleased() {
  // Load file
  if(mouseButton == LEFT) {
    background(0);
    String pathN;
    //pathN = selectInput();
    pathN = "NinaHagen_BornInXixas_ext.mp3";
    if(!(pathN==path) && pathN != null && !(sounding)) {
      path = pathN;
      jingle = minim.loadFile(path);
      sounding = true;
    }
    // loop the file
    jingle.loop();
  }
  // Micro in
  if(mouseButton == RIGHT) {
    if(sounding) {
      jingle.pause();
      sounding = false;
      path = null;
      fill(0);
      rect(0, height, width/2+200, -10);
      update();
    } 
  }
  // Change width of frequency band
  if(mouseButton == CENTER) { 
    if(mouseX>width/2) {
      if(nb<128) {
        background(0);
        nb*=2;
        update();
      }
    } else {
      if(nb>32) {
        background(0);
        nb/=2;
        update();
      } 
    }
  }
  
}



void stop()
{
  if(path != null) {
    jingle.close();
  }
  minim.stop();

  super.stop();
}



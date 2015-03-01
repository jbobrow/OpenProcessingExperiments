
/********************************************************
 *         Nov.03.2013                                   *
 *         Sound+                                        *
 *         Jinwook Yun                                   *
 *         University of Applied Sciences Potsdam        *
 ********************************************************/

import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

Minim minim;
AudioInput in;
FFT fft;

float sound;

void setup() {
  size(1536, 600);
  //size(1077, 1190);      // for the tote bags
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.linAverages(256);

  background(255);
  smooth();
  noStroke();
}

void draw() {
  fft.forward(in.mix);

  float x = random(width);
  float y = random(height);
  //fill(255, 255, 255, 100);    //refresh the screen
  //rect(0, 0, width, height);   
  //frameRate(15);               

  for (int i = 0; i < fft.avgSize (); i++) {
    ellipse(x, y, fft.getAvg(i)*5, fft.getAvg(i)*5);
    noStroke();
    smooth();
    fill(random(0, 255), random(0, 255), random(0, 255));  // full color
  }
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}




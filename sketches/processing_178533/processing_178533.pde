
// Audio Player 

import ddf.minim.*;
import ddf.minim.analysis.*;
PImage img;

Minim minim;
AudioPlayer song, song2, voice;

FFT fft, fft2;
int loopBegin, loopEnd;
boolean pause = false, mute=false; 

void setup()
{
  size(600, 600);
  imageMode(CENTER);
  textMode(CENTER);
  minim = new Minim(this);
  song = minim.loadFile("1.mp3");
  song2 = minim.loadFile("2.mp3");
  song.loop();
  song2.loop();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  fft2 = new FFT( song2.bufferSize(), song2.sampleRate() );
  song.setGain(-60);
  song2.setGain(-2);
  img=loadImage("sad.png");
}

void draw()
{
  background(0);
  fill(255);  
  translate(width/2, height/2);
  scale(2);

  image(img, 0, 0);


  if (keyPressed) {
    switch(key) {
    case'a':

      text("They use FORCE", -50, 140);
      break;

    case's':
      text("To make you do", -50, 140);
      break;

    case'd':
      text("SLIENCE", -50, 140);
      break;

    case'f':
      text("DECIDE", -50, 140);
      break;

    case'1':
      background(255, 0, 0);
      image(img, 0, random(-5, 5));
      break;

    case 'q':
      background(0,255,0);
           image(img,random(-20, 20),0); 

      break;

    case 'w':
      background(0,0,255);
            image(img, 0, random(-20, 20));
      break;
    }
  }
}

void keyPressed()
{
  switch(key) {
  case 'a':
    voice = minim.loadFile("v1.aif");
    voice.setLoopPoints(loopBegin, 0);
    voice.play();
    break;

  case 's':
    voice = minim.loadFile("v2.aif");
    voice.play();
    break;

  case 'd':
    voice = minim.loadFile("v3.aif");
    voice.play();
    break;
  case 'f':
    voice = minim.loadFile("v4.aif");
    voice.play();
    break;


  case 'q':
    voice = minim.loadFile("kick.aif");
    voice.setGain(-8);
    voice.play();
    break;


  case 'w':
    voice = minim.loadFile("snare.aif");
    voice.setGain(-8);
    voice.play();
    break;

  case '1': // volume up
    song.setGain(6);
    song2.setGain(-60);
    img=loadImage("angry.png");
    break;
  }
}

void keyReleased() {
  switch(key) {
  case '1':
    song.setGain(-60);
    song2.setGain(-2);
    img=loadImage("sad.png");
    break;

  case 'a':
    voice.pause();
    break;

  case 's':

    voice.pause();
    break;

  case 'd':

    voice.pause();
    break;
  case 'f':

    voice.pause();
    break;
  }
}




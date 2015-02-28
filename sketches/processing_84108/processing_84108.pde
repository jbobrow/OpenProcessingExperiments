
 import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput input;
AudioPlayer music;

Animation animation1;

FFT fftMusic;
int nbrBand=20;
int widthBand;

int tempsPasse;

void setup() {
  size(640, 400);

  smooth();
  colorMode(HSB, 255);
  rectMode(CORNERS);
  frameRate(24);
  animation1 = new Animation("glenckeck", 41);

  minim=new Minim(this);
  music = minim.loadFile("09 60's Cardin.mp3", 2048);
  input=minim.getLineIn();

  fftMusic = new FFT(music.bufferSize(), music.sampleRate());
  fftMusic.logAverages(10, 2);

  music.play();
}



void draw() {
  float v=abs(input.mix.get(0));

  fftMusic.forward(music.mix);

  int clr = 200;

  fill(0);
  rect(0, 0, width, height);
  float a=input.mix.get(0)*1000.;




  for (int i = 0; i < fftMusic.avgSize(); i++)
  {
    noStroke();
    color c = color(clr, 200, 255);
    fill(c);
    widthBand = width/nbrBand-5;
    float heightBand = height-50 - map(fftMusic.getAvg(i), 0, 2, 10, 20)-100;
    rect(i*widthBand, height, i*widthBand+widthBand, heightBand );

    clr= clr-9;
  }

  
  

  fill(fftMusic.getAvg(1)+25, 200, 255);
  ellipse(height/2+100, width/2-150, a*100, a*100);
  fill(fftMusic.getAvg(1)+200, 200, 255);
  ellipse(height/2+100, width/2-150, a*80, a*80);

  fill(fftMusic.getAvg(1)+60, 200, 255);
  ellipse(height/2+100, width/2-150, a*60, a*60);

  fill(fftMusic.getAvg(1)+160, 200, 200);
  ellipse(height/2+100, width/2-150, a*40, a*40);

  fill(fftMusic.getAvg(1), 200, 255);
  ellipse(height/2+100, width/2-150, a*20, a*20);
if (a<1000) {
a=0;

  animation1.display(0, height-168);
 }
} 



class Animation {
  PImage[] images;
  int imageCount;
  int frame;

  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename =  nf(i, 5) + ".png";
      images[i] = loadImage(filename);
    }
  }
  void display(float xpos, float ypos) {

    image(images[frame], xpos, ypos);
    frame++;
    if (frame==41)
      frame=0;
  }

  int getWidth() {
    return images[0].width;
  }
}




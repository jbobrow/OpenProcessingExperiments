
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;    
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;
float mixLevel;

color elemental[] = new color [5];

int num = 5;

float[] myX = new float [num];
float[] myY = new float [num];

//Drawing controls
float PRand = 8;
float sRand = 5;
float SS = 4;
float SSR = 4;


void setup() {



  size(600, 600);
  smooth();

  for (int i = num - 1; i >= 0; i--) {
    myX[i] = 0;
    myY[i] = 0;
  }

  elemental[0] = color (140, 30, 29);
  elemental[1] = color (212, 66, 31);
  elemental[2] = color (75, 138, 121);
  elemental[3] = color (208, 217, 105);
  elemental[4] = color (242, 140, 62);

  background (elemental[0]);


  minim = new Minim(this);   
  mySound = minim.loadFile("Fader.mp3");
  mySound.play();


  beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());
  beat.setSensitivity(10);
  kickSize = snareSize = hatSize = 0;
  bl = new BeatListener(beat, mySound);
}


void draw() {

  for (int i = 0; i < mySound.bufferSize() - 1; i += 5) {

    mixLevel = pow(mySound.mix.level()*5, 3);
    sRand = mixLevel;
    if (mixLevel <= 3) {
      sRand = 3;
    }
  }



  translate(width/2, height/2); 

  for (int i = num - 1; i >= 0; i--) {

    if ( beat.isKick() ) kickSize = 10;
    if ( beat.isSnare() ) snareSize = 10;
    if ( beat.isHat() ) hatSize = 10;

    println("mixLevel = " + mixLevel);

    println("kickSize = " + kickSize);

    myX[i] += random(-PRand, PRand); 
    myY[i] += random(-PRand, PRand); 


    //normal 
    noFill();
    stroke(elemental[2]);
    strokeWeight(1);

    //if beat
    if (beat.isKick() || beat.isSnare() || beat.isHat()) {
      noStroke();
      fill(elemental[1]);

      //if +5      
      if (mixLevel >= 5) {
        fill (elemental[4]);

        //if +10      
        if (mixLevel >= 10) {
          fill (elemental[3]);
        }
      }
    }
    scribble(myX[i], myY[i], mixLevel + kickSize, mixLevel+ kickSize);


    kickSize--;
    snareSize--;
    hatSize--;

    if (kickSize <= 0)  kickSize = 0;


    if (snareSize <= 0)  snareSize = 0;


    if (hatSize <= 0)  hatSize = 0;
  }



  if( beat.isSnare()) {
    noFill();
  }
}


void scribble (float x, float y, float sx, float sy) {
  beginShape();
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  curveVertex(x + (sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  curveVertex(x + (sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (-sy) + random (-sRand, sRand));
  curveVertex(x + (-sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  curveVertex(x + (sx) + random (-sRand, sRand),y + (sy) + random (-sRand, sRand));
  endShape();
}





void stop() {
  mySound.close();
  minim.stop();
  super.stop();
}



class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}



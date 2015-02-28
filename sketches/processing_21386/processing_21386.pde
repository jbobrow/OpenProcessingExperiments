
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;     
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize;

color elemental[] = new color [5];

void setup() {

  elemental[0] = color (75, 226, 242, 10);
  elemental[1] = color (242, 234, 114, 5);
  elemental[2] = color (244, 78, 80, 5);
  elemental[3] = color (34, 183, 242, 5);
  elemental[4] = color (36, 88, 191, 5);

  background (0);
  size(600, 600, P3D);


  minim = new Minim(this);    
  mySound = minim.loadFile("Magic.mp3"); 
  mySound.loop();
  mySound.mute();


  beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());
  beat.setSensitivity(10);
  kickSize = snareSize = hatSize = 0;
  bl = new BeatListener(beat, mySound);
}


void draw() {


  kickSize--;
  snareSize--;
  hatSize--;

  if (kickSize <= 0) {
    kickSize = 0;
  }
  if (snareSize <= 0) {
    snareSize = 0;
  }
  if (hatSize <= 0) {
    hatSize = 0;
  }


  if ( beat.isKick() ) kickSize = 50;
  if ( beat.isSnare() ) snareSize = 50;
  if ( beat.isHat() ) hatSize = 50;

  rectMode(CORNER);
  fill (0, 2);
  rect (-1000, -1000, 10000, 10000);

  blend(0, 0, width, height, 0, 0, width, height, BLEND);

  translate(width/2, height/2, 0);



  for (int i = 0; i < mySound.bufferSize() - 1; i += 5) {

    float leftLevel = pow(mySound.left.level()*10, 3);
    float rightLevel = pow(mySound.right.level()*10, 3);
    float mixLevel = pow(mySound.mix.level()*10, 3);

    //Dark Blue Ellipse (Beat driven)
    if( beat.isKick()) {
      noFill();
      strokeWeight(2);
      ellipseMode(CENTER);
      stroke(elemental[4]);
      ellipse (0, 0, 300 + kickSize, 300 + kickSize);
    }
    //White Ellipse (Beat driven)
    if( beat.isSnare()) {
      noFill();
      ellipseMode(CENTER);
      stroke(255, 5);
      ellipse (0, 0, 200 + kickSize, 200 + kickSize);
    }

    rotateX(frameCount*0.05);
    rotateY(frameCount*-0.02);
    rotateZ(frameCount*-0.02);

    //White Ellipse (Level driven)
    noFill();
    ellipseMode(CENTER);
    strokeWeight(2);
    stroke(242, 202, 82,5);
    ellipse ( 0, 0, leftLevel + 100, 100 + leftLevel);

    //Turquoise box
    noStroke();
    fill (elemental[0]);
    box(50 +mixLevel/5, 50, 50);

    //Red box
    fill (elemental[2]);
    pushMatrix();
    translate (rightLevel, 0, 0);
    box(50 +rightLevel/5, 50, 50);
    popMatrix();

    // Blue box
    fill (elemental[3]);
    pushMatrix();
    translate (-leftLevel, 0, 0);
    box(50 +leftLevel/5, 50, 50);
    popMatrix();
  }
}



void stop() {
  mySound.close();
  minim.stop();
  super.stop();
}

void keyPressed()
{
  if ( key == 'm' )
  {
    if ( mySound.isMuted() )
    {
      mySound.unmute();
    }
    else
    {
      mySound.mute();
    }
  }
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



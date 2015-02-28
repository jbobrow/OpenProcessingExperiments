

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize,rotateKick,rotateSnare,rotateHat,speed,speedmax,opacity,opacitymax;
boolean playSwitch = false;

void setup()
{
  size(250,250, P3D);

  minim = new Minim(this);

  song = minim.loadFile("Tea Leaf Dancers.mp3", 512);
  
  // a beat detection object that is FREQ_ENERGY mode that 
  // expects buffers the length of song's buffer size
  // and samples captured at songs's sample rate
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  // set the sensitivity to 300 milliseconds
  // After a beat has been detected, the algorithm will wait for 300 milliseconds 
  // before allowing another beat to be reported. You can use this to dampen the 
  // algorithm if it is giving too many false-positives. The default value is 10, 
  // which is essentially no damping. If you try to set the sensitivity to a negative value, 
  // an error will be reported and it will be set to 10 instead. 

  beat.setSensitivity(10);
  kickSize = snareSize = hatSize = speed= opacity= 50;
  opacitymax=speedmax=255;

  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);

  rotateKick=rotateSnare=rotateHat=0;
}

void draw(){
if(!playSwitch) {
    song.pause();  
    background(0,0,0);
  }
  if (playSwitch) {
    song.play();
  }

  noStroke();
  fill(0,0,0,opacity);
  rect(0,0,width,height);


  if ( beat.isKick() ) kickSize = 100;
  if ( beat.isSnare() ) snareSize = 100;
  if ( beat.isHat() ) hatSize = 100;

  pushMatrix();
  translate(125,125);
  rotate(radians(rotateKick));
  strokeWeight(kickSize);
  stroke(255,snareSize,hatSize,kickSize);
  ellipseMode(CENTER);
  ellipse(0,0,10,10);
  rotateKick+=kickSize/speed;
  popMatrix();

  pushMatrix();
  translate(125,125);
  rotate(radians(rotateSnare));
  strokeWeight(snareSize);
  stroke(kickSize,255,hatSize,snareSize);

  ellipseMode(CENTER);
  ellipse(30,30,10,10);
  rotateSnare+=snareSize/speed;
  popMatrix();

  pushMatrix();
  translate(125,125);
  rotate(radians(rotateHat));
  strokeWeight(hatSize);
  stroke(kickSize,snareSize,255,hatSize);
  ellipseMode(CENTER);
  ellipse(85,85,hatSize,hatSize);
  rotateHat+=hatSize/speed;
  popMatrix();

  if (keyPressed) {
    if (key=='.') {
      opacity++;

      if (opacity>opacitymax) {
        opacity=opacitymax;
      }
    }
    if (key=='n') {

      speed--;
      if (speed<=1) {

        speed=1;
      }
    }
    if (key=='m') {

      speed++;
      if (speed>speedmax) {

        speed=speedmax;
      }
    }
    if (key==',') {
      opacity--;

      if (opacity<=1) {
        opacity=1;
      }
    }
  }

  println (opacity+" "+ speed);
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}

void keyPressed() {
  if(key==' ') {

    if(!playSwitch) {
      playSwitch=true;
    }
    else if(playSwitch) {
      playSwitch=false;
    }
  }
}

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source)
  {
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



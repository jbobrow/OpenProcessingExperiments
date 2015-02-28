
import ddf.minim.*;
import ddf.minim.analysis.*;
import beads.*;

//declare beat detection class from minim
BeatDetect beat;

Ball[] balls = new Ball[7];

//declare Beads classes
AudioContext ac; //audio set up for Beads
SamplePlayer[] sp; //plays a sample, or audio file
Glide[] gl; //transition smoothly over values; will be used to control gain
Gain[] gains; //ratio of signal output to signal input, basically volume
ScalingMixer mixer; //scales gain and passes it to output
int bufSize = 2048; //buffer size is amount of time allotted for processing audio info

float w, e;


void setup() {
  size(512, 600, P3D); //P3D is the fastest render mode

  //define Beads classes
  ac = new AudioContext(bufSize); //create new AudioContext with buffer size bufSize
  sp = new SamplePlayer[7];
  gl = new Glide[7]; 
  gains = new Gain[7];
  mixer = new ScalingMixer(ac);

  // Load each sample
  try {
    sp[0] = new SamplePlayer(ac, new Sample(sketchPath("")+"data/drum.mp3"));
    sp[1] = new SamplePlayer(ac, new Sample(sketchPath("")+"data/hihat.mp3"));
    sp[2] = new SamplePlayer(ac, new Sample(sketchPath("")+"data/cowbell.mp3"));
    sp[3] = new SamplePlayer(ac, new Sample(sketchPath("")+"data/bells.mp3"));
    sp[4] = new SamplePlayer(ac, new Sample(sketchPath("")+"data/humming.mp3"));
    sp[5] = new SamplePlayer(ac, new Sample(sketchPath("")+"data/wub.mp3"));
    sp[6] = new SamplePlayer(ac, new Sample(sketchPath("")+"data/dun.mp3"));
  } 
  catch (Exception e) { //what to do if samples don't work
    e.printStackTrace();
    exit();
  }

  for (int i=0; i<gains.length; i++) {
    // By default the audio starts playing immediately, so we pause it
    sp[i].pause(true);
    // make sure sample player doesn't kill itself at the end of the sample so that it will loop
    sp[i].setKillOnEnd(false);
    // set the loop type to play forwards
    sp[i].setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
    // Tell Glide class to start at 0 and "glide" to the next value over 20 ms
    gl[i] = new Glide(ac, 0.0, 20);
    // Set up a gain control for each sample player
    gains[i] = new Gain(ac, 1, gl[i]);
    // send the output of sample player i to the input of gain i
    gains[i].addInput(sp[i]);
    // send the output of gain i to the input of a mixer
    mixer.addInput(gains[i]);
  }
  // send the output of the mixer to the input of the sound card
  ac.out.addInput(mixer);
  ac.start();

  //minim class for detecting beats
  beat = new BeatDetect();

  //set colors for balls
  for (int l=0; l<sp.length; l++) {
    colorMode(HSB);
    balls[l] = new Ball(0, 50+l*50, (l*255)/(sp.length), 255, 255);
  }
}

//start samples when space bar is pressed
void keyPressed() {
  if (key == ' ') {
    for (int i=0; i<sp.length; i++) {
      sp[i].start();
    }
  }
}

void draw()
{
  background(0);

  //draw rainbow colored waveforms that become thicker when beats are detected
  for (int l=0; l<sp.length; l++) {
    stroke((l*255)/(sp.length), 255, 255);
    beat.detect(sp[l].getOutBuffer(0));
    if (beat.isOnset()) {
      strokeWeight((3*balls[l].volume)+2);
    }
    else {
      strokeWeight(2);
    }
    //draw a line with y depending on the buffer value from the sample players
    for (int i=0; i<bufSize-1;i++) {
      line(i, (50+l*50)+sp[l].getValue(0, i)*70*gains[l].getGain(), i+1, (50+l*50)+sp[l].getValue(0, i+1)*70*gains[l].getGain());
    }

    //draw the balls
    balls[l].draw();
    //set gain depending on x position of balls
    gains[l].setGain(balls[l].volume);

    //draw combined waveform at the bottom
    for (int i=0; i<bufSize-1;i++) {
      stroke((l*255)/(sp.length), 255, 255, 800*(balls[l].volume));
      strokeWeight((balls[l].volume)+2);
      w=sp[l].getValue(0, i)*200*gains[l].getGain();
      e=sp[l].getValue(0, i+1)*200*gains[l].getGain();
      line(i/4, 475+w, (i+1)/4, 475+e);
    }
  }
}


class Ball {

  float x, y, H, S, B, d, D;
  float easing=0.07;
  float volume;

  //ball depends on x, y, and HSB values defined outside the class
  Ball(float x0, float y0, float H0, float S0, float B0) {
    x=x0;
    y=y0;
    H=H0;
    S=S0;
    B=B0;
  }

  void draw() {
    for (int l=0; l<sp.length; l++) {
      //get output from buffer from the sample players to see if there is a beat
      beat.detect(sp[l].getOutBuffer(0));
      if (beat.isOnset()) {
        //if there is a beat, ball gets bigger and stroke gets thicker depending on volume
        strokeWeight(2+volume);
        d=30+(5*volume);
      }
      else {
        strokeWeight(2);
        d=30;
      }
      stroke(H, S, B);
      fill(0);
      ellipse(x, y, d, d);
      //define values for volume, whic used to set the gain and other values in the main tab
      volume=x/width;

      //constrain balls to screen
      if (x !=constrain(x, d, width-d)) {
        x=constrain(x, 0, width);
      }

      //adjust x position of balls based on mouse position when clicked (with easing)
      if (mousePressed && abs(mouseY-y)<25) {
        float vx=(mouseX-x)*easing;
        x+=vx;
      }
    }
  }
}





import ddf.minim.*;
import ddf.minim.signals.*;
PImage bg;
Minim minim;
AudioOutput out;
//SineWave sine;
AudioSample playerrain;
AudioSample playerbird;
AudioSample playerwave;
AudioSample playerfire;
AudioSample player;
AudioSample track;


void setup() {
  size(400,400);
 bg = loadImage("bg1.jpg");
  minim = new Minim(this);
  // get a line out from Minim, default bufferSize is 1024, default sample rate is 44100, bit depth is 16
  // out = minim.getLineOut(Minim.STEREO);
  // create a sine wave Oscillator, set to 261.63 Hz, at 0.5 amplitude, sample rate from line out
  //sine = new SineWave(261.63, 0.5, out.sampleRate());
  // set the portamento speed on the oscillator to 50 milliseconds
  // sine.portamento(50);
  // add the oscillator to the line out
  //out.addSignal(sine);
  playerrain = minim.loadSample("rain.wav");
  playerbird = minim.loadSample("bird.mp3");
  playerwave = minim.loadSample("wave.wav");
  playerfire = minim.loadSample("fire.wav");


  //  println(player.getControls());
  //player.shiftGain(-80.0, 0.0, 10000);

  //player.setGain(-20.0);
}




void draw() {

  background(bg); 
  noStroke();
  smooth();

  float xref = width/2;
  float yref = height;
  float x = xref-mouseX;  
  float y = yref-mouseY;
  float r = sqrt(x*x+y*y);




  fill(232, 221, 203);
  ellipse(mouseX, mouseY, 30, 30);
}


void mouseMoved() {
  float xref = width/2;
  float yref = height/2;
  float x = mouseX;  
  float y = mouseY;

  float freq;

  if (x<133&&y<133)
  { 


    player=playerfire;

    //player.trigger();
  }



  else if (x<133&&y>266)
  { 
    player=playerwave;
    //player.trigger();
  }
  else if (x>266&&y<133)
  { 

    player=playerbird;
    //player.trigger();
  }
  else if(x>266&&y>266){ 
    player=playerrain;
    //player.trigger();
  }
  
  else{ player.stop();}
  if (player==track){}
  else{player.stop();
  player.trigger();}
  track=player;
  //player.trigger();
  // sine.setFreq(freq);
}


void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  minim.stop();

  super.stop();
}



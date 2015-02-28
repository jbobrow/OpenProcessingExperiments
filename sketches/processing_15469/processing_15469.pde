
/*
IMAGES TUTORIAL
*/
PImage img;
import ddf.minim.*;
import ddf.minim.signals.*; // import signals from minim library
 
Minim minim;
AudioOutput Aout; // define audio out as a variable Aout
SineWave squiggly; // define a sine wave called squiggly

void setup (){
size (450,600);
img = loadImage("mustache.jpg"); // Load image from data folder
minim = new Minim(this);
  Aout = minim.getLineOut(Minim.STEREO); // send audio out from Minim, default 1024 samples at 44100 Hz, 16 bit
  squiggly = new SineWave(0, 0.5, Aout.sampleRate()); // create a sine wave at 440 Hz, 0.5 amp, sample rate from audio out
  Aout.addSignal(squiggly); // send the oscillator to the audio out
}

void draw(){

  image(img,0,0,width,height); // define size/location of image
  fill(0);
  textAlign(CENTER);
  text("This dude is rockin a killer ________!!", 225, 50);
  textSize(20);
  stroke(0);
  strokeWeight(3);
  strokeJoin(BEVEL);
  line(30,25,420,25);
  line(30,60,420,60);
  line(420,25,420,60);
  line(30,25,30,60);
  if(keyPressed==true){
    stroke(50);
    strokeWeight(50);
    ;
  }
  else{
  stroke(200);
  strokeWeight(10);
  }
  stroke(255);
  text(key,225,300);
  ;
}


void keyPressed()
{
  if(key == 'm') 
  {
    float freq = 261.63;
  squiggly.setFreq(freq);
  }
  if(key == 'u') 
  {
    float freq = 293.66;
    squiggly.setFreq(freq);
  }
  if(key == 's') 
  {
    float freq = 329.63;
  squiggly.setFreq(freq);
  }
  if(key == 't') 
  {
    float freq = 349.23;
  squiggly.setFreq(freq);
  }
  if(key == 'a') 
  {
    float freq = 392.00;
  squiggly.setFreq(freq);
  }
  if(key == 'c') 
  {
    float freq = 440.00;
  squiggly.setFreq(freq);
  }
  if(key == 'h') 
  {
    float freq = 493.88;
  squiggly.setFreq(freq);
  }
    if(key == 'e') 
  {
    float freq = 523.25;
  squiggly.setFreq(freq);
  }
}
 
void stop()
{
  Aout.close();
  minim.stop();
  super.stop();
}




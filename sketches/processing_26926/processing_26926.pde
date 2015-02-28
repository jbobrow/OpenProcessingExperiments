
import ddf.minim.*; // import the minim sound library in Processing
import ddf.minim.signals.*; // import signals from minim library
 
Minim sounds; // declare Minim variable
AudioOutput Aout; // define audio out as a variable Aout
SineWave squiggly; // define a sine wave called squiggly
int r = 24;
int x = 10;
int y = 10;
int rectWidth =500;
int rectHeight = 500;
float a = 0.0;
float inc = TWO_PI/25.0;
 
void setup() {
  size (500,500,P3D);
  smooth();
  strokeWeight(1);
  sounds = new Minim(this);
  Aout = sounds.getLineOut(Minim.STEREO); // send audio out from Minim, default 1024 samples at 44100 Hz, 16 bit
  squiggly = new SineWave(440, 0.5, Aout.sampleRate()); // create a sine wave at 440 Hz, 0.5 amp, sample rate from audio out
  Aout.addSignal(squiggly); // send the oscillator to the audio out
}
 
void draw () {
  frameRate(r);
  noStroke();
  squiggly.portamento(200);
 background(0);
    
  float rotationx = mouseX * (0.0015);
  float rotationy = mouseY * (0.0015);
  float rotationz = mouseY * mouseX * (0.00001);
  float wave = mouseX * (0.005);
 
    
  pushMatrix();
  translate(250, 250, -100);
    
  for(int instance = 1; instance <= 200; instance=instance+4)
  {
     
    rotateY(rotationy);
    rotateZ(rotationz);
     
    pushMatrix();
    for(int i=0; i<200; i=i+4) {
    {
      rotateX(rotationx);
      
        stroke(255);
        translate(0, 0, -10);
  point(i,1+sin(a)*wave);
  a = a + inc;
      }
    }
    popMatrix();
      
  }
    
  popMatrix();
   
 
  println(mouseX + " " + mouseY + " ");
  if ((x < mouseX) && (mouseX < (x + rectWidth)) && (y < mouseY) && (mouseY < (y+rectHeight))) {//if mouse is inside center square do the following:
    if ((x < pmouseX) && (pmouseX < (x + rectWidth)) && (y < pmouseY) && (pmouseY < (y+rectHeight))) {
      if(mousePressed == false) {
        float freq = map(mouseX, x, (x+rectWidth), 500, 60); // frequency is scaled from height of display window to between 60 and 1500 Hz
        squiggly.setFreq(freq);//set frequency depending on horizontal position of mouse
        float vol = map(((y+rectHeight)-mouseY), y, (y+rectHeight), -20, 0);
        Aout.setGain(vol);//set volume depending on vertical position of mouse
      }
      else {//if mouse is not pressed do the following:
        Aout.setGain(-80);//turn volume to inaudible
      }
    
    }
  }
}


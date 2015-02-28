
ArrayList lines;
import ddf.minim.*; // import the minim sound library in Processing
import ddf.minim.signals.*; // import signals from minim library

Minim sounds; // declare Minim variable
AudioOutput Aout; // define audio out as a variable Aout
SineWave squiggly; // define a sine wave called squiggly

void setup() {
  size(400, 400);
  smooth();
  noStroke();

  sounds = new Minim(this);
  Aout = sounds.getLineOut(Minim.STEREO); // send audio out from Minim, default 1024 samples at 44100 Hz, 16 bit
  squiggly = new SineWave(440, 0.5, Aout.sampleRate()); // create a sine wave at 440 Hz, 0.5 amp, sample rate from audio out
  Aout.addSignal(squiggly); // send the oscillator to the audio out

  // Create an empty ArrayList
  lines = new ArrayList();
  lines.add(new Line(width, height, width, height));
}

void draw() {
  background(255);
  squiggly.portamento(200);

  for (int i = lines.size()-1; i >= 0; i--) { 
    Line seg = (Line) lines.get(i);
    seg.display();
    if (seg.finished()) {
      lines.remove(i);
    }
  }
  if(mousePressed && mouseX>0 && width>mouseX && mouseY>0 &&height>mouseY) {
    lines.add(new Line(mouseX, mouseY, pmouseX, pmouseY));
    float freq = map(mouseX, 0, width, 500, 60); // frequency is scaled from height of display window to between 60 and 1500 Hz
    squiggly.setFreq(freq);//set frequency depending on horizontal position of mouse
    float vol = map((height-mouseY), 0, height, -20, 0);
    Aout.setGain(vol);//set volume depending on vertical position of mouse
  }
  else {//if mouse is not pressed do the following:
    Aout.setGain(-80);//turn volume to inaudible
  }
}


class Line {

  float x;
  float y;
  float oldX;
  float oldY;
  float life = 255;

  Line(float tempX, float tempY, float tempOldX, float tempOldY) {
    x = tempX;
    y = tempY;
    oldX = tempOldX;
    oldY= tempOldY;
  }


  boolean finished() {
    // line fades out
    float quicker = map (y, 0, height, 0, 4);
    life-=1.5*quicker;
    if (life < 0) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    // Display the line
    stroke(0,life);
    float lineWeight = map (y, 0, height, 40, 0);
    strokeWeight(lineWeight);
    line(x,y,oldX,oldY);
  }
}  



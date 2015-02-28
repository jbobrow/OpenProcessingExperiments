
// A Very simple Crayon Etching(http://www.how-to-arts-and-crafts.com/crayon-etching.html) simulator
// The dark backgroung is used to emulate the indian ink.
// Also the painter has a synth attached, and will produce sounds while you make your drawing
// the saound genarate is related to the color generated
// Use + or - keys to increase/decrease the size of the "etching tool"
// Use < or > keys to decrease/increase color brightness
// The keys for number 0, 1, 2, 3, 4, 5 will change the waveform of the sound generator
import ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave;
ADSR adsr;

float amp = 0;
float freq = 0;
float maxAmp = 1.0;
float attTime = 0.01;
float decTime = 0.05;
float susLvl = 0.05;
float relTime = 0.05;
int strokeSize = 5;
int brightness = 100;

void setup() {
  size(1280, 720);
  background(#000000);
  colorMode(HSB, width, height, 100);
  noStroke();
  smooth();
  frameRate(20);
  
  minim = new Minim(this);
  
  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
  
  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  wave = new Oscil(440, 1, Waves.PHASOR);
                    
  adsr = new ADSR(maxAmp, attTime, decTime, susLvl, relTime);
  
  wave.patch(adsr);
}

void draw() {
  if(mousePressed) {
    fill(mouseX, mouseY, brightness);
    ellipse(mouseX, mouseY, strokeSize, strokeSize);
    
    amp = map( mouseY, 0, height, 1, 0 );
    wave.setAmplitude( amp );
    
    freq = map( mouseX, 0, width, 110, 880 );
    wave.setFrequency( freq );
    println(adsr.getLastValues());
  }
  fill(#ffffff, 30);
  textSize(17);
  text("* Stroke size: +(increase) -(decrease)", 10, height-60);
  text("* Brightness: >(increase) <(decrease)", 10, height-40);
  text("* Waveform: 0(phasor), 1(sine), 2(triangle), 3(saw), 4(square), 5(quarter pulse)", 10, height-20);
}

void keyPressed() {
  switch( key )
  {
    case '0':
      wave.setWaveform(Waves.PHASOR);
      break;
    case '1': 
      wave.setWaveform(Waves.SINE);
      break;
    case '2':
      wave.setWaveform(Waves.TRIANGLE);
      break;
    case '3':
      wave.setWaveform(Waves.SAW);
      break;
    case '4':
      wave.setWaveform(Waves.SQUARE);
      break;
    case '5':
      wave.setWaveform(Waves.QUARTERPULSE);
      break;
    case '+':
      if (strokeSize < 30) 
        strokeSize++;
      attTime = map(strokeSize, 0, 30, 0.1, 0.01);
      break;
    case '-':
      if(strokeSize > 0)
        strokeSize--;
      attTime = map(strokeSize, 0, 30, 0.1, 0.01);
      break;
    case '>':
      if(brightness < 100) 
        brightness+=5;
      decTime = map(brightness, 0, 100, 0.1, 0.01);
      break;
    case '<':
      if(brightness > 0) 
        brightness-=5;
      decTime = map(brightness, 0, 100, 0.1, 0.01);
      break;
    default: break; 
  }
  
  updateAdsr();
}

void mousePressed() {
  adsr.noteOn();
  adsr.patch(out);
}

void mouseReleased() {
  adsr.unpatchAfterRelease( out );
  adsr.noteOff();
}

void updateAdsr() {
  adsr.setParameters(maxAmp, attTime, decTime, susLvl, relTime, 0, 0);
}




import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;

//Audio signal
AudioOutput out;

//Waveforms
SquareWave square;
SawWave saw;

//Effects
LowPassSP lowSP;
LowPassFS lowFS;
BandPass band;
HighPassSP highSP;
NotchFilter notch;


//Font for text
PFont font;

void setup(){
  size (1000, 500);
  font = loadFont("CenturySchoolbook-28.vlw");
  textFont(font);
  minim = new Minim(this);
  out = minim.getLineOut();
  
  // create a SquareWave with a frequency of 440 Hz, 
  // an amplitude of 1 and the same sample rate as out
  square = new SquareWave(500, 1, 44100);
  saw = new SawWave(210, 1, 44100);
  
  // create a LowPassSP filter with a cutoff frequency of 200 Hz 
  // that expects audio with the same sample rate as out
  lowFS = new LowPassFS(200, 44100);
  lowSP = new LowPassSP(200, 44100);
  highSP = new HighPassSP(800, 44100);
  band = new BandPass(300, 200, 44100);
  notch = new NotchFilter(200, 200, 44100);
  
  
  // attach signals to output
  out.addSignal(square);
  out.addSignal(saw);
  }
  
  // Prints the instructions and draws the waveform.
  void draw(){
    stroke(#FFFF00);
    background(100); 
      text("There are 2 tones being played.\n"
  + "The X mouse axis changes the pitch of the square wave.\n"
  + "The Y mouse axis changes the pitch of the saw wave.\n"
  + "Press 1, 2, 3, 4 or 5 to toggle low-pass SP filter, high-pass SP filter,\n"
  + "low-pass FS filter, band pass filter, or notch filter, respectively.\n"
  + "The waveform below is updated in real time. ", 15, 30);
    
   // To draw the waveform, I took the frequency values returned by the audio out
   // and connected them with a line. I had to multiply each by 50 to make sure it
   // showed sufficient differentiation between values.
    for(int i = 0; i < out.bufferSize() - 1; i++)
    {
    line(i, 300 + out.left.get(i)*50, i+1, 300 + out.left.get(i+1)*50);
    line(i, 400 + out.right.get(i)*50, i+1, 400 + out.right.get(i+1)*50);
    }
  }
  
  //Sets the frequency of the waveforms based on mouse pointer location
  void mouseMoved() {
    square.setFreq(200+mouseX);
    //square.setPan((float)((mouseX/400)-1));
    saw.setFreq(200+mouseY);
    //saw.setPan((float)((mouseY/250)-1));
  }
  
// Listens for key presses and toggles the appropriate effect  
void keyPressed() {
  if (key == '1') {
   toggleEffect(lowSP);
  }
  else if (key == '2'){
   toggleEffect(highSP);
 } 
 else if (key == '3'){
   toggleEffect(lowFS);
 } 
 else if (key == '4'){
   toggleEffect(band);
 } 
 else if (key == '5'){
   toggleEffect(notch);
 } 
}
// Turns the effect on or off
void toggleEffect(AudioEffect effect){
    if (out.hasEffect(effect)){
      out.removeEffect(effect);
    }
    else{
      out.addEffect(effect);
    }
  }
  
  // Stops the program
  void stop(){
    out.close();
    minim.stop();
    super.stop();
  }



// Additive_01.pde
// import the beads library
import beads.*;
// create our AudioContext
AudioContext ac;
// declare our unit generators (Beads) since we will need to 
// access them throughout the program
WavePlayer wp1;
Glide frequencyGlide1;
WavePlayer wp2;
Glide frequencyGlide2;
Gain g;



void setup()
{
  size(400, 300);
// initialize our AudioContext
ac = new AudioContext();
// create frequency glide object
// give it a starting value of 20 (Hz)
// and a transition time of 50ms
frequencyGlide1 = new Glide(ac, 20, 50);
// create a WavePlayer, attach the frequency to 
// frequencyGlide
wp1 = new WavePlayer(ac, frequencyGlide1, Buffer.SINE);
// create the second frequency glide and attach it to the 
// frequency of a second sine generator
frequencyGlide2 = new Glide(ac, 20, 50);
wp2 = new WavePlayer(ac, frequencyGlide2, Buffer.SINE);
// create a Gain object to make sure we don't peak
g = new Gain(ac, 1, 0.5);
// connect both WavePlayers to the Gain input
g.addInput(wp1);
g.addInput(wp2);
// connect the Gain output to the AudioContext
ac.out.addInput(g);
// start audio processing
ac.start();

frameRate(200);
background(255);

}//end of setup




void draw()
{
  // update the frequency based on the position of the mouse 
// cursor within the Processing window


//draws and plays
if (mousePressed == true){

frequencyGlide1.setValue(mouseY);
frequencyGlide2.setValue(mouseX);

  
    fill(random(255),random(255),random(255));
    noStroke();
    smooth();
    ellipse(mouseX, mouseY, 5, 5);
  }//end of if
  
  if (mousePressed == false){
  frequencyGlide1.setValue(0);
frequencyGlide2.setValue(0);
    
  }//end of false if

}//end of draw




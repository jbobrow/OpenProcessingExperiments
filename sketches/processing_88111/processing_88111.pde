
PImage a;  // Declare variable "a" of type PImage
import ddf.minim.*;
Minim minim;
AudioSample kick;
AudioSample snare;
void setup() {
  size(1000, 600);
  // The file "jelly.jpg" must be in the data folder
  // of the current sketch to load successfully
  a = loadImage("nano.jpg");  // Load the image into the program  
  noLoop();  // Makes draw() only run once
  
   minim = new Minim(this);
 
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
 
 
 
  // load BD.wav from the data folder
  kick = minim.loadSample( "bad wolf theme.mp3", 512);
  // we request a buffer size of 512 to improve the latency.
  // this will make the triggering of the samples sound more responsive.
  // on some systems, this might be too small and the audio 
  // will sound corrupted, in that case, you can just increase
  // the buffer size.
  if ( kick == null ) println("Didn't get kick!");
  
  // load SD.wav from the data folder
  snare = minim.loadSample("10 - hologram.mp3", 512);
  if ( snare == null ) println("Didn't get snare!");
}
 
void draw() {
  // Displays the image at its actual size at point (0,0)
  image(a, 0, 0); 
 
  // use the mix buffer to draw the waveforms.
  for (int i = 0; i < kick.bufferSize() - 1; i++)
  {
   
    
  }
  
 
}
void keyPressed()
{
  if ( key == 's' ) snare.trigger();
  if ( key == 'k' ) kick.trigger();
}
void mousePressed()
{
  if ( mousePressed ) snare.trigger();
}
 
 
void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();
  snare.close();
  minim.stop();
 
  super.stop();
}

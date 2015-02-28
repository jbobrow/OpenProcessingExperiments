


/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/43660*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
    TUIO MuStick-Cam
    Ian Oakley (ian@uma.pt) - Embodied Interaction 2010, 2011
    Madeira Interactive Technologies Institute (http://www.m-iti.org)
*/

// ---------------------------------------------------------------

/*
The fullscreen library
*/
import fullscreen.*;  
import codeanticode.gsvideo.*;
FullScreen fs; 
import beads.*;

// ---------------------------------------------------------------

/*
Import and variables for the beads audio library
*/
import beads.*;
AudioContext ac;
Envelope rateEnvelope;

// ---------------------------------------------------------------

/*
Two helper math functions that decrease and increase a variable up until a limit
*/
float capMax(float current, float maximum, float changeRate)
  {if (current+changeRate<maximum) current+=changeRate;
  else current= maximum; 
  return current;}
float capMin(float current, float minimum, float changeRate)
  {if (current-changeRate>minimum) current-=changeRate;
  else current= minimum; 
  return current;}

// ---------------------------------------------------------------

/*
Global variables to coordinate the playback speed - the last time we check the sensor and the current sample speed
*/
int lastTime;
float sampleSpeed=1;

// ---------------------------------------------------------------

/*
Initialise the sketch
*/
void setup() {
  /*
  Set the window size
  */
  size(640,480);
  
  /*
  Init and start the fullscreen - don't do this when you are debuging  remove the 'enter' line 
  (aside: you can exit fullscreen by pressing escape (at least on my mac))
  */
  fs = new FullScreen(this);
  fs.setResolution(640, 480);
  //fs.enter();
 
  /*
  Create the camera video sensor input including initialisation of data structures
  */
  initVideo();
  video.start();
  
  /*
  Init the audio context and player with a file (open a file selection box)
  */
  AudioContext ac;
  ac = new AudioContext();
  String audioFile = selectInput();
  SamplePlayer player = new SamplePlayer(ac, SampleManager.sample(audioFile));
  player.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
  
  /*
  Set up the audio envelope that controls the playback rate
  */
  rateEnvelope = new Envelope(ac, 1);
  player.setRateEnvelope(rateEnvelope);   
   
  /*
   Add gain (volume) and start the playboack
   */
  Gain g = new Gain(ac, 2, 0.2);
  g.addInput(player);  
  ac.out.addInput(g);
  ac.start();
}

// ---------------------------------------------------------------


/*
Draw - called each time the screen is drawn (30-60 times per second)
*/
void draw() 
  {
  /*
  Parameters configuring response to sensor input
  */
  int timePeriod = 200; // how long between examining the sensor (ms)
  float changeRate = 0.1; // how rapidly the playback speed will change (device specific units)
  float sensorThreshold = 15; // the value we consider to be 'fast' movement (device specific units)
  float maximum = 1.0; // the maximum sameple speed (1 is normal speed)
  float minimum = 0.2; // the minimum sample speed (before stopping the music)
  
  /*
  Get the time and figure if we should get more data from the sensor
  */
  int now = millis();
  if (now-timePeriod > lastTime)
    {
    /*
    Get input from the sensor
    */
    int sensorInput = getCameraSensorInput(); // a camera in this case - this method also draws to the screen
  
    /*
    If sensor input exceeds a threshold, increase the sampleSpeed. Otherwise, decrease it
    */
    
    
    if (sensorInput < 12)
      sampleSpeed = capMax(sampleSpeed,0.2, changeRate);
    else if (sensorInput > 12 && sensorInput < 23)
    sampleSpeed = capMax(sampleSpeed,0.4, changeRate);
     else if (sensorInput > 23 && sensorInput < 34)
    sampleSpeed = capMax(sampleSpeed,0.6, changeRate);
     else if (sensorInput > 34 && sensorInput < 50)
    sampleSpeed = capMax(sampleSpeed,0.8, changeRate);
     else if (sensorInput > 50)
    sampleSpeed = capMax(sampleSpeed,1, changeRate);
    
    
    
    if (sensorInput > sensorThreshold)
      sampleSpeed = capMax(sampleSpeed, maximum, changeRate);
    else
      sampleSpeed = capMin(sampleSpeed, minimum, changeRate); 
    
    
    /*
    When the sample is playing, adjust the speed according to level of movement
    In the case of very slow movement, stop the sample */
  
    if (ac.isRunning())
      {
      if (sampleSpeed <= minimum)
        ac.stop(); 
      else
        rateEnvelope.addSegment(sampleSpeed, 1);  
      }
    /*
    Otherwise, the sample must be stopped, so if speed in above minimum, start it again!
   
    else if (sampleSpeed > minimum) 
      {
      ac.start(); 
      rateEnvelope.addSegment(sampleSpeed, timePeriod);  
      } 
    
    /*
    Update the stored time variable
    */
    lastTime = now;
    }
  }


  



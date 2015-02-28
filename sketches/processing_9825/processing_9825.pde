
//Importing Minim
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;

//Setting up tracks to play
AudioPlayer fuwaFuwa;
AudioPlayer noGuitar;
AudioPlayer noBass;
AudioPlayer noKeys;
AudioPlayer noDrums;
AudioPlayer noVocals;

//Import class for waveform
WaveformRenderer waveform;

void setup()
{
  //creating the screen
  size (600, 300, P3D);
  
  minim = new Minim(this);
  
  //Importing tracks  
  fuwaFuwa = minim.loadFile("01 - Fuwa Fuwa Time.mp3", 2048);
  noGuitar = minim.loadFile("05 - Fuwa Fuwa Time (Instrumental - No Guitar).mp3", 2048);
  noBass = minim.loadFile("07 - Fuwa Fuwa Time (Instrumental - No Bass).mp3", 2048);
  noKeys = minim.loadFile("06 - Fuwa Fuwa Time (Instrumental - No Keyboard).mp3", 2048);
  noDrums = minim.loadFile("08 - Fuwa Fuwa Time (Instrumental - No Drums).mp3", 2048);
  noVocals = minim.loadFile("03 - Fuwa Fuwa Time (Instrumental).mp3", 2048);
  
  waveform = new WaveformRenderer();
  //relate waveform to track
  fuwaFuwa.addListener(waveform);
}

void draw()
{
  //make background colour black
  background(0);
  //drawing waveform
  waveform.draw();
  
  //playing tracks
  fuwaFuwa.play();
  noGuitar.play();
  noBass.play();
  noKeys.play();
  noDrums.play();
  noVocals.play();
  
  //make sure tracks not heard are still playing, but in mute
  noGuitar.mute();
  noBass.mute();
  noKeys.mute();
  noDrums.mute(); 
  noVocals.mute();
  
  //using method created further down the page
  keyPressed();
  
  //creating text for the screen
  text ("Press 'v' to remove vocals", 5, 20);
  text ("Press 'g' to remove guitar and vocals", 5, 40);
  text ("Press 'b' to remove bass and vocals", 5, 60);
  text ("Press 'k' to remove keyboard and vocals", 5, 80);
  text ("Press 'd' to remove drums and vocals", 5, 100);
  text ("Press 'n' to return to normal", 5, 120);
      
}
//new method
void keyPressed()
{
  //plays "no vocal" track
  if (key == 'v')
    {   
      fuwaFuwa.mute();
      noGuitar.mute();
      noBass.mute();
      noKeys.mute();
      noDrums.mute();
      noVocals.unmute();
    }
  //plays "no guitar" track
  if (key == 'g')
  {   
    fuwaFuwa.mute();
    noVocals.mute();
    noBass.mute();
    noKeys.mute();
    noDrums.mute();
    noGuitar.unmute();
  }
//plays "no bass" track
  if (key == 'b')
  {
    fuwaFuwa.mute();
    noVocals.mute();
    noGuitar.mute();
    noKeys.mute();
    noDrums.mute();
    noBass.unmute();
  }
//plays "no keyboard" track
if (key == 'k')
  {
    fuwaFuwa.mute();
    noVocals.mute();
    noBass.mute();
    noGuitar.mute();
    noKeys.unmute();
  }
//plays "no drums" track
if (key == 'd')
  {    
    fuwaFuwa.mute();
    noVocals.mute();
    noBass.mute();
    noKeys.mute();
    noGuitar.mute(); 
    noDrums.unmute();
  }
//plays original track  
  if (key == 'n')
  {   
    noDrums.mute();
    noVocals.mute();
    noBass.mute();
    noKeys.mute();
    noGuitar.mute();
    fuwaFuwa.unmute();
  }
}
//stops Minim and tracks so that program can close
void stop()
{
  fuwaFuwa.pause();
  noGuitar.pause();
  noBass.pause();
  noKeys.pause();
  noDrums.pause();
  noVocals.pause();
  fuwaFuwa.close();
  noGuitar.close();
  noBass.close();
  noKeys.close();
  noDrums.close();
  noVocals.close();
  minim.stop();
  super.stop();
}



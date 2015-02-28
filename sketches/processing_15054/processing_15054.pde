

import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup()
{
  

  minim = new Minim(this);
  
  // load a file, give the AudioPlayer buffers that are 1024 samples long
  // player = minim.loadFile("groove.mp3");
  
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("01 My Love.mp3");
  // play the file
  player.play();
}





/**
  * This sketch demonstrates how to play a file with Minim using an AudioPlayer. <br />
  * It's also a good example of how to draw the waveform of the audio.
  * modified by ErrorbyErrors
  */

import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
  size(1000, 300, P3D);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("marcus_kellis_theme.mp3");
  
  // play the file
  player.play();
  textAlign(CENTER, CENTER);
}

void draw()
{
  background(0);
  stroke(255);
  
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // note that if the file is MONO, left.get() and right.get() will return the same value

    fill(random(255), random(255), random(255));
    textSize(map(player.left.get(0), -1, 1, 10.0, 300.0));
    text("error", width/2, height/2);
}


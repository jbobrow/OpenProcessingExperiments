
import processing.serial.*;
import ddf.minim.*;

import cc.arduino.*;

Arduino arduino;

AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
Minim minim;
Serial port;

Boolean isPlaying=false;

void setup()
{
  size(512, 200);
 
   minim = new Minim(this);
   arduino = new Arduino(this, Arduino.list()[0], 57600);
   for (int i = 0; i <= 13; i++)
   arduino.pinMode(i, Arduino.INPUT);
  
  // load a file, give the AudioPlayer buff ers that are 1024 samples long
  // player = minim.loadFile("groove.mp3");
 
  // load a file, give the AudioPlayer buffers that are 2048 samples long
  player = minim.loadFile("drama.mp3", 512);
  player2 = minim.loadFile("badumtis.mp3", 512);
  player4 = minim.loadFile("chan.mp3", 512);
  player5 = minim.loadFile("chanchan.mp3", 512);
}

void draw()
{
  
  if(arduino.digitalRead(5)==1&&player4.isPlaying()==false){

    player4.rewind();
    player4.play();
 
  }
  
  else if(arduino.digitalRead(6)==1&&player.isPlaying()==false){

    player.rewind();
    player.play();
 
  }
  
  else if(arduino.digitalRead(7)==1&&player2.isPlaying()==false){

    player2.rewind();
    player2.play();
 
 
  }
  
  println(arduino.digitalRead(6));
  println(arduino.digitalRead(5));
  println(arduino.digitalRead(8));
  
}



void stop()
{
  minim.stop() ;
  super.stop() ;
}


void keyPressed()
{
  
  if(key == 'a' || key == 'A')
  {
    player.rewind();
    player.play();
  }
  
  else if(key == 's' || key == 'S')
  {
    player2.rewind();
    player2.play();
  }
  else if(key == 'f' || key == 'F')
  {
    player4.rewind();
    player4.play();
  }
  else if(key == 'g' || key == 'G')
  {
    player5.rewind();
    player5.play();
  }
  
}




 
import ddf.minim.*;
import ddf.minim.analysis.*;

AudioPlayer player;
Minim minim;//audio context
BeatDetect beat;
BeatListener bl;
float kickSize, snareSize, hatSize;

void setup()
{
  size(1000,800);

  minim = new Minim(this);
  player = minim.loadFile("Despe e Siga - A Minha Sogra um Boi.mp3",2048);
  player.play();
 beat = new BeatDetect(player.bufferSize(), player.sampleRate());
 beat.setSensitivity(500);
 bl = new BeatListener(beat, player);
}

void draw() {
  background(0);
  beat.detect(player.mix);

  //BATIDA! :D

   
   if(beat.isOnset()){
     float rand =160;
     ellipse(500,400,rand, rand);
     fill(250,0,0);
   }
   
   if(beat.isKick()){
     float rand =110;
     ellipse(500,400,rand, rand);
     fill(0,255,0);
   }
  
   if(beat.isHat()){
     float rand =60;
     ellipse(500,400,rand, rand);
     fill(0,0,255);
   }
   if(beat.isSnare()){
     float rand =10;
     ellipse(500,400,rand, rand);
   }

}


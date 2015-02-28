
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
float kickSize, snareSize, hatSize;

ArrayList beatBars;


int amo = 100;

void setup(){
  size (700,400);

  minim = new Minim(this);
  song = minim.loadFile("skunk.mp3",2048);
  song.play();
  beat = new BeatDetect(song.bufferSize(),song.sampleRate());
  beat.setSensitivity(100);
  kickSize = snareSize = hatSize = 45;

  beatBars = new ArrayList(100);




  int count = 0;
  while(count < amo){
    beatBars.add(new bar(count * 7, height/2, 7,0));
    count = count +1;
  }




  noStroke();
}

void draw(){
  background(255);
  bar kickBar;
  bar hatBar;



  beat.detect(song.mix);









  if(beat.isSnare()){
    //println("SNARE");
    //delay(5);
    background(mouseX/3,mouseY/5,mouseY/3,abs(snareSize*4));
    snareSize = constrain(snareSize * 0.95, 50, 100);
  }

  int count = 0;
  while(count < beatBars.size()){
    kickBar = (bar)beatBars.get(count);
    kickBar.drawBeatBar();
    ///////HATBAR////////
    hatBar = (bar)beatBars.get(count);
    hatBar.drawBeatBar2();
    if(kickBar.isOverXpos() == true){
      if(beat.isKick()){
        //println("KICK");
        kickBar.h = mouseY - height/2;
        kickSize = constrain(kickSize * 0.95, 45, 65);
      }
    }
    else{
      kickBar.h = kickBar.h * 0.95;
    }
    count = count + 1;

    if(hatBar.isOverXpos() == true){
      if(beat.isHat()){
        println("HAT");
        hatBar.h = mouseY - height/2;
        hatSize = constrain(hatSize * 0.95, 45, 65);
      }
      else{
        hatBar.h = hatBar.h * 0.95;
      }
      count = count +1;
    }
  }
}


void stop(){
  song.close();
  minim.stop();
  super.stop();
}





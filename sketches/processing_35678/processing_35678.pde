
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
BeatDetect beat;
 
ArrayList beatBars;
int amo = 100;
 
void setup(){
  size (700,400);
   
  minim = new Minim(this);
  song = minim.loadFile("skunk.mp3",2048);
  song.play();
  beat = new BeatDetect();
   
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
  bar waveBar;
   
  beat.detect(song.mix);
  
  
  
  
  int count = 0;
  while(count < beatBars.size()){
    waveBar = (bar)beatBars.get(count);
    waveBar.drawBeatBar();
    if(waveBar.isOverXpos() == true){
      if(beat.isOnset()){
        println("BEAT");
       waveBar.h = mouseY - height/2;
      }
    }else{
      waveBar.h = waveBar.h * 0.95;
    }
    count = count +1;
  }
 
    
  
}
  
   
  void stop(){
    song.close();
    minim.stop();
    super.stop();
  }


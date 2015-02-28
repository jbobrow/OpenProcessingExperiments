
import ddf.minim.*;
import ddf.minim.analysis.*;
//import themidibus.*;

//MidiBus myBus;

 
Minim minim;
AudioPlayer song;
AudioPlayer sample;
AudioPlayer hat;
AudioPlayer openhat;
AudioPlayer kick;
int value = 60;
 
void setup()
{
  size(600, 600);
  frameRate(24);
 // MidiBus.list();
 
  // always start Minim first!
 // myBus = new MidiBus(this, 0, "Java Sound Synthesizer", "busA");
  minim = new Minim(this);
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("Kick.mp3", 600);
  sample = minim.loadFile("Sample.mp3", 600);
  openhat = minim.loadFile("Clap.mp3", 600);
  hat = minim.loadFile("Hat.mp3", 600);
  kick = minim.loadFile("Chord.mp3", 600);
  song.loop();
  sample.loop();
  hat.loop();
  openhat.loop();
  kick.loop();
 
}
 
void draw()
{
  background(0);
  smooth();
  noFill();


noFill();
stroke(255);
  

  for(int i = 0; i < song.left.size() - 1; i++)
  {
    line(i, 50 + song.left.get(i)*300, i+1, 50 + song.left.get(i+1)*300);
    line(i, 150 + song.right.get(i)*300, i+1, 150 + song.right.get(i+1)*300);
  }

 
  for(int i = 0; i < sample.left.size() - 1; i++)
  {
    line(i, 200 + sample.left.get(i)*600, i+1, 200 + sample.left.get(i+1)*600);
    line(i, 350 + sample.right.get(i)*600, i+1, 350 + sample.right.get(i+1)*600);
  }
  
  for(int i = 0; i < openhat.left.size() - 1; i++)
  {
    line(i, 400 + openhat.left.get(i)*500, i+1, 400 + openhat.left.get(i+1)*500);
    line(i, 550 + openhat.right.get(i)*500, i+1, 550 + openhat.right.get(i+1)*500);
  }
 
  
  fill(120, 60, 200);
  for(int i = 0; i < hat.mix.size() - 1; i ++) {
  for(int x = 50; x < 650; x += 100) {
    fill(120, 60, 90);
    ellipse(x, 100, hat.mix.get(i)*300, hat.mix.get(i)*300);
    
  }
}

  for(int i = 0; i < kick.left.size() - 1; i++) {
    
    rectMode(CENTER);
    fill(120, value, 90);
    rect(width/2, height/2-20, kick.left.get(i)*2000, kick.left.get(i)*2000);
    fill(120, value, 200);
    rect(width/2-200, height/2-20, kick.left.get(i)*2000, kick.left.get(i)*2000);
    fill(230, value, 90);
    rect(width/2+200, height/2-20, kick.left.get(i)*2000, kick.left.get(i)*2000);
    
    


}

}


  void mousePressed() {
  if(value == 0) {
    value = 255;
    
  } else {
    value = 0;
  }
  }
  


void stop()
{
  song.close();
  sample.close();
  minim.stop();
 
  super.stop();
}


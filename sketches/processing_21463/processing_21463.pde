

import ddf.minim.*;
import ddf.minim.analysis.*;


Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize, imageSize;

void setup()
{
   background(0);
  size(500, 380, P3D);
 
  
  minim = new Minim(this);  
  song = minim.loadFile("Tainted Love.mp3", 2048);
  song.play();

 
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  
 
  beat.setSensitivity(100);

  // set variables for the drawing  
  kickSize = snareSize = hatSize = imageSize = 10;
  
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);  
  
  
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
  
  song.loop();  

}
int x=0;

void draw()
{
 
  camera(20, 500,500,width,height,5,0,5,0);
  // NS: a little fudge to sync the beats with the music
  delay(5);
  
 
  fill(255);
  
  if ( beat.isKick() ) kickSize = 22;
  if ( beat.isSnare() ) snareSize = 52;
  if ( beat.isHat() ) hatSize = 12;
  
  
 


 
  
  kickSize = constrain(kickSize * 0.25, 16, 32);
  snareSize = constrain(snareSize * 2.95, 16, 32);
  hatSize = constrain(hatSize * 10.95, 16, 32);

  
        
 translate(width/4,height);
  noStroke();
  
  rotate(x/PI);
for(int i=0; i<song.bufferSize(); i+=10){
stroke(random(0,230),random(0,230), random(0,230),100);
noFill();
 
 
 
 ellipseMode(CENTER);
 strokeWeight(1);
    ellipse(kickSize,10, song.left.get(i)*1000,song.left.get(i)*500);
      ellipse(i,kickSize, song.right.get(i)*1000,song.right.get(i)*500);
      
   
         
         rectMode(CENTER);
rect(hatSize,0,width*x,height);
fill(0);

  stroke(0,20);
  rectMode(CENTER);
 ellipse(snareSize*2,10, song.left.get(i)*1000,song.left.get(i)*500);
      ellipse(snareSize/2,10, song.right.get(i)*1000,song.right.get(i)*500);


      
     
      fill(255,0,0,128);
  float leftLevel = song.left.level() * 1000;  // <--- this is just a fudge to make the bars high enough
       }
  
 x++;

}


// here we provide a way to mute out
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( song.isMuted() )
    {
      song.unmute();
    }
    else
    {
      song.mute();
    }
  }
}


void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}



class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}



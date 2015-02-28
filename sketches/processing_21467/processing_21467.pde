
import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float circleSize, i;

void setup(){
  size(300,300,P3D);
  
  minim = new Minim(this);  
  song = minim.loadFile("so happy together.mp3", 2048);
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(100);
  
  circleSize = 50;
  
  bl = new BeatListener(beat, song);
  
  song.play();
  song.mute();
  song.loop();
}


void draw(){
  delay(2);
  
  background(0);
  
  float leftLevel = song.left.level() * 1000;
  float rightLevel = song.right.level() * 1000;
  float mixLevel = song.mix.level() * 1000;
  
  //noStroke();
  
  for ( i=0; i< circleSize; i++){
  
    if ( beat.isKick() ) circleSize= i++;
    if ( beat.isSnare() ) circleSize = i+=10;
    if ( beat.isHat() ) circleSize = i+=20;

    stroke(rightLevel);
    //strokeWeight(rightLevel);
    //line(width,height,width-leftLevel,height-leftLevel);
    //noStroke();
   
   fill(height-leftLevel,0,leftLevel,leftLevel);
    ellipse(i,rightLevel,circleSize,circleSize+10);
    
    //curve(i,rightLevel,width-i,height-i,leftLevel,circleSize,i+5,rightLevel);
    
    fill(width-i,height-i,i,leftLevel);
    ellipse(leftLevel,i,i,i+10);
    
    fill(width-mixLevel,mixLevel*2,mixLevel,mixLevel);
    ellipse(width-mixLevel,height-mixLevel,circleSize,circleSize);
    
    noStroke();
    fill(rightLevel,width-rightLevel,rightLevel,rightLevel);
    ellipse(width/2,height/2,circleSize*1.5,circleSize*1.5);
    
    
    circleSize = constrain(circleSize * 20, 50, 125);
  }
}


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
  song.close();
  minim.stop();
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




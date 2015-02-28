
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;






Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;


Replay play;
Bubble[] bubbles;
int totalBubbles = 0;

float i;



void setup() {
  size(500,700);
  smooth();
  bubbles = new Bubble[400];
  play = new Replay(1);
  play.start();

  minim = new Minim(this);
  song = minim.loadFile("summertime clothes.mp3", 2048);
  song.play();
  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  
  beat.setSensitivity(300);
 
  bl = new BeatListener(beat, song); 
  
  
}

void draw() {
  background(0);
  
  if (play.isFinished()) {
  bubbles[totalBubbles] = new Bubble();
  totalBubbles ++;
  
    if (totalBubbles >= bubbles.length) {
      totalBubbles = 0; // Start over
    }
    
  play.start(); 
  
  for (int a = 0; a < totalBubbles; a++ ) {
    bubbles[a].display();  
    }
  }
   

}



class Bubble {
  // bubble variables
  float x,y,i;
  color c;
 
  
  // bubble constructor
  Bubble() {
    x = random(width);
    y = random(height);
    c = color(random(0,255),random(0,255),random(0,255));
  }
  
  // Display bubble
  void display() {
     // draw bubble
    ellipseMode(CENTER);
    noStroke();
    fill(c);
    ellipse(x,y,i,i);
     
    if(beat.isHat()){
      i=60;
      i = constrain(i,i,60);
   
    }else{
   i=20;
   i = constrain(i,i,30);
    }
        
    
      
  }

  }
class Replay {
    int savedPlay;
    int totalPlay;
    
    Replay(int tempTotalPlay) {
      totalPlay = tempTotalPlay;
    }
    
    void start() {
      savedPlay = millis();
    }
    
    boolean isFinished() {
      int passedPlay = millis() - savedPlay;
      if (passedPlay > totalPlay) {
        return true;
      }else{
        return false;
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


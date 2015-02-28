


import ddf.minim.*;
import ddf.minim.analysis.*;
PImage img;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

float kickSize, snareSize, hatSize, imageSize;


void setup()
{
  size(500, 380, P3D);
  img = loadImage ("salt n pepa.jpg");
  
  minim = new Minim(this);  
  song = minim.loadFile("Push It.mp3", 2048);
  song.play();
  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(100);

  // set variables for the drawing  
  kickSize = snareSize = hatSize = imageSize = 16;
  
  // make a new beat listener, so that we won't miss any buffers for the analysis
  bl = new BeatListener(beat, song);  
  
  
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
  
  song.loop();  

}
int x=0;
void draw()
{
 
  camera(-100, 300,500,width,height,5,0,5,0);
  // NS: a little fudge to sync the beats with the music
  delay(5);
  
  background(img);
  fill(255);
  
  if ( beat.isKick() ) kickSize = 32;
  if ( beat.isSnare() ) snareSize = 32;
  if ( beat.isHat() ) hatSize = 32;
  
  
 
  rotate(2*PI/snareSize);
  textSize(snareSize*3);
  text("PUSH IT", width/2, height-100);
  textSize(hatSize);
  text("AHHHHHH", 3*width/4, height/2);
  camera(-100, 300,800,width,height,6,0,5,0);
    textSize(kickSize*4);
  text("PICK UP ON THIS", width*4, height-110);
  
     textSize(random (50));
      text("SALT", 100, x-snareSize);
        text("PEPA", 600,x+snareSize);

 
  
  kickSize = constrain(kickSize * 0.95, 16, 32);
  snareSize = constrain(snareSize * 0.95, 16, 32);
  hatSize = constrain(hatSize * 0.95, 16, 32);
  
        
 translate(width,height);
  noStroke();
for(int i=0; i<song.bufferSize(); i+=20){
stroke(100,random(20-250),200,60);
noFill();
     ellipse(i,400, song.left.get(i)*3000,song.left.get(i)*3000);
      ellipse(i,400, song.right.get(i)*3000,song.right.get(i)*3000);
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



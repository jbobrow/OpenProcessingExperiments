
//import processing.dxf.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
 
Minim minim;        
AudioPlayer mySound;
BeatDetect beat;
BeatListener bl;
boolean record = true;
 
void setup(){
  size(600,600,P3D);
   
 // if(record == true){
 //   beginRaw(DXF,"this3.dxf");
 // }
 
  minim = new Minim(this);
  mySound = minim.loadFile("marcus_kellis_theme.mp3");
  mySound.play();  
  
  beat = new BeatDetect(mySound.bufferSize(), mySound.sampleRate());
  beat.setSensitivity(1);
  bl = new BeatListener(beat, mySound);
  mySound.loop();
   
  smooth();
  background(255);
  colorMode(RGB, 50);
  frameRate(30);
}
 
int x = 0;
 
void draw()
{
  float R = mySound.left.level() * 200;
  float G = mySound.mix.level() * 200;
  float B = mySound.right.level() * 200;
  lights();
  camera(300+(x*10), random(-400,-200), random(100,400),300,0,0,0,1,0);
 
  translate(x*10,0, 0);
 x++;
 // for(int i = 0; i < 1; i++) 
 // {
    
    noStroke();
    fill((mySound.left.get(x)*200),(mySound.left.get(x)*250),(mySound.left.get(x)*100),10);
    noStroke();
  
  box( 10, B*2, 10);
 
  translate(0,0,-10);
  fill(50,(mySound.left.get(x)*200),0,10);
  box( 10, G*2, 10);
 
  translate(0,0,-10);
  if (beat.isKick()){
     fill(50,(mySound.left.get(x)*200),0,10);
     box(10,40,10);
  }
  else{
    box(10,5,10);}
   
  translate(0,0,-10);
  if (beat.isHat()){
     fill(50,(mySound.left.get(x)*200),0,10);
     box(10,40,10);
  }
  else{
    box(10,5,10);}
      
     translate(0,0,-10);
  if (beat.isSnare()){
     fill(50,(mySound.left.get(x)*200),0,10);
     box(10,40,10);
  }
  else{
    box(10,5,10);}
  
  translate(0,0,-10);
  fill(50,(mySound.mix.get(x)*200),0,10);
  box( 10, G*2, 10);
 
//}
 
//if(record == false){
 
 //   endRaw();
  //  record = true;
 // }
}
 
void mousePressed(){
  record = false;
}
 
 
 
 
 
void keyPressed()
{
  if ( key == 'm' )
  {
    if ( mySound.isMuted() )
    {
      mySound.unmute();
    }
    else
    {
      mySound.mute();
    }
  }
}
 
void stop()
{
  mySound.close();
  minim.stop();
 
  super.stop();
}
 
class BeatListener implements AudioListener {
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source) {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps) {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR) {
    beat.detect(source.mix);
  }
}



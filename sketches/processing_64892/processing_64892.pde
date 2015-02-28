
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
FFT fft;

int r=0;
void setup(){
  size(400,400,P2D);
  minim = new Minim(this);
  song = minim.loadFile("Benny Benassi - House Music.mp3", 1024);
  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.detect(song.mix);
  beat.setSensitivity(300);
  bl = new BeatListener(beat, song);  
  song.loop();  

}

void draw(){
  
  fill(0,10);
  rect(0,0,width,height);
  noStroke();

  if(beat.isKick()){
    fill(map(mouseX,0,width,170,255),map(mouseY,0,height,170,255),map(mouseX,0,width,100,255));
    triangle(200,100,100,300,300,300);
  }
  
 if(beat.isSnare()){
    fill(map(mouseX,0,width,170,255),map(mouseY,0,height,170,255),map(mouseX,0,width,100,255));
    triangle(200,100,300,300,350,180);
  }
  
  
 if(mousePressed){
    
 for(int i=0;i<100;i++){
   pushMatrix();
   translate(random(300,300+i),random(300,300+i));
   rotate(random(0,5));
   fill(random(100,255),map(mouseX,0,width,70,255),map(mouseY,0,height,70,255));
   triangle(0,0,10,10,0,10);
   popMatrix();
 } 
 
 for(int i=0;i<100;i++){
   pushMatrix();
   translate(random(200-i,200+i),random(0,100-i));
   rotate(random(0,5));
   fill(random(100,255),map(mouseX,0,width,70,255),map(mouseY,0,height,70,255));
   triangle(0,0,10,10,0,10);
   popMatrix();
 }
 
  for(int i=0;i<100;i++){
   pushMatrix();
   translate(random(100-i*4,100),random(300+i*2,300));
   rotate(random(0,5));
   fill(random(100,255),map(mouseX,0,width,70,255),map(mouseY,0,height,70,255));
   triangle(0,0,10,10,0,10);
   popMatrix();
 } 
 
 
 }
}
void stop(){
  song.close();
  minim.stop();
  super.stop();
}
class BeatListener implements AudioListener{
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


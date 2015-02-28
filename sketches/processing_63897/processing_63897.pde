
import ddf.minim.*;
import ddf.minim.effects.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
FFT fft;

final int x=600,y=600;

int dim,r,l,t;

void setup(){
  size(600,600,P2D);
  
  dim=0;
  r=0;
  l=0;
  t=0;
  
  minim = new Minim(this);
  song = minim.loadFile("Get Ready For This.mp3", 1024);
  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.detect(song.mix);
  beat.setSensitivity(300);
  bl = new BeatListener(beat, song);  
  song.loop();  
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.logAverages(22,3);
}

void draw(){
  fill(0,5);
  rect(0,0,width,height);
  noStroke();
  if(beat.isKick()){
    pushMatrix();
    fill(random(map(mouseX,0,300,0,255)),random(map(mouseY,0,300,0,255)),random(dim,255));
    translate(300,300);
    rotate(random(5,10));
    rect(0,0,dim,dim);
    dim=dim+(int)(random(1,10));
    popMatrix();
  }
  if(dim>200){
    dim=(int)(random(50,70));
  }
 fill(random(100,100+l),random(map(mouseY,0,300,0,255)),255);


 if(!beat.isHat()){
     l=0;
     }else{
       l=l+100;
       rect(0,t*10,l,2);
       rect(width-l,t*10,l,2);
     }
  if(t>60){
    t=10;
  }
  fft.forward(song.mix);
  pushMatrix();
    translate(300,300);
    rotate(r);
    fill(map(mouseX,0,300,0,255),random(map(mouseY,0,300,0,255),map(mouseX,0,300,0,255)),255);
  for (int i =20 ; i < fft.avgSize(); i++){
      float k=map(i,20,30,0,50);
      rect(i*5,-fft.getAvg(i)*k,5,fft.getAvg(i)*k);
      rect(i*5,0,5,fft.getAvg(i)*k);
  }
  popMatrix();
  r++;
  t++;
}

void stop()
{
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


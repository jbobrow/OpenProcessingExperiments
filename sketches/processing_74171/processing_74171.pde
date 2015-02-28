
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
FFT fft;
AudioInput in;
AudioPlayer song;

float[] bandRecord= new float[1800000];//should use arraylist? don't remember how
int count=60;
int diff;
float[] pitchRecord= new float[1800000];//Arraylist?

//////////////////////////////////////////////////////
void setup() {
  size(1000, 1000, P3D);
  stroke(255);
  smooth();
  background(50);
  minim=new Minim(this);
  in=minim.getLineIn(Minim.MONO, 1024);
  //song=minim.loadFile("July.mp3", 2048);
  //song.loop();
  fft=new FFT(in.bufferSize(), in.sampleRate());
  diff=millis();
  
}
//////////////////////////////////////////////////////
float[] highestBand(){
  float greatest=0;
  float bandNumber=0;
  for(int i=0;i<fft.specSize();i++){
    if(fft.getBand(i)>greatest){
      greatest=fft.getBand(i);
      bandNumber=i;
    }
   // println(fft.getBand(i));
  }
  float[] j={bandNumber,greatest};
  return j;
}
///////////////////////////////////////////////////////
void draw() {
  fft.forward(in.mix);
  fill(50,10);
  noStroke();
  rect(0,0,1000,1000);
  fill(80);
  noStroke();
  float[] highBand=highestBand();
  bandRecord[count]=highBand[1];
  pitchRecord[count]=highBand[0];
  
  
  float c= map(pitchRecord[count],0,40,100,255);//color of pitch
  float l= map(bandRecord[count],0,100,0,40);//length of band
  float ms=map(millis(), 0, 1000,0,TWO_PI)-HALF_PI;
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;//how should the sound visualization be compressed to display as seconds?
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;//for minutes
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;//for hours
  stroke(c,100,185);
  fill(c,100,185);
  strokeWeight(2);
  line(cos(ms)*80+500,sin(ms)*80+500,cos(ms)*(80+l)+500,sin(ms)*(80+l)+500);
  //println(c);
  //println(fft.getBand(5));
  strokeWeight(1);
  line(cos(s)*80+500,sin(s)*80+500, cos(s) * 450 + 500, sin(s) * 450 + 500);
  //int seconds=round(map(millis()-diff,0,1000,0,100));
  //if(so
  for(int i=1; i<frameRate; i++){
    l= map(bandRecord[count-int(frameRate)+i],0,100,0,40);
    line(cos(s+i/frameRate)*300+500, sin(s+i/frameRate)*300+500, cos(s+i/frameRate)*(300+l)+500, sin(s+i/frameRate)*(300+l)+500);
    //line(cos(ms-1000+i)*300+500-cos(s)*300-500,sin(ms-1000+i)*300+500-sin(s)*300-500,cos(ms-1000+i)*(300+l)+500-cos(s)*300-500,sin(s+ms-1000+i)*(300+l)+500-sin(s)*300-500);
  }
  strokeWeight(2);
  line(cos(m)*80+500,sin(m)*80+500, cos(m) * 400 + 500, sin(m) * 400 + 500);
  strokeWeight(4);
  line(cos(h)*80+500,sin(h)*80+500, cos(h) * 380 + 500, sin(h) * 380 + 500);
  ellipse(500,500,20,20);
  count++;
}
////////
void stop(){
  in.close();
  song.close();
  minim.stop();
  super.stop();
}

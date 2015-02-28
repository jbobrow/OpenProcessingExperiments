
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
FFT fft;
float loudness;
float[] low, high, mid;
float lowVol,highVol,midVol;
float[] mixBuffer;
float[] leftBuffer;
float[] rightBuffer;

LowPassSP lpf;

void setup()
{
  size(512, 200); 
  smooth();
  minim = new Minim(this);
  
  song = minim.loadFile("redhat -sickofdisish.mp3");
  
  fft = new FFT(song.bufferSize(), song.sampleRate());
  lpf = new LowPassSP(100, song.sampleRate());
  song.play();

}
 
void draw()
{
  lowVol=0;
  midVol=0;
  highVol=0;
  loudness=0;

  fft.forward(song.mix);
  for(int i=0; i<100; i++) {
    lowVol+=fft.getBand(i);
  }
  for(int i=100; i<400; i++) {
    midVol+=fft.getBand(i);
  }
  for(int i=400; i<1000; i++) {
    highVol+=fft.getBand(i);
  }
  
  background(255);
  stroke(255,0,0);

/*  for (int i=0; i<song.bufferSize()-1; i++) {
    leftBuffer[i] = song.mix.get(i);
    mixBuffer=leftBuffer;
  }
  
  for(int i = 0; i < song.bufferSize() - 1; i++){
    loudness+=abs(song.mix.get(i));//use array

    line(i, 50*i/130 + leftBuffer[i]*50, i+1, 50*i/130 + leftBuffer[i]*50);
    line(i, 100 + mixBuffer[i]*50, i+1, 100 + mixBuffer[i]*50);
    //line(i, 50*(song.bufferSize()-i)/130 + song.right.get(i)*50, i+1, 50*(song.bufferSize()-i)/130 + song.right.get(i+1)*50);
  }*/
  
  
  for(int i = 0; i < song.bufferSize() - 1; i++){
    loudness+=abs(song.mix.get(i));//use array

    //line(i, 50*i/130 + song.left.get(i)*50, i+1, 52*i/130 + song.left.get(i+1)*50);
    //line(i, 100 + song.mix.get(i)*50, i+1, 102 + song.mix.get(i+1)*50);

    line(i, 50 + song.left.get(i)*50, i+1, 50 + song.left.get(i+1)*50);
    line(i, 100 + song.mix.get(i)*50, i+1, 100 + song.mix.get(i+1)*50);
    line(i, 150 + song.right.get(i)*50, i+1, 150 + song.right.get(i+1)*50);
  }
  
  stroke(0);
  
  fill(highVol,lowVol*.1,midVol*.2);
  ellipse(width*.5,height*.5,loudness*2,loudness*2);  
  fill(midVol*.2,highVol,lowVol*.1);
  ellipse(width*.5,height*.5,loudness*1.5,loudness*1.5);  
  fill(lowVol*.1,midVol*.2,highVol);
  ellipse(width*.5,height*.5,loudness*1,loudness*1);  
  fill(0);
  //SERIOUSLYFIXTHISPUPIL
  ellipse(width*.5-20+.1*mouseX,height*.5-20+.1*mouseY,loudness*.5,loudness*.5);//make it so width is only multiplied once  
  
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}


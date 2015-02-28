
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w;
PImage fade;
float rWidth, rHeight;

float r;
float g;
float b;

void setup()
{
 
  size(300,169);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,512);
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(60,7);
  stroke(255);
  w = width/fft.avgSize();
  strokeWeight(w);
  strokeCap(SQUARE);
  background(0);
  fade = get(0,0,width,height);
  
  rWidth = width * 0.99;
  rHeight = height* 0.99;

}



void draw()
{
 
  r = random(255);
  g = random(255);
  b = random(255);
   
  background(0);
  tint(255,255,255,252);
  image(fade,(width - rWidth)/2,(height - rHeight)/2,rWidth,rHeight);
  noTint();
  
  fft.forward(in.mix); 

  for(int i = 0; i < fft.avgSize(); i++)
  {
  line((i*w)+(w/2),height, (i*w)+(w/2), height - fft.getAvg(i)* 4);
  stroke(r,g,b);
  }
 fade = get(0,0,width,height);


}






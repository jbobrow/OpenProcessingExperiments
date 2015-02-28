
import ddf.minim.*;
import ddf.minim.analysis.*;

import ddf.minim.signals.*;
import ddf.minim.effects.*;
public class rect {
  public float x;
  public float y;
  public float w;
  public float h;
  public boolean down;
  public boolean right;
}
Minim minim;
AudioPlayer song;
FFT fft;

LowPassSP   lowpass;
HighPassSP highpass;
BeatDetect beat;
color c;
int size = 256;
float xSize = 1280/256;
float ySize = 720/256;
rect[] ball1= new rect[256];
void setup()
{
  size(1280, 720);

  // always start Minim first!
  minim = new Minim(this);

  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("chip.mp3");
  song.play();

  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());

  beat = new BeatDetect();
  // create a SquareWave with a frequency of 440 Hz, 
  // an amplitude of 1 and the same sample rate as out
  for (int i=0; i<size; i++)
  {
    ball1[i] = new rect();
    ball1[i].x=(1280/size)*(i+1);
    ball1[i].y=0;
    ball1[i].w=xSize;
    ball1[i].h=ySize;
    ball1[i].down=true;
    ball1[i].right=true;
  }
  // create a LowPassSP filter with a cutoff frequency of 200 Hz 
  // that expects audio with the same sample rate as out
}
float total=0;
float lTotal=0;
float kk=0;
boolean hittest(float x, float y, rect obj)
{

  if (x>obj.x&&x<obj.x+obj.w)
    if (y>obj.y&&y<obj.y+obj.h)
      return true;
  return false;
}
void moveBall(int index)
{
  float vTotal = fft.getBand(index);
  rect temp = ball1[index];
  if (temp.down)
    temp.y += vTotal;
  else
    temp.y -= vTotal;
  if (temp.right)
    temp.x += vTotal;
  else 
    temp.x -= vTotal;
  if (temp.y+temp.h>mouseY)
    temp.down = false;
  if (temp.y<0)
    temp.down=true;
  if (temp.x+temp.w>1280)
    temp.right= false;
  if (temp.x<0)
    temp.right= true;
  temp.h = ySize+vTotal;
  temp.w = xSize+vTotal;
}
void draw()
{
  for (int i=0; i<size; i++)
    moveBall(i);
  background(0);
  int k=0;
  fft.forward(song.mix);
  beat.detect(song.mix);
  if ( beat.isOnset() ) 
  {
    xSize = 1280/80;
    ySize = 720/80;
  }     
  else
  {
    xSize *= 0.95;
    ySize *= 0.95;
  }
  lTotal = total;
  int saveBy=int(map(sin(total/10),-1,1,4,20));
  float cy = 255-(float(mouseY+1)/float(width))*255.0;
  for (int y=0; y<height/saveBy; y++)
  {
    for (int x=0; x<width/saveBy; x++)
    {

      float cxy = (mouseX-x*saveBy)*(mouseY-y*saveBy);
      total += fft.getBand(int(k))/20000;
      float cwave = sin((x*2+1)/(1+y+ cos(total/2)*10+10));
      float clr = cy*cxy*cwave;
      boolean hitt=false;
      for (int i=0; i<size; i++)
      {
        if (hittest(x*saveBy, y*saveBy, ball1[i]))
          hitt= true;
      }
      if (!hitt)
        c =  color(clr, clr, clr, 1);
      else
        c = color(0, 255-clr, 255-clr, 255);
      for (int yy=int(saveBy-1); yy>=0; yy--)
      {
        for (int xx=int(saveBy-1); xx>=0; xx--)
        {
          int setX=x*saveBy+xx;
          int setY =y*saveBy+yy;  
          if (setY>0&&setY;<height)
          {
            if (setX>0&&setX;<width)
              set(int(setX), int(setY), c);
          }
        }
      }
      k++;
    }
  }






  // now we can attach the square wave and the filter to our output
  song.clearEffects();
  float my = mouseY-height/2;
  my*= my;
  float maxx = (height/2)*(height/2);
  my = maxx-my;
  float mfy = map(my, 0, maxx, 20, 1000);
  boolean high=true;
  if ( mfy< 500)
  {
    lowpass = new LowPassSP(mfy, song.sampleRate());
    high=false;
  }
  else
    highpass = new HighPassSP(mfy, song.sampleRate());
  float mx = mouseX-width/2;
  mx *= mx;
  float max = (width/2)*(width/2);
  mx = max-mx;

  if (high)
  {
    song.addEffect(highpass);
    highpass.setFreq(map(mx, 0, max, 0, 1000));
  }
  else
  {
    lowpass.setFreq(map(mx, 0, max, 0, 1000));
    song.addEffect(lowpass);
  }
}

void stop()
{
  song.close();
  minim.stop();

  super.stop();
}


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.signals.*;

Minim minim;
AudioInput in;
FFT fft;

float loudestFreqAmp = 0;
float loudestFreq = 0;
int timerCounter = 0;

void setup()
{
 size(screen.width, screen.height, P2D);
 frameRate(30);

 minim = new Minim(this);
 minim.debugOn();
 background(255);
 noStroke();
 // get a line in from Minim, default bit depth is 16
 in = minim.getLineIn(Minim.STEREO, 1024);
 fft = new FFT(in.bufferSize(), in.sampleRate());

}


void draw()
{
 fft.window(FFT.HAMMING);
 for(int i = 0; i < fft.specSize(); i++)
 {
   // draw the line for frequency band i, scaling it by 4 so we can
   //see it a bit better
   //line(i, height, i, height - fft.getBand(i)*4);
   if (fft.getBand(i) > loudestFreqAmp && fft.getBand(i) > 10)
   {
     loudestFreqAmp = fft.getBand(i);
     loudestFreq = i * 4;
     //sine.setFreq(loudestFreq);
     fill(loudestFreq * 10, 255 - loudestFreq, loudestFreq * 20, 128 );
     if(loudestFreq < 25)
     {
       rect(random(0,width), random(0,height), loudestFreqAmp, loudestFreqAmp);
     }
     else
     {
       ellipse(random(0,width), random(0,height), loudestFreqAmp,
loudestFreqAmp);
     }
     timerCounter = 0;
   }
 }
 loudestFreqAmp = 0;

 // draw the waveforms
 /*  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
  line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
  line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }*/

 fft.forward(in.mix);
 timerCounter++;
 if(timerCounter >= 90)
 {
   //println("Clr screen");
   fill(255, 255, 255, (timerCounter - 90) * 2);
   rect(0, 0, width, height);
 }

}

void stop()
{
 // always close Minim audio classes when you are done with them
 in.close();
 minim.stop();

 super.stop();
}


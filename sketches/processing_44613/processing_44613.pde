
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer mysound;
FFT fft;

void setup()
{
  size (300, 500, P3D);
  textMode(SCREEN);
  color( 250);
  minim= new Minim(this);

  mysound= minim.loadFile("Can't Nobody.mp3", 1024);
  mysound.loop();
  rectMode (CORNERS);
  fft= new FFT(mysound.bufferSize(), mysound.sampleRate());
   }

  void draw()
  {
    translate (150,250);
    background(250);
    stroke(random(255),random(255),random(255),50);
    strokeWeight(random(5));
    
    noFill();
    //colorMode (HSB, 150);
    fft.forward(mysound.mix);
    for (int i = 0; i < fft.specSize(); i++)
    {
      //soundbox
     
      ellipse ( 0,0, height + fft.getBand(i), height + fft.getBand(i));
    ellipse(0, 0 , 50 + fft.getBand(i), 50 + fft.getBand(i));
    ellipse(0,0 , 150 + fft.getBand(i), 150 + fft.getBand(i));
   ellipse(100,120 , 20 + fft.getBand(i), 20 + fft.getBand(i));
    ellipse(-100, -120 , 20 + fft.getBand(i), 20 + fft.getBand(i));
    
    
  //tonado
    ellipse(i, -i + mysound.right.get(i)*10, i+1, 150 + mysound.right.get(i+1)*100);
    ellipse(-i, i + mysound.right.get(i)*10, i+1, 150 + mysound.right.get(i+1)*100);

  }

    fill (random(200), random(200), random(200),25);
  }
 void stop () 
  {
    mysound.close();
    minim.stop();
    super.stop();
  }



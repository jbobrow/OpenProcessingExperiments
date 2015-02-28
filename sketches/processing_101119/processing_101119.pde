
//  'test pattern colour' was inspired by Ryoji Ikeda's 
//  installation 'test pattern' featured at this year's
//  International Symposium on Electronic Art, see
//  http://www.isea2013.org/events/test-pattern/

//  Info on utilising sound in this sketch can be found at
//  http://code.compartmental.net/tools/minim/quickstart/

//  'dialUpTone.mp3' was taken from willterminus' yt vid,
//  http://www.youtube.com/watch?v=gsNaR6FRuO0

import ddf.minim.*;

Minim minim;
AudioPlayer song;

void setup()  {
  size(1024,600);
  
  minim = new Minim(this);
  song = minim.loadFile("dialUpTone.mp3", 1024);
  song.play();
}

void draw()  {
  background(0);
  stroke(0);
  
  //  This loop generates the panels based on 
  //  the integral of the waveform across a defined region
  int panels = 25;
  for (int i = 0; i < panels; i++)  {
    float k = 0;
    float l = 0;
    for (int j = i*panels; j < song.bufferSize() - 1; j++)  {
      k = k + song.left.get(j);
      l = l + song.right.get(j);
    }
    
    if (k > 0)  {
      fill(k*255,0,0);    //  Define the colour range of the panels
      rect((i-1)*width/panels, 0, width/panels, height/2);
    }
    
    if (l > 0)  {
      fill(l*200,l*100,l*50);
      rect((i-1)*width/panels, height/2, width/panels, height/2);
    }
  }
  
  //  This loop generates the waveform
  int amp = 500;    // signal amplitude
  for (int i = 0; i < song.bufferSize() - 1; i++)  {
    stroke(100);
    line(i, 150 + song.left.get(i)*amp, i+1, 150 + song.left.get(i+1)*amp);
    line(i, 450 + song.right.get(i)*amp, i+1, 450 + song.right.get(i+1)*amp);
  }
}

void stop()  {
  song.close();
  minim.stop();
  super.stop();
}


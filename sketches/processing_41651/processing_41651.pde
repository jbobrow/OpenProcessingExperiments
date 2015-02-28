
import netscape.javascript.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

float[] y = new float[5000];
float[] x = new float[5000];
float[] c = new float[5000];
int index = 0;


Minim minim;
AudioOutput out;
SineWave sine;



void setup() {

  size(700,  400);
  background (255);
  //stroke(0);
  strokeWeight (5);

  minim = new Minim(this);
  // get a line out from Minim, default sample rate is 44100, default bit depth is 16
  out = minim.getLineOut(Minim.STEREO, 2048);
  // create a sine wave Oscillator, set to 440 Hz, at 0.5 amplitude, sample rate 44100 to match the line out
  sine = new SineWave(440, 0.5, out.sampleRate());
  // add the oscillator to the line out
  out.addSignal(sine);
}

void draw() {                                                                                                                                                                                                                                                                                                                 
  background(5);

  int i =1;

  x[0]=x[0]-1; 
  while(i<index) {

    if(dist(x[i],y[i],x[i-1],y[i-1]) < 500) {
      stroke(c[i],0,0);
      line(x[i],y[i],x[i-1],y[i-1]);
    }

    c[i]=c[i]+1;

    int over;

    if(x[i]>0) {
      over=1;
    }
    else {
      over=-1;
    }

    x[i]=x[i]-1; 

    if(over==1 && x[i]<=0) {
      if(c[i]<255) {
        out.enableSignal(sine); 
        sine.setFreq(map(y[i],0,height,1000,0));
      }
      else {
        out.enableSignal(sine);
        sine.setFreq(map(y[i],0,height,1000,0));
      }
    }

    /*if( x[i] < 0) {
      x[i]=700;
    }*/

    if(x[i] <= 0) {
    }

    i++;
  }


  if(mousePressed==true) {
    y[index]= mouseY;
    x[index]= mouseX;
    c[index]= (0);

    index=index+1;

    if(index >= 5000) {
      index = 0;

      y = expand(y, y.length+1); 
      x = expand(x, x.length+1); 
      println(y.length);
      c = expand(c, c.length+1);
    }
  }
}



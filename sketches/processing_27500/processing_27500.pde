
/* My version of the famous Whitney Music Box
   (NomBot)
   based on the work of John Whitney and Jim Bumgardner.
   >> uses rwmidi library.
*/

import rwmidi.*;
MidiOutput output;

float steps = 60,
      speed = .0005,
      center,
      radius;

int  mbsize = 500,
     points = 36;

float[] yprev = new float[points];

void setup()
{
  size(500,500);
  center = mbsize/2;
  radius = mbsize*.48;
  frameRate(24);
  noStroke();
  colorMode(HSB, points);
  smooth();
  for (int i = 0; i < points; i++){yprev[i]= -1.0;}
  
  output = RWMidi.getOutputDevices()[0].createOutput();
  
}

void draw()
{
  background(0);
  float time = millis()*speed;
  float step = time / steps;

  for (int i = 0; i < points; ++i)
  {
    float angle = TWO_PI * step * (points - i);
    float wx = cos(angle);
    float wy = sin(angle);
    float pdist = (i/(float)points) * radius;
    float x = center + wx * pdist;
    float y = center + wy * pdist;
    fill(points-i,points,points);
    float esize = 2 + i/4;
    
    
    if ((wy>=0) && (yprev[i]<0) && (wx>0)) { 
          fill(i,0,points);

          int chan=0;
          int note=2*i+30;
          int vel=100;
          int ret =    output.sendNoteOff(chan, note, 0);
              ret =    output.sendNoteOn(chan, note, vel);
    
                   
                    }
    yprev[i]=wy;
                    
    ellipse((int) x, height-(int) y, esize, esize);
  }
}




// HIMNO DE LA ALEGRIA, BEETHOVEN, @beto0303, Nov'13
// Partitura: http://makingmusicfun.net/pdf/sheet_music/ode_to_joy_flute.pdf
// Las Notas: http://www.phy.mtu.edu/~suits/notefreqs.html
// A=LA, B=SI, C=DO, D=RE, E=MI, F=FA, G=SOL

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

float SI=233.08, DO=261.63, RE=293.66, MI=311.13, FA=349.23; // MI & SI BEMOL
float[] notas = {RE, RE, MI, FA, FA, MI, RE, DO, SI, SI, DO, RE, RE, DO, DO};
float[]   dur = {1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.5,0.5,2.0};

void setup()
{
  size(512, 200, P3D);  
  minim = new Minim(this);
  out = minim.getLineOut();
  float ini=1.0, d;
  for (float vel=1.0; vel>0.1; vel/=2.0) {
//    float ini=1.0, d;
    for (int i=0; i<notas.length; i++, ini+=d) {
      d = dur[i]*vel;
      out.playNote(ini,d,notas[i]); // name
    }
  }
}

void draw()
{
  background(0);
  stroke(255); 
  // draw the waveforms
  for(int i = 0; i < out.bufferSize() - 1; i++)
  {
    line( i, 50 + out.left.get(i)*50, i+1, 50 + out.left.get(i+1)*50 );
    line( i, 150 + out.right.get(i)*50, i+1, 150 + out.right.get(i+1)*50 );
  }
}

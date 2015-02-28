
import ddf.minim.*; // carga la libreriaimport ddf.minim.*;
import ddf.minim.ugens.*;

Minim       minim;
AudioOutput out;
Oscil       wave;
Oscil       otrawave; 

void setup()
{
  frameRate(5)
  size(512, 200, P3D);
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil( 440, 0.5, Waves.SINE );
  otrawave = new Oscil(442, 0.5, Waves.SINE );
  wave.patch( out );
  otrawave.patch( out );
}

void draw()
{

{}


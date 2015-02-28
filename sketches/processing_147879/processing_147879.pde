
import ddf.minim.*;
import ddf.minim.ugens.*;
 
Minim minim;
AudioOutput out;
Oscil fm;
 
void setup()
{
  size( 512, 200, P3D );
  minim = new Minim( this );
  out   = minim.getLineOut();
  Oscil wave = new Oscil( 200, 0.8, Waves.SINE );
  fm   = new Oscil( 10, 2, Waves.SINE );
  fm.offset.setLastValue( 200 );
  fm.patch( wave.frequency );
  wave.patch( out );
}
void draw()
{
  background( 0 );
  stroke( 255 );
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    line( x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  
}
 
void mouseMoved()
{
  float modulateAmount = map( mouseY, 0, height, 2000, 100);
  float modulateFrequency = map( mouseX, 0, width, 1000, 1);
  
  fm.frequency.setLastValue( modulateFrequency );
  fm.amplitude.setLastValue( modulateAmount );
}


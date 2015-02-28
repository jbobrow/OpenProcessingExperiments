
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

AudioPlayer in;
Minim minim;
FFT fft;

int w;

void setup(){
  
   size( 640, 480 );
   minim = new Minim( this ); // Call Minim object.
   in = minim.loadFile("queen.mp3", 512);
   in.play();
   fft = new FFT( in.bufferSize( ), in.sampleRate( ) ); // Call FFT object.
   fft.logAverages( 60, 7 );
   w = width/fft.avgSize( );
   strokeWeight( w );
   strokeCap( SQUARE );
   
}

void draw(){
  background( 0 );
  
  fft.forward( in.mix ); // Mix left and right stereo together.
  
  for( int i = 0; i < fft.avgSize(); i++ ) // Itterate through array.
  {
    line( ( i * w ) + ( w / 2 ), height, ( i * w ) + ( w / 2 ), height - fft.getAvg( i ) * 10 );
    stroke( 255 - i, 255 - i, 255 - i );
  }
  
}



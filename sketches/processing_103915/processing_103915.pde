
float x, y, z; //ancho largo y profundidad
float r, g, b; //variable para modificar el color
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim       minim;
AudioPlayer jingle;
FFT         fft;

void setup()
{
  size(512, 512, P3D);
  background(0);

  minim = new Minim(this);

  // specify that we want the audio buffers of the AudioPlayer
  // to be 1024 samples long because our FFT needs to have 
  // a power-of-two buffer size and this is a good size.
  jingle = minim.loadFile("kid.mp3", 1024);

  // loop the file indefinitely
  jingle.loop();

  // create an FFT object that has a time-domain buffer 
  // the same size as jingle's sample buffer
  // note that this needs to be a power of two 
  // and that it means the size of the spectrum will be half as large.
  fft = new FFT( jingle.bufferSize(), jingle.sampleRate() );
}

void draw() {

  //background(0);
  noStroke();
  fill(0, 20);
  rect(0, 0, width, height);

  // perform a forward FFT on the samples in jingle's mix buffer,
  // which contains the mix of both the left and right channels of the file
  fft.forward( jingle.mix );
  translate (width/2, height/2, 50);
  //translate (mouseX, mouseY, 50);

  rotate(map(fft.getBand(10), 0, 50, 0, PI/2), 0, 1, 0);
  rotate(map(fft.getBand(220), 0, 10, 0, PI/2), 1, 0, 0);
  rotate(map(fft.getBand(300), 0, 5, 0, PI/2), 0, 0, 1);

  x=map(fft.getBand(10), 0, 50, 20, 512);
  y=map(fft.getBand(220), 0, 10, 20, 512);
  z=map(fft.getBand(300), 0, 3, 20, 512);

  r=map(fft.getBand(10), 0, 50, 127, 255);
  g=map(fft.getBand(220), 0, 10, 10, 50);
  b=map(fft.getBand(300), 0, 3, 50, 100);

  fill(g, r, b, 127);
  box(x, y, z);
  
  fill(r,g, b, 127);
  box(z, y, x);
  
  fill(b,g, r, 127);
  box(y, x, z);

  //println(fft.getBand(10));
}




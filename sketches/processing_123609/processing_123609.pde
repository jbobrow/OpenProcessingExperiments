
/*
Funky Loop begins automatically.
Press 'a', 's', 'd', 'f', 'j', 'k', 'l', ';' to trigger samples
*/
PImage Image;
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer loop;
FFT fft;
AudioSample riff1;
AudioSample riff2;
AudioSample riff3;
AudioSample riff4;
AudioSample riff5;
AudioSample riff6;
AudioSample riff7;
AudioSample riff8;


void setup() {
 size(800,600);
 Image = loadImage("Image.png");
 minim = new Minim(this);
loop = minim.loadFile("loop.wav", 2048); 
riff1 = minim.loadSample("riff1.wav");
riff2 = minim.loadSample("riff2.wav");
riff3 = minim.loadSample("riff3.wav");
riff4 = minim.loadSample("riff4.wav");
riff5 = minim.loadSample("riff5.wav");
riff6 = minim.loadSample("riff6.wav");
riff7 = minim.loadSample("riff7.wav");
riff8 = minim.loadSample("riff8.wav");
loop.loop();
fft = new FFT ( loop.bufferSize(), loop.sampleRate() );

}

void draw() {
 background(255); 

 
 image(Image, 0, 0);
 
 fft.forward( loop.mix );
 for(int i = 0; i < fft.specSize(); i++) {
  line(i, height, i, height - fft.getBand(i)*8); 
 }
}

void keyPressed() {
   stroke(0);
 if ( key == 'a' ) riff1.trigger();
  if ( key == 's' ) riff2.trigger();
   if ( key == 'd' ) riff3.trigger();
    if ( key == 'f' ) riff4.trigger();  
 if ( key == 'a' ) println("riff 1 triggered");
  if ( key == 's' ) println("riff 2 triggered");
   if ( key == 'd' ) println("riff 3 triggered");
    if ( key == 'f' ) println("riff 4 triggered");
if ( key == 'a' ) stroke(#E31B1B);
  if ( key == 's' ) stroke(#E3DD1B);
   if ( key == 'd' ) stroke(#FA9D08);
    if ( key == 'f' ) stroke(#2557E8);  
if ( key == 'j' ) riff5.trigger();
  if ( key == 'k' ) riff6.trigger();
   if ( key == 'l' ) riff7.trigger();
    if ( key == ';' ) riff8.trigger();  
 if ( key == 'j' ) println("riff 5 triggered");
  if ( key == 'k' ) println("riff 6 triggered");
   if ( key == 'l' ) println("riff 7 triggered");
    if ( key == ';' ) println("riff 8 triggered");
if ( key == 'j' ) stroke(#9925E8);
  if ( key == 'k' ) stroke(0);
   if ( key == 'l' ) stroke(#E82580);
    if ( key == ';' ) stroke(#F27171); 
  }


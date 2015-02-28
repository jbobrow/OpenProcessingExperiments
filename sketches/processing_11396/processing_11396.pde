


/**
* This sketch demonstrates how to use an FFT to analyze an
* AudioBuffer and draw the resulting spectrum. <br />
* It also allows you to turn windowing on and off,
* but you will see there is not much difference in the spectrum.<br />
* Press 'w' to turn on windowing, press 'e' to turn it off.
*/

import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
FFT fft;
String windowName;

void setup()
{
size(800,600);
textMode(SCREEN);
strokeCap(ROUND);

noCursor();
//smooth();
minim = new Minim(this);

jingle = minim.loadFile("jingle.mp3", 2048);
jingle.loop();

// create an FFT object that has a time-domain buffer 
// the same size as jingle's sample buffer
// note that this needs to be a power of two 
// and that it means the size of the spectrum
// will be 512. see the online tutorial for more info.
fft = new FFT(jingle.bufferSize(), jingle.sampleRate());

textFont(createFont("Arial", 16));

windowName = "None";
}

void draw()
{
colorMode(RGB,width,width,height);
background(width-mouseX,mouseY-mouseX,height-mouseY);
colorMode(RGB,255,255,255);
stroke(255);

// perform a forward FFT on the samples in jingle's left buffer
// note that if jingle were a MONO file, 
// this would be the same as using jingle.right or jingle.left
fft.forward(jingle.mix);
for(int i = 0; i < fft.specSize(); i++)
{
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
strokeWeight(random(0,mouseX/50)+ fft.getBand(i));
//stroke(i+random(-50,50),255-i+random(-50,50),255-i+random(-50,50));
stroke(fft.getBand(i)*20,512-fft.getBand(i)*100,255-fft.getBand(i)*100+i*random(-1,1));
stroke(fft.getBand(i)*20,mouseX-fft.getBand(i)*100,mouseY-fft.getBand(i)*100+i*random(-1,1));
line(i+width/2 + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), i*2+width/2, height/2 - fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), width/2-i*2, height/2 - fft.getBand(i)*100);
line(i+width/2 + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), i*2+width/2, height/2 + fft.getBand(i)*100);
line(width/2-i + random(-width/20,width/20), height/2 + random(-width/5+i/2.5,width/5-i/2.5), width/2-i*2, height/2 + fft.getBand(i)*100);
//line(i, height, i*2, height - fft.getBand(i)*40);
}
fill(255);
// keep us informed about the window being used
text("The window being used is: " + windowName, 50, 50);
}

void keyReleased()
{
if ( key == 'w' )
{
// a Hamming window can be used to shape the sample buffer that is passed to the FFT
// this can reduce the amount of noise in the spectrum
fft.window(FFT.HAMMING);
windowName = "Hamming";
}

if ( key == 'e' )
{
fft.window(FFT.NONE);
windowName = "None";
}
}

void stop()
{
// always close Minim audio classes when you finish with them
jingle.close();
minim.stop();

super.stop();
}


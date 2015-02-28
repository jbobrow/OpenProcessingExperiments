
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer musica;
FFT fft;


PImage floresta;
PImage imagensss;
PImage preto;
PImage toca;
PImage i1;
PImage i2;
PImage i3;
PImage i4;
PImage L1;
PImage L2;

float Xi1;
float Xi2;
float Xi3;
float Xi4;

void setup(){
size(800, 600);
  
minim = new Minim(this);

musica = minim.loadFile("musica.mp3",2048);
musica.play();
fft = new FFT(musica.bufferSize(), musica.sampleRate());
   

floresta = loadImage("floresta.jpg");

toca = loadImage("toca.png");
i1 = loadImage("1.png");
i2 = loadImage("2.png");
i3 = loadImage("3.png");
i4 = loadImage("4.png");
L1 = loadImage("L1.png");
L2 = loadImage("L2.png");

Xi1=-100;

Xi2=800;
Xi3=-100;
Xi3=-800;
Xi4=3000;

  }

void draw(){
  background(0);
  
// Display the sprite at the position xpos, ypos
  image(floresta, 0, 0);
  image(i1,Xi1, 350);
  image(i2,Xi2, 340);
  image(i3,Xi3, 340);
  image(i4,Xi4, 350);
  
  Xi1=Xi1+1;
  
  if(Xi1 > 300){
  Xi1=300;
  Xi2=Xi2-1;
  }
  
  if(Xi2 < 620){
  Xi2=620;
  Xi3=165;
  Xi4=Xi4-1;
  
  }
  
if(Xi4 < 550){

  
    }

if(Xi4 < 450){


  
    }
   
stroke(130,130,10);
// perform a forward FFT on the samples in jingle's left buffer
// note that if jingle were a MONO file, this would be the same as using jingle.right or jingle.left
fft.forward(musica.mix);
for(int i = 0; i < fft.specSize(); i++)
  {
// draw the line for frequency band i, scaling it by 4 so we can see it a bit better
line(i, height, i, height - fft.getBand(i)*10);
  }
fill(0);
  // keep us informed about the window being used

}

void keyReleased()
{
  if ( key == 'w' ) 
  {
    // a Hamming window can be used to shape the sample buffer that is passed to the FFT
    // this can reduce the amount of noise in the spectrum
    fft.window(FFT.HAMMING);

  }
  
  if ( key == 'e' ) 
  {
    fft.window(FFT.NONE);

  }
}

void stop()
{
  // always close Minim audio classes when you finish with them
  musica.close();
  minim.stop();
  
  super.stop();
  
}





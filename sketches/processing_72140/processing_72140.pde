
//import background
PImage bg;
//lines
float p = 1000, q = 1000, x, y, r = 20;
//minim
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
 
 int bufferSize = 512;
 int fftSize = floor(bufferSize*.5f)+1;

void setup()
{
  size(600, 600);
  bg = loadImage("bg.png"); //call for bg
  smooth();
  minim = new Minim(this);
  song = minim.loadFile("eric.mp3", 512);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
 
void draw()
{
  /*background(bg);*/
  background(255);
  fill(random(0),random(218),random(174),random(50));
  noStroke();
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
  fill(50, 100 + 200 * sin(r/10), 255, 100);//colors
  x = 300+ 100 *cos(r)-20*cos(r*233/77);
  y = 300+ 100 *sin(r)-20*sin(r*233/77);
  if(p > 0)
    ellipse(p, q, song.left.get(i)*1000, song.left.get(i)*1000);
  else background(255);
  p = x;
  q = y;
  r+= PI/20;
  }
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}



/*import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
 
 int bufferSize = 512;
int fftSize = floor(bufferSize*.5f)+1;

void setup()
{
  size(600, 600);
  smooth();
  minim = new Minim(this);
  song = minim.loadFile("rain.mp3", 512);
  song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
 
void draw()
{
  background(255);
  fill(random(0),random(218),random(174),random(50));
  noStroke();
  for (int i = 0; i < song.bufferSize() - 1; i++)
  {
    ellipse(width/2, height/2, song.left.get(i)*500, song.left.get(i)*500);
  }
}
 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}
*/




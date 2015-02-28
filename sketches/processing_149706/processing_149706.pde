
import ddf.minim.analysis.*;    //calls for minium which is an external library for audio functions
import ddf.minim.*;

Minim       minim;
AudioPlayer song;
FFT         fft;
int w;
PImage fade;
float rWidth, rHeight;
int hVal;


void setup()
{
  size(800, 600);
  
  minim = new Minim(this);
  song = minim.loadFile("Feelgood.mp3", 1024);   //This is where you put the song file in the processing data files and rename it
  song.loop();
  fft = new FFT( song.bufferSize(), song.sampleRate() );
  fft.logAverages(60,7);
    stroke(255);
    w = width/fft.avgSize();
    strokeWeight(w);
    
    background(0);
    fade = get(0,0,width,height);
    rWidth = width * 0.99;
    rHeight = height * 0.99;
    hVal = 0;
    

}

void draw()
{
 

  
  background(0);
  
  tint(255,255,255,252);
  image(fade, (width - rWidth) / 2, (height - rHeight) / 2, rWidth, rHeight);
  noTint();
  
  fft.forward( song.mix );
  
  colorMode(HSB);
  stroke(hVal,255,255);
  colorMode(RGB);
  strokeCap(ROUND);
  for(int i = 0; i < fft.avgSize(); i++)
 {line( i * w, height, i * w, height - fft.getAvg(i)*4 );
  }
  
  fade = get(0,0,width,height);
  
  stroke(255);
  strokeCap(ROUND);
    for(int i = 0; i < fft.avgSize(); i++)
 {line( i * w, height, i * w, height - fft.getAvg(i)*4 );
  }
  for (int i = 0; i < 100; i=i+4) {
  
  
}
  
  hVal +=2;
  if(hVal > 255){
    hVal = 0;}
}




import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;

float xoff = 0.0;
float diam = 0;
float m=0.0;
float change = 0;
float decay = .90;
int x = 0;
int y = 0;


void setup() {
  size(500, 500);
  minim= new Minim(this);
    song = minim.loadFile("03 - 27.mp3");
    song.play();
  fft = new FFT(song.bufferSize(), song.sampleRate());
  fft.forward(song.left);
  fft.forward(song.right);
}

void draw() {
  smooth();
  ellipseMode(CENTER);
  change *= decay;
  xoff = xoff + .005;
  m = m + .01;
  float n = noise(xoff) * width;
  
  if (mousePressed){fill(0,0,0); 
                    stroke(255);}
    else{fill(255,255,255);
              stroke(0);}
  
  ellipse(x+n, y+noise(xoff*1.5)*(700), song.left.get(1)*200, song.right.get(1)*200); // Can't figure out better way to write the Y coordinates

}



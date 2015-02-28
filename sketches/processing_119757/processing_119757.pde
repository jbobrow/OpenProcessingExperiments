
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

AudioPlayer player;
Minim minim;

Minim mysound;
AudioOutput out;
TriangleWave sine2;
TriangleWave sine;
SawWave sine3;


PImage space;
int scanX = 0; 
int ballX; 
int ballY;
boolean stop; 


void setup() {
  size(500, 500);
  space = loadImage("spacejam copy.jpg"); 
  println(space.height);
   mysound = new Minim(this);
  out = mysound.getLineOut(Minim.STEREO);
   sine = new TriangleWave(400,0.5,out.sampleRate());
  sine2 = new TriangleWave(102,0.9,out.sampleRate());
  sine3= new SawWave(10,109,out.sampleRate());

out.addSignal(sine);
out.addSignal(sine2);
 minim = new Minim(this);
  player = minim.loadFile("Space Jam Theme Song.mp3", 200);
  player.play();
}

void draw() {  
  scanX ++;
  if (scanX > width) {
    scanX = 0;
  }
  image(space, 0, 0);
  stroke(255, 0, 0); 
  stop = false; 
  for (int j = 0; j < height; j++) {
    color x = get (scanX, j); 
    float value = (red(x) + green(x) + blue(x)) / 2; 
    if (value < 100 && stop == false) {
      ballX = scanX; 
      ballY = j; 
      stop = true;
    }
    frameRate(5);

  } 
  println (ballY); 
  noFill(); 
  ellipse (ballX, ballY, 20, 20);
  
   float freq = random(50,200);
  sine.setFreq(freq);
    sine.setFreq(freq+4);

}
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}




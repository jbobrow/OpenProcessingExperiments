
/**
 * Marco Basaldella - "Sistemi Multimediali" - Project 1
 *
 * Drawing of an electronic circuit under the lyrics of
 * Daft Punk's "Technologic" song.
 *
 * Due to the bad synchronization of Processing in audio,
 * modifyng the Lyrics class may be required if lyrics
 * are shown off beat. See the class documentation for
 * details.
 *
 * This animation uses code of the Processing Sample
 * "Frequency Energy"  by Damien Di Fede.
 */

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
Lyrics l = new Lyrics();
float push;

boolean go = false;

Circuit circuit[] = new Circuit[4];

FFT fft;

void setup()
{
  // 16/9 aspect ratio
  size(720,405,P3D);
  smooth();
  
  colorMode(HSB,360,360,360);
  
  minim = new Minim(this);  
  
  song = minim.loadFile("technologic.mp3");
  fft = new FFT(song.bufferSize(),song.sampleRate());
  fft.logAverages(60,3);
  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300); 
  bl = new BeatListener(beat, song);  
  
  //textFont(createFont("SanSerif", 16));
  textAlign(CENTER);
  
  circuit[0] = new Circuit(width/4,height/4,width,height,8,120); // 4th quadrant
  circuit[1] = new Circuit(width/4,3*height/4,width,height,8,120); // 3rd quadrant
  circuit[2] = new Circuit(3*width/4,height/4,width,height,8,120); // 1st quadrant
  circuit[3] = new Circuit(3*width/4,3*height/4,width,height,8,120); // 2nd quadrant
  
}

void draw()
{ 
  if (!go)
  {
    song.play();
    go = !go;
  }
  
  background(0);
  
  // calculate the "zoom" factor
  
  fft.forward(song.mix);
  
  float left = 0;
  for (int i = 0; i < 4; i++)
  {
    left+= fft.getAvg(i);
  }
  float right = 0;
  for (int i = 4; i < 8; i++)
  {
    right+= fft.getAvg(i);
  }
  
  float maxAvg = (left > right ? left : right * -1) / 20;
  
  if (abs(maxAvg) > 3 && abs(maxAvg) > push)
  {
    push = maxAvg;
  }
  else 
  {
    if (abs(push) < 1)
      push = 0;
    else
      push = push / 2;
  }
  
  pushMatrix();
  translate(0,0,push);
  
  if (beat.isKick()) 
  {
    for (int i = 0; i < circuit.length; i++)
      circuit[i].split();
  }
  
  for (int i = 0; i < circuit.length; i++)
  {
    circuit[i].update();
    circuit[i].display();
  }
  
  popMatrix();
  
  // write the lyrics
  fill(360);
  textSize(height/6);
  pushMatrix();
  translate(0,0,100);
  text(l.getWordAt(getBeatAt(song.position(),256)), width/2, height/2+(height/20),0);
  
  popMatrix();  
}

void mousePressed() 
{
  // If we think that the screen is a cartesian plot, 
  // let's check which quadrant the user clicked the mouse.
  
  if (mouseX < width/2 && mouseY < height/2)
  {
    // 4th quadrant (1st circuit)
    circuit[0].split(mouseX,mouseY);  
  } 
  else if (mouseX >= width/2 && mouseY > height/2)
  {
    // 2nd quadrant (4th circuit)
    circuit[3].split(mouseX,mouseY);
  }
  else if (mouseX >= width/2 &&  mouseY < height/2)
  {
    // 1st quadrant (3rd circuit)
    circuit[2].split(mouseX,mouseY);
  } 
  else 
  {
    // 3rd quadrant (2nd circuit)
    circuit[1].split(mouseX,mouseY);
  }
}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

int getBeatAt(int time, int bpm) {
  int sBeatDuration = 60000 / bpm;
  return time / sBeatDuration ;
}


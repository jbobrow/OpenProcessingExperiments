
//project 1 - 48257 S'12
//melissa (macy) goh copyright 2012
//adapted from hw#4, exploring sound
//used: class notes & processing api (http://processing.org/learning/library/frequencyenergy.html)


import ddf.minim.*;
import ddf.minim.analysis.*;

PFont font;

Minim m;
AudioPlayer s1, s2, s3, s4, s5;
BeatDetect beat;
BeatListener bl;
 
float x1, y1, x2, x3, x4, x5;
float dia;

int s;
 
void setup()
{
  size(600, 300);
  
  font = loadFont("CordiaNew-48.vlw");
  textAlign(CENTER);
  
  m = new Minim(this);

  s1 = m.loadFile("001.wav", 1024);
  s2 = m.loadFile("002.wav", 1024);
  s3 = m.loadFile("003.wav", 1024);
  s4 = m.loadFile("004.wav", 1024);
  s5 = m.loadFile("005.wav", 1024);
  
  beat = new BeatDetect(s1.bufferSize(), s1.sampleRate());
  beat = new BeatDetect(s2.bufferSize(), s2.sampleRate());
  beat = new BeatDetect(s3.bufferSize(), s3.sampleRate());
  beat = new BeatDetect(s4.bufferSize(), s4.sampleRate());
  beat = new BeatDetect(s5.bufferSize(), s5.sampleRate());

  beat.setSensitivity(100);

  bl = new BeatListener(beat, s1);
  bl = new BeatListener(beat, s2);
  bl = new BeatListener(beat, s3); 
  bl = new BeatListener(beat, s4);
  bl = new BeatListener(beat, s5);
    
  background(0);
  fill(255);
  smooth();
  frameRate(10);
  dia = 50;
  x1 = 100;
  y1 = 100;
  x2 = 200;
  x3 = 300;
  x4 = 400;
  x5 = 500;
}
 
void draw()
{
  fill(255);
  textFont(font, 48);
  text("1", x1, y1 - 40);
  text("2", x2, y1 - 40);
  text("3", x3, y1 - 40);
  text("4", x4, y1 - 40);
  text("5", x5, y1 - 40);
  
  textFont(font, 32);
  text("Press keys #1-5 for sounds to play", x3, y1 + 100);
  text("Mouse-click buttons to stop sounds", x3, y1 + 140);
  
  drawCircles();
  timeCircles();
}

void timeCircles()
{
  if(beat.isKick())
  {
    fill(random(255), random(255), random(255));
    ellipse(x1, y1, random(dia - 40, dia + 40), random(dia - 40, dia + 40)); 
    ellipse(x2, y1, random(dia - 40, dia + 40), random(dia - 40, dia + 40));
    ellipse(x3, y1, random(dia - 40, dia + 40), random(dia - 40, dia + 40));
    ellipse(x4, y1, random(dia - 40, dia + 40), random(dia - 40, dia + 40));
    ellipse(x5, y1, random(dia - 40, dia + 40), random(dia - 40, dia + 40));
  }
}
    

void drawCircles()
{
  noStroke();
  fill(0, 50);
  rect(0, 0, width, height);
  fill(255, 30);
  ellipse(x1, y1, dia, dia);
  ellipse(x2, y1, dia, dia);
  ellipse(x3, y1, dia, dia);
  ellipse(x4, y1, dia, dia);
  ellipse(x5, y1, dia, dia);
}  
 
void keyPressed()
{
  if (key == '1')
  {
    fill(random(255), random(255), random(255));
    ellipse(x1, y1, dia, dia); 
    
    s1.loop();
  }
   
  if (key == '2')
  {
    fill(random(255), random(255), random(255));
    ellipse(x2, y1, dia, dia); 
    
    s2.loop();
  }
   
  if (key == '3')
  {
    fill(random(255), random(255), random(255));
    ellipse(x3, y1, dia, dia); 
    
    s3.loop();
  }
   
  if (key == '4')
  {
    fill(random(255), random(255), random(255));
    ellipse(x4, y1, dia, dia); 
    
    s4.loop();
  }
   
  if (key == '5')
  {
    fill(random(255), random(255), random(255));
    ellipse(x5, y1, dia, dia); 
    
    s5.loop();
  }  
}

void mousePressed()
{
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x1, y1, dia, dia); 
    
    s1.pause();
    s1.rewind();
  }
   
  if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x2, y1, dia, dia); 
    
    s2.pause();
    s2.rewind();
  }
   
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x3, y1, dia, dia); 
    
    s3.pause();
    s3.rewind();
  }
   
  if (mouseX > x4 - dia/2 && mouseX < x4 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x4, y1, dia, dia); 
    
    s4.pause();
    s4.rewind();
  }
   
  if (mouseX > x5 - dia/2 && mouseX < x5 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(random(255), random(255), random(255));
    ellipse(x5, y1, dia, dia); 
    
    s5.pause();
    s5.rewind();
  }  
}

void mouseMoved()
{
   
  if (mouseX > x1 - dia/2 && mouseX < x1 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x1, y1, dia + 20, dia + 20);
  }
   
    if (mouseX > x2 - dia/2 && mouseX < x2 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x2, y1, dia + 20, dia + 20);     
  }
   
  if (mouseX > x3 - dia/2 && mouseX < x3 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x3, y1, dia + 20, dia + 20);     
  }
   
  if (mouseX > x4 - dia/2 && mouseX < x4 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x4, y1, dia + 20, dia + 20);     
  }
   
  if (mouseX > x5 - dia/2 && mouseX < x5 + dia/2 && mouseY > y1 - dia/2 && mouseY < y1 + dia/2)
  {
    fill(255, 20);
    ellipse(x5, y1, dia + 20, dia + 20);     
  }
}

void stop( )
{
  s1.close();
  s2.close();
  s3.close();
  s4.close();
  s5.close();
  
  m.stop();
  super.stop(); 
}

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
   
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
   
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
   
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}



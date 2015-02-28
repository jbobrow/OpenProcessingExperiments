
// sounds from http://www.freesound.org/people/pinkyfinger/packs/4409/
// songs adapted from http://pianosage.blogspot.com/2011/11/simple-5-finger-piano-songs-for.html and http://boards.straightdope.com/sdmb/showthread.php?t=272210
// Annie Ranttila
// Carnegie Mellon University, Fall 2013
// Final Project 1 - The Mouse Piano

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput   in;
AudioRecorder recorder;
AudioPlayer a,bb,b,c,cs,d,eb,e,f,fs,lg,g;
PImage mouse;
int [] keys = {80, 160, 240, 320, 400, 480, 560, 640, 720, 800, 880, 960};
color[] col1 = {color(248, 12, 18), 
color(255, 51, 17),
color(255, 102, 68), 
color(255, 153, 51),
color(254, 174, 45),
color(208, 195, 16),
color(105, 208, 37),
color(34, 204, 170),
color(17, 170, 187),
color(68, 68, 221),
color(51, 17, 187),
color(68, 34, 153)};



void setup()
{
  size(960, 400);
background(0);
  minim = new Minim(this);
  mouse = loadImage("mouse.png");
  in = minim.getLineIn();
  recorder = minim.createRecorder(in, "sound.wav", true);
  a = minim.loadFile("a.wav");
  bb = minim.loadFile("bb.wav");
  b = minim.loadFile("b.wav");
  c = minim.loadFile("c.wav");
  cs = minim.loadFile("cs.wav");
  d = minim.loadFile("d.wav");
  eb = minim.loadFile("eb.wav");
  e = minim.loadFile("e.wav");
  f = minim.loadFile("f.wav");
  fs = minim.loadFile("fs.wav");
  g = minim.loadFile("g.wav");
  lg = minim.loadFile("lg.wav");
  textFont(createFont("Arial", 12));
  textAlign( CENTER );
}

void draw()
{

  drawKeys();
  drawMouse();

}

void drawKeys()
{
  for(int i=0; i< keys.length; i++)
  {
  stroke(255);
  fill(col1[i]);
  rect(keys[i]-80, 0, keys[i], 200); 
  fill(255);
     if ( recorder.isRecording() )
  {
    fill(0);
    noStroke();
    rect(0, 330, width, 60);
    fill(255);
    text("Currently recording...press r to stop, s to save.", width/2, 345);
    text("Press A for Ode to Joy, B for Frere Jacques, C for When the Saints Go Marching In", width/2, 365);
    text("Click the mouse to play a tune.", width/2, 385);
  }
  else
  {
    fill(0);
    noStroke();
    rect(0, 330, width, 60);
    fill(255);
    text("Not recording, press r to record, s to save.", width/2, 345);
    text("Press A for Ode to Joy, B for Frere Jacques, C for When the Saints Go Marching In", width/2, 365);
    text("Click the mouse to play a tune.", width/2, 385);
  }
  }
}

void drawMouse()
{
  if(mouseY<200)
  {
  image(mouse, mouseX-26, mouseY-40);
  }
}

void mousePressed()
{
  if(mouseY<200 && mouseX<80)
  {
  lg.play( );
  lg = minim.loadFile("lg.wav"); 
  }
  else if (mouseY<200 && mouseX<160 && mouseX> 80)
  {
  a.play( );
  a = minim.loadFile("a.wav"); 
  }
  else if(mouseY<200 && mouseX<240 && mouseX> 160)
  {
  bb.play( );
  bb = minim.loadFile("bb.wav"); 
  }
  else if(mouseY<200 && mouseX<320 && mouseX> 240)
  {
  b.play( );
  b = minim.loadFile("b.wav"); 
  }
  else if(mouseY<200 && mouseX<400 && mouseX> 320)
  {
  c.play( );
  c = minim.loadFile("c.wav"); 
  }
  else if(mouseY<200 && mouseX<480 && mouseX> 400)
  {
  cs.play( );
  cs = minim.loadFile("cs.wav"); 
  }
  else if(mouseY<200 && mouseX<560 && mouseX> 480)
  {
  d.play( );
  d = minim.loadFile("d.wav"); 
  }
  else if(mouseY<200 && mouseX<640 && mouseX> 560)
  {
  eb.play( );
  eb = minim.loadFile("eb.wav"); 
  }
  else if(mouseY<200 && mouseX<720 && mouseX> 640)
  {
  e.play( );
  e = minim.loadFile("e.wav"); 
  }
  else if(mouseY<200 && mouseX<800 && mouseX> 720)
  {
  f.play( );
  f = minim.loadFile("f.wav"); 
  }
  else if(mouseY<200 && mouseX<960 && mouseX> 880)
  {
  fs.play( );
  fs = minim.loadFile("fs.wav"); 
  }
  else if(mouseY<200 && mouseX<880 && mouseX> 800)
  {
  g.play( );
  g = minim.loadFile("g.wav"); 
  }
}

void keyPressed()
{
  stroke(255);
    if (key == 'a' || key == 'A') 
    {
      background(0);
      text("Ode to Joy", width/2, 250);
      int i=8;
      fill(col1[i]);
      rect(255, 270, 15, 15);
      rect(270, 270, 15, 15);
      fill(col1[i+1]);
      rect(285, 270, 15, 15);
      fill(col1[i+3]);
      rect(300, 270, 15, 15);
      fill(col1[i+3]);
      rect(315, 270, 15, 15);
      fill(col1[i+1]);
      rect(330, 270, 15, 15);
      fill(col1[i]);
      rect(345, 270, 15, 15);
      fill(col1[i-2]);
      rect(360, 270, 15, 15);
      fill(col1[i-4]);
      rect(375, 270, 15, 15);
      rect(390, 270, 15, 15);
      fill(col1[i-2]);
      rect(405, 270, 15, 15);
      fill(col1[i]);
      rect(420, 270, 15, 15);
      rect(435, 270, 15, 15);
      fill(col1[i-2]);
      rect(450, 270, 15, 15);
      rect(465, 270, 15, 15);
      fill(col1[i]);
      rect(480, 270, 15, 15);
      rect(495, 270, 15, 15);
      fill(col1[i+1]);
      rect(510, 270, 15, 15);
      fill(col1[i+3]);
      rect(525, 270, 15, 15);
      fill(col1[i+3]);
      rect(540, 270, 15, 15);
      fill(col1[i+1]);
      rect(555, 270, 15, 15);
      fill(col1[i]);
      rect(570, 270, 15, 15);
      fill(col1[i-2]);
      rect(585, 270, 15, 15);
      fill(col1[i-4]);
      rect(600, 270, 15, 15);
      rect(615, 270, 15, 15);
      fill(col1[i-2]);
      rect(630, 270, 15, 15);
      fill(col1[i]);
      rect(645, 270, 15, 15);
      fill(col1[i-2]);
      rect(660, 270, 15, 15);
      fill(col1[i-4]);
      rect(675, 270, 15, 15);
      rect(690, 270, 15, 15);
    }
    else if (key == 'b' || key == 'B') 
    {
      background(0);
      text("Frere Jacques", width/2, 250);
      int i=0;
      fill(col1[i]);
      rect(375, 270, 15, 15);
      fill(col1[i+2]);
      rect(390, 270, 15, 15);
      fill(col1[i+3]);
      rect(405, 270, 15, 15);
      fill(col1[i]);
      rect(420, 270, 15, 15);
      rect(435, 270, 15, 15);
      fill(col1[i+2]);
      rect(450, 270, 15, 15);
      fill(col1[i+3]);
      rect(465, 270, 15, 15);
      fill(col1[i]);
      rect(480, 270, 15, 15);
      fill(col1[i+3]);
      rect(495, 270, 15, 15);
      fill(col1[i+5]);
      rect(510, 270, 15, 15);
      fill(col1[i+7]);
      rect(525, 270, 15, 15);
      fill(col1[i+3]);
      rect(540, 270, 15, 15);
      fill(col1[i+5]);
      rect(555, 270, 15, 15);
      fill(col1[i+7]);
      rect(570, 270, 15, 15);
    }
     else if (key == 'c' || key == 'C') 
    {
      background(0);
      text("When the Saints Go Marching In", width/2, 250);
      int i=8;
      fill(col1[i-4]);
      rect(240, 270, 15, 15);
      fill(col1[i]);
      rect(255, 270, 15, 15);
      fill(col1[i+1]);
      rect(270, 270, 15, 15);
      fill(col1[i+3]);
      rect(285, 270, 15, 15);
      fill(col1[i-4]);
      rect(300, 270, 15, 15);
      fill(col1[i]);
      rect(315, 270, 15, 15);
      fill(col1[i+1]);
      rect(330, 270, 15, 15);
      fill(col1[i+3]);
      rect(345, 270, 15, 15);
      fill(col1[i-4]);
      rect(360, 270, 15, 15);
      fill(col1[i]);
      rect(375, 270, 15, 15);
      fill(col1[i+1]);
      rect(390, 270, 15, 15);
      fill(col1[i+3]);
      rect(405, 270, 15, 15);
      fill(col1[i]);
      rect(420, 270, 15, 15);
      fill(col1[i-4]);
      rect(435, 270, 15, 15);
      fill(col1[i]);
      rect(450, 270, 15, 15);
      fill(col1[i-2]);
      rect(465, 270, 15, 15);
      fill(col1[i]);
      rect(480, 270, 15, 15);
      fill(col1[i-2]);
      rect(495, 270, 15, 15);
      fill(col1[i-4]);
      rect(510, 270, 15, 15);
      rect(525, 270, 15, 15);
      fill(col1[i]);
      rect(540, 270, 15, 15);
      fill(col1[i+3]);
      rect(555, 270, 15, 15);
      rect(570, 270, 15, 15);
      rect(585, 270, 15, 15);
      fill(col1[i+1]);
      rect(600, 270, 15, 15);
      fill(col1[i]);
      rect(615, 270, 15, 15);
      fill(col1[i+1]);
      rect(630, 270, 15, 15);
      fill(col1[i+3]);
      rect(645, 270, 15, 15);
      fill(col1[i]);
      rect(660, 270, 15, 15);
      fill(col1[i-4]);
      rect(675, 270, 15, 15);
      fill(col1[i-2]);
      rect(690, 270, 15, 15);
      fill(col1[i-4]);
      rect(705, 270, 15, 15);
    }
}

void keyReleased()
{

  if ( key == 'r' ) 
  {
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
    }
    else 
    {
      recorder.beginRecord();
    }
  }
  if ( key == 's' )
  {
    recorder.save();
    println("Done saving.");
  }}

void mouseReleased( )
{
   a.pause( );
   a.rewind( );
   b.pause( );
   b.rewind( );
   bb.pause( );
   bb.rewind( );
   c.pause( );
   c.rewind( );
   cs.pause( );
   cs.rewind( );
   d.pause( );
   d.rewind( );
   eb.pause( );
   eb.rewind( );
   e.pause( );
   e.rewind( );
   f.pause( );
   f.rewind( );
   fs.pause( );
   fs.rewind( );
   g.pause( );
   g.rewind( );
   lg.pause( );
   lg.rewind( );
}
void stop()
{
  minim.stop();
  super.stop();
}





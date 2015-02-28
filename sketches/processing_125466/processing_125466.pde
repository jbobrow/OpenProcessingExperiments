
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim m;
AudioOutput out;

float y1, dy1;
float[] stylusX = {150, 350, 550};

void setup()
{
  //setup
  size(600, 600);
  rectMode(CENTER);
  background(0);
  
  //minim note setup
  m = new Minim( this );
  out = m.getLineOut();
  out.setTempo( 120 );
  out.pauseNotes();
 
  soprano();
  bass();
  BGnoise();
  
  
  out.resumeNotes();
  frameRate(60);
}

void draw()
{
  
  background(0);
  title();
  BGvisualization();
  bassVisualization();
  sopranoVisuals();
  initStylus(stylusX, 550);
  
  
 
}

void sopranoVisuals()
{
  y1 = y1 + dy1;
  dy1 = 1;
  for (float h =218.75 ; h < 560; h+=6)
  {
    fill(213, 98, 255, 100);
    strokeWeight(.25);
    stroke(255, 120);
    rect (500, 8*h - y1, 150, 1);
  }
    for (float h =318 ; h < 494; h+=6)
  {
    rect (500, 8*h +1 - y1, 150, 1);
    rect (500, 8*h +2 - y1, 150, 1);
  }
}

void BGvisualization()
{
  y1 = y1 + dy1;
  dy1 = 1;
  for (float h =69; h < 700; h+=.125)
  {
    fill(160, 245, 255, 50);
    strokeWeight(.25);
    stroke(255, 120);
    rect (100, 8*h - y1, 150, .5);
  }
}

void bassVisualization()
{
  y1 = y1 + dy1;
  dy1 = 1;
  for (float h = 138; h < 450; h+=12)
  {
    fill(255, 139, 118);
    strokeWeight(.25);
    stroke(255, 50);
    rect (300, 8*h - y1, 150, 3);
  }
  for (float h = 264; h < 2880; h+=24)
  {
    fill(255, 139, 118);
    strokeWeight(.25);
    stroke(255, 50);
    rect (300, 8*h + 3.25 - y1, 150, 1.5);
  }
}

void bass()
{
  for (float i=12 ; i < 60; i+=2)
  {
  out.playNote(i, 0.75, "Bb2");
  out.playNote(2*i+3.25, 0.5, "A2");
  
  }
}
void BGnoise()
{
  for (float i= 6; i < 60; i+=.125)
  {
  out.playNote(i, 0.1, "C2");
  out.playNote(i, 0.1, "C2");
  out.playNote(i+4, 0.125, "G2");
  }
}
void soprano()
{

  for (int i= 20; i < 60; i+=1)
  {
   out.playNote(i, 0.5, "C4");
  }
  for (int i= 30; i < 50; i+=1)
  {
   out.playNote(i+.25, 0.25, "D4");
   out.playNote(i+.5, 0.25, "E4");
  }
}
  
void title()
{
  textAlign(CENTER);
  fill(255);
  textSize(40);
    text ( "MINIM JOCKEY", width/2, height*.15);
    textSize(20);
    text ( "minim note visualization", width/2, height*.25);
}

void initStylus(float[] arrayX, float y)
{
   for ( int i=0; i <arrayX.length; i++)
  {
    stylus(arrayX[i], y);
  }
}

void stylus( float x, float y)
{ 
    fill(180);
    noStroke();
    rect(x, y, 100, 10);
    quad(x - 100, y+ 12, x-100, y- 12, x-40, y-15, x-40, y+15);
    stroke (120);
    noFill();
    ellipse(x - 85, y, 20, 20);
    fill(0);
    noStroke();
    ellipse( x- 85, y, 5, 5);
}



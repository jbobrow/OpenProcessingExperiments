
//Project 6: Play by Leslie Bloomfield
//UCLA Design|Media Arts, Interactivity Fall 2010
//
//Sound code adapted from Krister Olsson's 'Spooky Stream Save' for Ess, found at http://www.tree-axis.com/Ess/_examples/spookyStreamSave/

import krister.Ess.*;

AudioStream colsou;
SquareWave sqw;

int value1 = 0;
int value2 = 2;

void setup ()
{
  size (480, 320);
  smooth ();
  background (255);
  
  Ess.start (this);
  colsou = new AudioStream ();
  colsou.smoothPan = true;
  
  sqw = new SquareWave (0, .66);
  
  colsou.start ();
}

void draw ()
{
  noStroke ();
  fill(#ffffff);
  rect(0, 0, 50, 19);
  
  //red
  fill (#ff0000);
  rect (0, 0, 7, 7);
  
  int left = 0;
  int right = 7;
  int top = 0;
  int bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if(mousePressed)
    {
      value1 = #ff0000;
    }
  }
  
  //orange
  fill (#ffc000);
  rect (7, 0, 7, 7);
  
  left = 7;
  right = 14;
  top = 0;
  bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value1 = #ffc000;
    }
  }
  
  //yellow
  fill (#ffff00);
  rect (14, 0, 7, 7);
  
  left = 14;
  right = 21;
  top = 0;
  bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value1 = #ffff00;
    }
  }
  
  //green
  fill (#00ff12);
  rect (21, 0, 7, 7);
  
  left = 21;
  right = 28;
  top = 0;
  bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value1 = #00ff12;
    }
  }
  
  //blue
  fill (#00c0ff);
  rect (28, 0, 7, 7);
  
  left = 28;
  right = 35;
  top = 0;
  bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value1 = #00c0ff;
    }
  }
  
  //purple
  fill (#8400ff);
  rect (35, 0, 7, 7);
  
  left = 35;
  right = 42;
  top = 0;
  bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value1 = #8400ff;
    }
  }
  
  //black
  fill (#000000);
  rect (42, 0, 7, 7);
  
  left = 42;
  right = 49;
  top = 0;
  bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value1 = #000000;
    }
  }
  
  //white
  strokeWeight(.5);
  stroke(#000000);
  fill (#ffffff);
  rect (49, 0, 6, 6);
  
  left = 49;
  right = 56;
  top = 0;
  bottom = 7;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value1 = #ffffff;
    }
  }
  
  //2
  fill(#000000);
  noStroke();
  ellipse(5, 12, 2, 2);
  
  
  left = 5;
  right = 14;
  top = 12;
  bottom = 14;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value2 = 2;
    }
  }
  
  //4
  fill(#000000);
  noStroke();
  ellipse(15, 12, 4, 4);
  
  
  left = 15;
  right = 19;
  top = 12;
  bottom = 16;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value2 = 4;
    }
  }
  
  //6
  fill(#000000);
  noStroke();
  ellipse(27, 12, 6, 6);
  
  
  left = 27;
  right = 33;
  top = 12;
  bottom = 18;
  
  if (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom)
  {
    if (mousePressed)
    {
      value2 = 6;
    }
  }
  
    if (mousePressed == true)
  {
    sqw.frequency = (int)(mouseX+100.0);
    noStroke ();
    fill (value1);
    ellipse (mouseX, mouseY, value2, value2);
  }
}

void audioStreamWrite(AudioStream theStream) 
{
  sqw.generate(colsou);
}

public void stop() 
{
  Ess.stop();
  super.stop();
}
  


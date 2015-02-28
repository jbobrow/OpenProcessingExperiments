
import arb.soundcipher.*;
import arb.soundcipher.constants.*;

SoundCipher aSample = new SoundCipher (this);
SCScore myScore = new SCScore();
int value, change;
int x = 400, y = 300, speedX = 4, speedY = 4, yy;
int [] notes = new int [16];
int note, even;
int seg = 0;
int randNote;

void setup()
{
  size(800, 600);
  background (0);
  frameRate (60);
}

void draw()
{
  back();
  segments();                                //4
  fill(0);
  line (width/4, 0, width/4, height);
  line (width/2, 0, width/2, height);
  line ((width/4)*3, 0, (width/4)*3, height);
  line (0, height/4, width, height/4);
  line (0, height/2, width, height/2);
  line (0, (height/4)*3, width, (height/4)*3);
  ballSpeed();
  drawPaddles();
  change = value;
}


void segments()
{
  randNote = (int) random(127);
  if (x < width/4 && y < height/4)
  {
    value = 1; note = 0;
  }
  else if (y < height/4 && x < width/2 && x >= width/4)
  {
    value = 2; note = 1;
  }
  else if (y < height/4 && x >= width/2 && x < (width/4)*3)
  {
    value = 3; note = 2;
  }
  else if (y < height/4 && x >= (width/4)*3)
  {
    value = 4; note = 3;
  }
  else if (y >= height/4 && y < height/2 && x < width/4)
  {
    value = 5; note = 4;
  }
  else if (y >= height/4 && y < height/2 && x >= width/4 && x < width/2)
  {
    value = 6; note = 5;
  }
  else if (y >= height/4 && y < height/2 && x >= width/2 && x < (width/4)*3)
  {
    value = 7; note = 6;
  }
  else if (y >= height/4 && y < height/2 && x >= (width/4)*3)
  {
    value = 8; note = 7;
  }
  else if (y < (height/4)*3 && y >= height/2 && x < width/4)
  {
    value = 9; note = 8;
  }
  else if (y < (height/4)*3 && y >= height/2 && x >= width/4 && x < width/2)
  {
    value = 10; note = 9;
  }
  else if (y < (height/4)*3 && y >= height/2 && x >= width/2 && x < (width/4)*3)
  {
    value = 11; note = 10;
  }
  else if (y < (height/4)*3 && y >= height/2 && x >= (width/4)*3)
  {
    value = 12; note = 11;
  }
  else if (y >= (height/4)*3 && y >= height/2 && x < width/4)
  {
    value = 13; note = 12;
  }
  else if (y >= (height/4)*3 && y >= height/2 && x >= width/4 && x < width/2)
  {
    value = 14; note = 13;
  }
  else if (y >= (height/4)*3 && y >= height/2 && x >= width/2 && x < (width/4)*3)
  {
    value = 15; note = 14;
  }
  else if (y >= (height/4)*3 && x >= (width/4)*3)
  {
    value = 16; note = 15;
  }
  background(255);
  notes[note] = randNote;
  println(value);
  if (value%2==1 && change!=value)                   //4a
  {
    aSample.playNote(randNote, 100, .25);
  }
  if (value%2==1 && change!=value)                   //4b
  {
    seg = seg + 1;
  }
  if (seg == 5)
  {
    seg = 0;
    aSample.instrument(random(127));
  }
  if (value%2==0 && change!=value)
  {
    note = note*5;
    aSample.playNote(note, 80, .50);
  }
  if (value == 14)
  {
    back();
  }
  int duration = (int) random(2.0);
  myScore.addNote(value, note, 100, duration);  
    
}



void ballSpeed()
{
    fill(0, 255, 255);
    ellipse(x, y, 20, 20);
    x = x + speedX;
    y = y + speedY;
    if (y >= height || y <= 0)
    {
      speedY = speedY * -1;
    }
    if (x >= width-20 || x <= 20)
    {
      speedX = speedX * -1;
    }
}

void drawPaddles()
{
  yy = y;
  if (yy <= 30) yy = 30;
  if (yy >= height-30) yy = height-30;
  rectMode(CENTER);
  fill(255, 0, 0);
  rect (10, yy, 20, 60);
  rect (width-10, yy, 20, 60);
  
}

void keyPressed() 
{
  int pause = keyCode;

  if (pause == 'S')
  {
    if (looping)
  {
    noLoop();
  }
    else
    {
      loop();
    }
  }
  if (key == 'p')
  {
    
  if (key==CODED)
  {
    if (key == ESC)
    {
       myScore.writeMidiFile("/Users/Twigg2/Desktop/Demo.mid");
    }
    if (keyCode == LEFT)
    {
      if (speedX < 0 && speedY < 0)
      {
        speedX = speedX + 1;
        speedY = speedY + 1;
        if (speedX > -1) speedX = 1;
        if (speedY > -1) speedY = 1;
      }
      else if (speedX > 0 && speedY < 0)
      {
        speedX = speedX - 1;
        speedY = speedY + 1;
        if (speedX < 1) speedX = 1;
        if (speedY > -1) speedY = -1;
      }
      else if (speedX < 0 && speedY > 0)
      {
        speedX = speedX + 1;
        speedY = speedY - 1;
        if (speedX > -1) speedX = -1;
        if (speedY < 1) speedY = 1;
      }
      else if (speedX >= 0 && speedY >= 0)
      {
        speedX = speedX - 1;
        speedY = speedY - 1;
        if (speedX < 1) speedX = 1;
        if (speedY < 1) speedY = 1;
      }
    }
    if (keyCode == RIGHT)
    {
      if (speedX < 0 && speedY < 0)
      {
        speedX = speedX - 1;
        speedY = speedY - 1;
        if (speedX < -5) speedX = -5;
        if (speedY < -5) speedY = -5;
      }
      else if (speedX > 0 && speedY < 0)
      {
        speedX = speedX + 1;
        speedY = speedY - 1;
        if (speedX > 5) speedX = 5;
        if (speedY < -5) speedY = -5;
      }
      else if (speedX < 0 && speedY > 0)
      {
        speedX = speedX - 1;
        speedY = speedY + 1;
        if (speedX < -5) speedX = -5;
        if (speedY > 5) speedY = 5;
      }
      else if (speedX >= 0 && speedY >= 0)
      {
        speedX = speedX + 1;
        speedY = speedY + 1;
        if (speedX > 5) speedX = 5;
        if (speedY > 5) speedY = 5;
      }
    }
    
  }
}
}

void back()
{
  background (255, 255, 20);
}


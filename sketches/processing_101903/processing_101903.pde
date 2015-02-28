
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 tangkk

// Abstract: This is an app making logically random guitar/piano mix melody by simply drawing on the screen


Maxim maxim;
AudioPlayer [] Piano;
int rann1 = 0;
int rann2 = 0;

int randrag1 = 0;
int randrag2 = 0;
boolean haveplayed = false;

void setup()
{
  size(768, 1024);
  maxim = new Maxim(this);
  Piano = loadAudio("Piano/Piano", ".wav", 22, maxim);
  background(0);
  rectMode(CENTER);

}

void draw()
{
  noFill();
}

void mouseDragged()
{ 
  // deal with the graphics
  float red = map(mouseX, 0, width, 0, 255);
  float blue = map(mouseY, 0, height, 0, 255);
  float green = dist(mouseX,mouseY,width/2,height/2);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 7, 10);
  float lineWidth = 1;
  
  noStroke();
  fill(0, alpha);
  rect(width/2, height/2, width, height);
  
  stroke(red, green, blue, 255);
  strokeWeight(lineWidth);
  
  float ran = random(1);
  if(ran > 0.3)
    brush1(mouseX, mouseY,speed, speed,lineWidth, Piano);
  if((ran > 0.2) && (ran <= 0.3))
    brush2(mouseX, mouseY,speed, speed,lineWidth, Piano);
  if((ran > 0.03) && (ran <= 0.2))
    brush3(mouseX, mouseY,speed, speed,lineWidth);
  if(ran <= 0.03)
    brush4(pmouseX, pmouseY,mouseX, mouseY,lineWidth);
  
  if (haveplayed == false) {
    randrag1 = (int)random(22);
    if(random(1) < 0.1) {
      Piano[randrag1].play();
      haveplayed = true;
      ellipse(mouseX,mouseY,randrag1*15,randrag1*15);
    }
    randrag2 = (int)random(22);
    if(random(1) < 0.03) {
      Piano[randrag2].play();
      haveplayed = true;
      ellipse(mouseX,mouseY,randrag2*15,randrag2*15);
    }
  }
  
}

void mousePressed()
{
  Piano[rann2].stop();
  rann1 = (int)random(22);
  Piano[rann1].play();
  ellipse(mouseX,mouseY,rann1*8,rann2*8);
}

void mouseReleased()
{
  
  Piano[rann1].stop();
  Piano[randrag1].stop();
  Piano[randrag2].stop();
  haveplayed = false;
  
  rann2 = (int)random(22);
  Piano[rann2].play();
  ellipse(mouseX,mouseY,rann2*8,rann1*8);
}


//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 tangkk


void brush1(float x,float y, float px, float py, float lineWidth, AudioPlayer []  Piano) {
  strokeWeight(lineWidth);
  //ellipse(x,y,px,py);
  line(x,y,0,0);
//  line(x,y,width,0);
//  line(x,y,0,height);
//  line(x,y,width,height);
  
  int pitchSelect;
  int unit = height/21;
  System.out.println("unit: " + unit);
  pitchSelect = (int)(y/unit);
  if(pitchSelect < 0)
    pitchSelect = 0;
  if(pitchSelect > 21)
    pitchSelect = 21;
  System.out.println("pitchSelect: " + pitchSelect);
  //Piano[21-pitchSelect].play();
  
  return;
}


void brush2(float x,float y, float px, float py, float lineWidth, AudioPlayer [] Piano) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  rect(0+random(50),0+random(50),10,10);
  popMatrix();
  
  int pitchSelect = (int)(x+random(50))%22;
  if(pitchSelect < 0)
    pitchSelect = 0;
  if(pitchSelect > 21)
    pitchSelect = 21;
  System.out.println("pitchSelect: " + pitchSelect);
  if(random(1)>0.5)
    //Piano[pitchSelect].play();
  return;
}

void brush3(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  pushMatrix();
  translate(x,y);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  rotate(random(px));
  line(0+random(50),0+random(50),0,0);
  popMatrix();
  return;
}

void brush4(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  //line(px,py,x,y);
  triangle(px,py,width-x,height-y, width, height);
  triangle(width/2+((width/2)-px),py,width-(width/2+((width/2)-x)),height-y, width, 0);
  triangle(px,height/2+((height/2)-py),width-x,height-(height/2+((height/2)-y)), 0, height);
  triangle(width/2+((width/2)-px),height/2+((height/2)-py),width-(width/2+((width/2)-x)),height-(height/2+((height/2)-y)), 0, 0);
  return;
}

//The MIT License (MIT)

//Copyright (c) 2013 tangkk

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


AudioPlayer [] loadAudio(String stub, String extension, int numAudios, Maxim maxim)
{
  AudioPlayer [] Samples = new AudioPlayer[0];
  for(int i =0; i < numAudios; i++)
  {
    AudioPlayer Sample = maxim.loadFile(stub+i+extension);
    Sample.setLooping(false);
    Sample.volume(0.5);
    if(Sample != null)
    {
      Samples = (AudioPlayer [])append(Samples,Sample);
    }
    else
    {
      break;
    }
  }
  return Samples;
}



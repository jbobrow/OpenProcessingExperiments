
import Maxim;
Maxim maxim;
AudioPlayer track1;
AudioPlayer track2;
boolean playit;
int elements = 20;
float volumeAdjust = 1.0;

void setup()
{
  size(768,1024);  
  background(0);
  maxim = new Maxim(this);
  track1 = maxim.loadFile("beat1.wav");
  track1.setLooping(true);
  track1.setAnalysing(true);
  track2 = maxim.loadFile("beat2.wav");
  track2.setLooping(true);
  track2.setAnalysing(true);
  track1.volume(volumeAdjust);
  track2.volume(volumeAdjust);
  colorMode(HSB);
}

void draw()
{
  float t1_pow = 0;
  float t2_pow = 0;
  track1.play();
  t1_pow = track1.getAveragePower();  
  track2.play();  
  track2.speed(track2.getLengthMs()/track1.getLengthMs());
  t2_pow = track2.getAveragePower();  
  t1_pow = t1_pow * 2;
  t2_pow = t2_pow * 2;
  track1.volume(volumeAdjust);
  track2.volume(volumeAdjust); 
  fill(0,70);    
  rectMode(CENTER);
  rect(width/2, height/2, width, height);
  noFill();
  strokeWeight(2);
  for (int i = 0; i < elements;i++) {
    // First light
    stroke(i*2, 255, 255, 50);
    pushMatrix();    
    stroke(1);
    fill(i*2,255,255,10);
    ellipse(i * i, i*i,i*(t1_pow*20),i*(t2_pow*20));
    //line(0, i*((t1_pow+t2_pow)*20)-200, 0, 0);
    //rotate(i*i);
    //translate(sin(i*i)*i, 0);
    //rotate(-(i*i));
    //line(0, i*(t1_pow*10)-(width/4),0,i*(t2_pow*10)-(height/4));
    rotate(i*i);
    popMatrix();
    stroke(255, 0, 0);
    // Second light
    pushMatrix();    
    stroke(1);
    fill(i*2,255,255,10);
    ellipse(width - (i * i), i*i,i*(t1_pow*20),i*(t2_pow*20));    
    rotate(-i*i);
    popMatrix();
    stroke(255, 0, 0);
    // Third light
    pushMatrix();    
    stroke(1);
    fill(i*2,255,255,10);
    ellipse((i * i), height - i*i,i*(t1_pow*20),i*(t2_pow*20));    
    rotate(i);
    popMatrix();
    stroke(255, 0, 0);
    // Fourth light
    pushMatrix();    
    stroke(1);
    fill(i*2,255,255,10);
    ellipse(width - i*i, height - i*i,i*(t1_pow*20),i*(t2_pow*20));    
    rotate(-i*i);
    popMatrix();
    stroke(255, 0, 0);
    // Fifth (top-down) light
    pushMatrix();    
    noStroke();
    fill(i*2,255,255,10);
    ellipse(width/2, i*i,i*(t1_pow*20),i*(t2_pow*20));    
    //line(0, i*(t1_pow*10)-(width/4),0,i*(t2_pow*10)-(height/4));
    rotate(-i*i);
    popMatrix();
    stroke(255, 0, 0);
    // Sixth (left to right) light
    pushMatrix();    
    noStroke();
    fill(i*2,255,255,10);
    ellipse(i*i, height/2,i*(t1_pow*20),i*(t2_pow*20));    
    rotate(-i*i);
    popMatrix();
    stroke(255, 0, 0);
    // Seventh (right to left) light
    pushMatrix();    
    noStroke();
    fill(i*2,255,255,10);
    ellipse(width-(i*i), height/2,i*(t1_pow*20),i*(t2_pow*20));    
    rotate(i*i);
    popMatrix();
    stroke(255, 0, 0);
    // Eighth (down to top) light
    pushMatrix();    
    noStroke();
    fill(i*2,255,255,10);
    ellipse(width/2, height - i*i,i*(t1_pow*20),i*(t2_pow*20));    
    rotate(i*i);
    popMatrix();
    stroke(255, 0, 0);
  } 
}


void mousePressed()
{
//   playit = !playit;
//
//  if (playit) {
//
//    track1.play();
//    track2.play();
//  } 
//  else {
//
//    track1.stop();
//    track2.stop();
//  }
}

void mouseDragged() {
   volumeAdjust=map(mouseX,0,width,0,2);
   elements = (int) map(mouseX,0,width,20,60);
}

//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}



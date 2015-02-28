
// MyAudioVisualiser
// Modified by Alfi Rizal on June 30, 2013
// Peer Assessments 1
// Creative Programming for Digital Media & Mobile Apps
// Coursera

//The MIT License (MIT) - See Licence.txt for details
//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//When running on the iPad or iPhone, you won't see anything unless you tap the screen.
//If it doesn't appear to work first time, always try refreshing the browser.

Maxim maxim;
AudioPlayer player;

float magnify = 100; // This is how big we want the rose to be.
float phase = 0; // Phase Coefficient : this is basically how far round the circle we are going to go
float amp = 0; // Amp Coefficient : this is basically how far from the origin we are.
int elements = 128;// This is the number of points and lines we will calculate at once. 1000 is alot actually. 
float threshold = 0.35;// try increasing this if it jumps around too much
int wait = 0;
boolean playit = false;

// Visual
float speedAdjust = 1.0;
PImage [] recordPlayer;
int deckx, decky;
float rotateDeck = 0;
PImage TV;
int margin = width/40;

void setup() {
  //The size is iPad Portrait.
  //If you want landscape, you should swap the values.
  // comment out if you are on Android!
  size(768, 1024);
  ///size(1024, 768);
  
  // Adding visual
  imageMode(CENTER);
  recordPlayer = loadImages("black-record_", ".png", 36);
  TV = loadImage("TV.png");
  
  maxim = new Maxim(this);
  player = maxim.loadFile("mybeat.wav");
  player.setLooping(true);
  player.volume(1.0);
  player.setAnalysing(true);
  rectMode(CENTER);
  background(0);
  colorMode(HSB);
}

void draw() {
  background(0);
  imageMode(CENTER);
  image(TV, width/2, height/2, width, height-recordPlayer[0].height);
  ///image(TV, width/2, TV.height/2+margin, TV.width, TV.height);
  deckx = width/2; ///(width/4)-recordPlayer[0].width/2-(margin*10);
  decky = height-(recordPlayer[0].height+margin); ///TV.height + recordPlayer[0].height/2 + margin;
  image(recordPlayer[(int) rotateDeck], deckx, decky, recordPlayer[0].width, recordPlayer[0].height);
  
  float power = 0;
  if (playit) {
    player.play();
    player.speed(speedAdjust); // mytry
    power = player.getAveragePower();
    //detect a beat
    if (power > threshold && wait<0) {
      //println("boom");
      //a beat was detected. Now we can do something about it
      //amp+=power; // for example alter the animation
      phase+=power*10; 
      wait+=10; //let's wait a bit before we look for another beat
    }
    wait--;// counting down...
  }
  
  amp += 0.05;//get the mouse Y coordinate and use it to set the current amp coefficient
  float spacing = TWO_PI/elements; // this is how far apart each 'node' will be - study it. 
  translate(width/2, height/2);// we translate the whole sketch to the centre of the screen, so 0,0 is in the middle.
  fill(0, 50);
  rect(0, 0, width, height);
  noFill();
  strokeWeight(2);
  for (int i = 0; i < elements;i++) {
    stroke(i*2, 255, 255, 50);
    pushMatrix();
    rotate(spacing*i*phase);
    translate(sin(spacing*amp*i)*magnify, 0);
    rotate(-(spacing*i*phase));
    //line(0, i*(power*10)-(width/4),0,i*(power*10)-(height/4));
    rotate(i);
    //noStroke();
    //fill(i*2,255,255,10);
    //ellipse(0,0,i*(power*10),i*(power*10));
    ///line(0, i*(power*10)-200, 0, 0);
    
    //ellipse(0, 0, i*(power*2), i*(power*5));
    //rect(0, 0, i*(power*10), i*(power*10));
    //quad(0, 0, 0, i*(power*3), i*(power*3), i*(power*5), i*(power*5), 0);
    triangle(0, 0, 0, i*(power*2), i*(power*2), i*power);
    
    popMatrix();
    stroke(255, 0, 0);
  }
  
  if (playit) {
    rotateDeck += 1*speedAdjust;
    if (rotateDeck >= recordPlayer.length) {
      rotateDeck = 0;
    }
  }

}

void mouseClicked() {
  if(dist(mouseX, mouseY, deckx, decky) < recordPlayer[0].width/2){
     playit = !playit;
  }
  
  if (playit) {
    player.play();
  } 
  else {
    player.stop();
  }
}

void mouseDragged() {
  if (mouseY > height-recordPlayer[0].height) {  
    speedAdjust = map(mouseX, 0, width, 0, 2);
  } 
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



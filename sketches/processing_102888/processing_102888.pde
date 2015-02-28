
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

// Sources of images, sound, music and video
// openclipart.org   freesound.org  and  archive.org 

//Software Used
// Audacity 2.0.3  Free Digital Audio Editor

// Audio Recording and Screencast using QuickTime Player 10.1 [CallMeemaw.mp4] 

//   Processing sketch [CallMeemaw] uploaded to openprocessing.org

//  Screencast of CallMeemaw posted on YouTube

  Maxim maxim;

 AudioPlayer cellphoneplayer;
  
PImage img, img1, img2, img3, img4;

PImage [] images;

 int meemawmargin1;
 int meemawmargin2;

 int margin = width/40;
 
//test
// float currentFrame=0;

  int currentPosition=0;
  

 
 // a boolean variable to control
// whether the animation is playing

boolean playing = false;
 
// Declare variable types used to draw the clock

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup()
{
  
   size(768, 1024);
  
maxim = new Maxim(this); 

cellphoneplayer = maxim.loadFile("MeemawandPhoneCall.wav");
cellphoneplayer.setLooping(false);

 // Set the color of the background of the display window to be white (255).
 
  background(255);
  
  // Sets the color used to draw lines and borders around shapes to be white
  
    stroke(255);
    
 // Setup to draw animated clock 
 
  int radius = min(width, height) * 0.10;
   
  secondsRadius = radius * 0.72;
  minutesRadius = radius * 0.60;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width * 0.10;
  cy = height * 0.10;
  
   // Load display window wallpaper image
  
  img = loadImage("london768by1024.png");
  
  // Load cellphone, play button, photo, and tv
  
  img1 = loadImage("blueplay1.png");
  img2 = loadImage("cellphone.png");
  img3 = loadImage("meemaw.jpg");
  img4 = loadImage("TV.png");
  
images = loadImages("Animation_data_100frames/movie", ".jpg", 100);

}

void draw()
{
  
// “img” is used as the background (wallpaper) for this sketch.   
 
image(img, 0, 0);

tint(255,128);  
  
 image(img1, 0.075*img.width, img.height * 0.60);

 image(img2, 0.10*img.width, img.height * 0.25);
 
 meemawmargin2 = img.height*.01;

image(img3, 0, img.height*0.80 + meemawmargin2);

//test
//image(images[(int)currentFrame], 0.35*img.width, img.height*0.55);

// image(img4, 0.35*img.width, img.height*0.55);

image(images[currentPosition], 0.35*img.width, img.height*0.55);

 image(img4, 0.31*img.width, img.height*0.55);

 // the if statement means that
  // we only move to the next frame 
  // if playing is true
  
  if(playing) 
  {
    
    currentPosition += 1;

 if (currentPosition >= images.length)
 {

currentPosition = 0;

     }
  }

  

// Draw the clock background
  
  fill(80);
  noStroke();
  
 // The default mode is ellipseMode(CENTER)
 // which interprets the first two parameters of ellipse() 
 // as the shape's center point, while the third and fourth 
 // parameters are its width and height.
 
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  
  stroke(255);

  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);

  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);

  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  
  strokeWeight(2);
  
beginShape(POINTS);
  
  for (int a = 0; a < 360; a+=6) {
    
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
    
  }
  
  endShape();
  
}

void mouseDragged()
{

}

void mousePressed()
{

if ( mouseX <  img.width*0.20 && mouseY >  img.height*0.50 && mouseY < 
img.height*0.75 )  
{

  cellphoneplayer.cue(0);
  cellphoneplayer.play();

}

// when the mouse is pressed
// toggle playing the animation

if ( mouseX >  img.width*0.30 ) 
{

playing = !playing;

}

}

void mouseReleased() {

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



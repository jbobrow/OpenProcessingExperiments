

PImage [] theFire;
PImage [] theRain;
int fcurrentFrame = 0;
int rcurrentFrame = 0;

float fire_ypos = 50;
float rain_ypos = 50;

float FIRE_HEIGHT = 0;
float RAIN_HEIGHT = 0;

float MAX_FHEIGHT = 0;
float MAX_RHEIGHT = 0;
float fImgWidth = 0;
float rImgWidth = 0;

float fire_volume = 0;
float rain_volume = 0;
boolean sfireplaying = false;
boolean swaterplaying = false;
float red = 0;
float blue = 0;

Maxim maxim;
AudioPlayer sfire;
AudioPlayer swater;
float speedAdjust=1.0;

float map_height(float position, float max_height) {
  float h = 0;
  if (position <= height/2) {
    h = map(position, 0 , height/2, 50, max_height);
  } 
  else {
     h = map(position, height , height/2, 50, max_height);
  }
//  println("   map_height=> h:"+h+" pos:"+position+" max_height:"+max_height+ " height:"+ height);
  return h ;
}

float map_volume(float position, float max_vol) {
  float v = 0;
  if (position <= height/2) {
    v = map(position, 0 , height/2, 0.3, max_vol);
  } 
  else {
     v = map(position, height , height/2, 0.3, max_vol);
  }
  return v ;
}

float map_color(float position) {
  float c = 0;
  if (position <= height/2) {
    c = map(position, 0 , height/2, 0,255);
  } 
  else {
    c = map(position, height , height/2, 0, 255);
  }
  return c ;
}

void setup() 
{ 
 size(768,600);
 imageMode(CENTER); 
 theFire = loadImages("fire",".jpg",132);
 theRain = loadImages("rain",".jpg",132);
 maxim = new Maxim(this);
 sfire = maxim.loadFile("sound_fire.wav");
 sfire.setLooping(true);
 swater = maxim.loadFile("sound_water.wav");
 swater.setLooping(true);
 background(10);
}

void draw() {
  background(red, 0 , blue);
  
  imageMode(CENTER);
  if (MAX_FHEIGHT == 0 && theFire[0].height > 0) {
     MAX_FHEIGHT = width/2 * theFire[0].height / theFire[0].width;
     FIRE_HEIGHT = map_height(fire_ypos, MAX_FHEIGHT);
     fImgWidth = FIRE_HEIGHT  * theFire[0].width / theFire[0].height;
  }
  image(theFire[fcurrentFrame], width/4, fire_ypos, fImgWidth, FIRE_HEIGHT);
  fcurrentFrame++;
  if (fcurrentFrame >= theFire.length){
    fcurrentFrame = 0;
  }
 
  if (MAX_RHEIGHT == 0  && theRain[0].height > 0) {
   MAX_RHEIGHT = width/2 * theRain[0].height / theRain[0].width;
   RAIN_HEIGHT = map_height(rain_ypos, MAX_RHEIGHT);
   rImgWidth = RAIN_HEIGHT  * theRain[0].width / theRain[0].height;
  }
  image(theRain[rcurrentFrame], width/2 + width/4, rain_ypos, rImgWidth, RAIN_HEIGHT);
  rcurrentFrame++;
  if (rcurrentFrame >= theRain.length){
    rcurrentFrame = 0;
  }
}

void mouseDragged() {

  if(mouseY < 0) {
      mouseY = 0;
    }
    else if (mouseY > height){
      mouseY = height;
    }  
  if(mouseX < width/2) {
   FIRE_HEIGHT = map_height(mouseY, MAX_FHEIGHT);
   fImgWidth = FIRE_HEIGHT  * theFire[0].width / theFire[0].height;
   fire_ypos = mouseY;
   if (fire_ypos - FIRE_HEIGHT/2 < 0) {
      fire_ypos = FIRE_HEIGHT/2;
     }
    else if ( fire_ypos + FIRE_HEIGHT/2 > height ) {
      fire_ypos = height - FIRE_HEIGHT/2 ;
    }
  }
  else {
    RAIN_HEIGHT = map_height(mouseY, MAX_RHEIGHT);
    rImgWidth = RAIN_HEIGHT  * theRain[0].width / theRain[0].height;
    rain_ypos = mouseY;
    if (rain_ypos - RAIN_HEIGHT/2 < 0) {
      rain_ypos = RAIN_HEIGHT/2 ;
     }
    else if ( rain_ypos + RAIN_HEIGHT/2 > height ) {
      rain_ypos = height - RAIN_HEIGHT/2 ;
    }    
  }
   fire_volume = map_volume(fire_ypos, 10);
   rain_volume = map_volume(rain_ypos, 1);
  
  sfire.volume(fire_volume);
//  if (!sfire.isPlaying()) {
//    sfire.play();
//    sfire.speed(speedAdjust);
//  }
  swater.volume(rain_volume);
//  if (!swater.isPlaying()) {
//    swater.play();
//    swater.speed((swater.getLengthMs()/sfire.getLengthMs())*speedAdjust);
//  }

   red = map_color(fire_ypos);
   blue = map_color(rain_ypos);
}

void mousePressed() {
   if(mouseX < width/2) {
     sfireplaying = ! sfireplaying;
     if (sfireplaying) {
          sfire.play();
          sfire.speed(speedAdjust);
          red = map_color(fire_ypos);
     }
     else {
       sfire.stop();
       red = 0;
     }
   }
  else {
        swaterplaying = ! swaterplaying;
     if (swaterplaying) {
         swater.play();
         swater.speed((swater.getLengthMs()/sfire.getLengthMs())*speedAdjust);
         blue = map_color(rain_ypos);
     }
     else {
       swater.stop();
       blue = 0;
     }
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



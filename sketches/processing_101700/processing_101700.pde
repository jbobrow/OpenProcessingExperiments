

int catX, catY;
int trailMod = 3;
IntList starX;
IntList starY;
IntList trailX;
IntList trailY;
IntList starSize;
IntList starType;
int trailTimer, catTimer;
float followSpeed = 5;
float scrollSpeed = 6;
float x, y, z;

boolean musicPlaying = true;
boolean overlap = true;
boolean trailFlip = false;
boolean isFollowing = false;
int currentFrame = 0;
PImage [] cat;
PImage [] stars;
PImage trail;

void setup()
{
  starX = new IntList();
  starY = new IntList();
  starSize = new IntList();
  starType = new IntList();
  trailX = new IntList();
  trailY = new IntList();
  size(1024,512);
  imageMode(CENTER);
  cat = loadImages("Animation_data/cat", ".gif", 12);
  stars = loadImages("Animation_data/star", ".jpg", 3);
  trail = loadImage("Animation_data/trail0.png");  
  catX = width/2;
  catY = height/2;
}

void draw()
{
  background(0); 
  imageMode(CENTER);
  x = catX - mouseX;
  y = catY - mouseY;
  z = sqrt(x*x + y*y);
  //move cat
  if(isFollowing && abs(catX-mouseX)>followSpeed/2 && abs(catY-mouseY)>followSpeed/2){
    catX -= followSpeed * x/z;
    catY -= followSpeed * y/z;
    if(followSpeed < 12) followSpeed+=0.25;
    }else{
      if(followSpeed > 5) followSpeed-=0.25;
    }
  //spawn trail
  if(!isFollowing) trailTimer++;
  if(trailTimer >= 8){
    trailTimer=0;
    trailMod *= -1;
  }
  trailY.append(catY+trailMod);
  trailX.append(catX-10);
  //scroll trail
  for(int i = 0; i < trailX.size(); i++){
    trailX.sub(i, (int)scrollSpeed);
  }
  //kill trail
  for(int i = 0; i < trailX.size(); i++){
    if(trailX.get(i) <= -40){
      trailX.remove(i);
      trailY.remove(i);
    }
  }
  //spawn stars
  if((int)random(10) == 1){
    starX.append(1040);
    starY.append((int)random(9, 503));
    starType.append((int)random(3));
    starSize.append((int)random(4,11));
  }
  //scroll stars
  for(int i = 0; i < starX.size(); i++){
    starX.sub(i, (int)scrollSpeed);
  }
  //kill stars
  for(int i = 0; i < starX.size(); i++){
    if(starX.get(i) <= -40){
      starX.remove(i);
      starY.remove(i);
      starSize.remove(i);
      starType.remove(i);
    }
  }
  //drawStars
  if(starX.size()>0){
  for(int i = 0; i < starX.size(); i++){
    image(stars[starType.get(i)], starX.get(i), starY.get(i), stars[starType.get(i)].width/20*starSize.get(i), stars[starType.get(i)].height/20*starSize.get(i));
  }
}
  //draw trail
  if(trailX.size()>0){
    if(overlap){
        for(int i = 0; i < trailX.size(); i++){
          image(trail, trailX.get(i), trailY.get(i), trail.width/2, trail.height/4);
        }
      }else{
        for(int i = trailX.size()-1; i > 1; i--){
        image(trail, trailX.get(i), trailY.get(i), trail.width/2, trail.height/4);
      }
    }
  }
   //draw cat
  image(cat[currentFrame], catX, catY, cat[0].width/1.4, cat[0].height/1.4);
  catTimer++;
  if(catTimer >= 4){
    catTimer=0;
    currentFrame++;
  }
  if (currentFrame >= cat.length) {
    currentFrame = 0;
  }
}


void mousePressed()
{
  isFollowing = true;
}

void mouseReleased()
{
  isFollowing = false;
}  

void keyPressed() {
if(key=='+' || key=='=' && scrollSpeed <10) scrollSpeed++;
if(key=='-' && scrollSpeed >2) scrollSpeed--;
if(key=='/' || key =='|' || key == '\\') overlap = !overlap;
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



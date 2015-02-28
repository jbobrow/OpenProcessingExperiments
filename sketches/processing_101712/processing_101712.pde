

int catX, catY;
int trailMod = 3;
int starCount; int trailCount;
int[] starX;
int[] starY;
int[] trailX;
int[] trailY;
int[] starSize;
int[] starType;
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
  starX = new int[500];
  starY = new int[500];;
  starSize = new int[500];
  starType = new int[500];
  trailX = new int[500];
  trailY = new int[500];
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
  trailY[trailCount]=catY+trailMod;
  trailX[trailCount]=catX-10;
  trailCount++;
  //scroll trail
  for(int i = 0; i < trailCount-1; i++){
    trailX[i] -= (int)scrollSpeed;
  }
  //kill trail
  for(int i = 0; i < trailCount; i++){
    if(trailX[i] <= -40){
      for(int j = i; j < trailCount; j++){
        trailY[j] = trailY[j+1];
        trailX[j] = trailX[j+1];
      }
    trailCount--;
  }
  }
  //spawn stars
  if((int)random(10) == 1){
    starX[starCount]=1040;
    starY[starCount]=(int)random(9, 503);
    starType[starCount]=(int)random(3);
    starSize[starCount++]=(int)random(4,11);
  }

  //scroll stars
  for(int i = 0; i < starCount; i++){
    starX[i] -= (int)scrollSpeed;
  }
  //kill stars
  for(int i = 0; i < starCount; i++){
    if(starCount <= -40){
      for(int j = i; j < starCount; j++){
        starX[j] = starX[j+1];
        starY[j] = starY[j+1];
        starSize[j] = starSize[j+1];
        starType[j] = starType[j+1];
      }
      starCount--;
    }
  }
  //drawStars
  if(starCount>0){
  for(int i = 0; i < starCount; i++){
    image(stars[starType[i]], starX[i], starY[i], stars[starType[i]].width/20*starSize[i], stars[starType[i]].height/20*starSize[i]);
  }
}
  //draw trail
  if(trailCount>0){
    if(overlap){
        for(int i = 0; i < trailCount; i++){
          image(trail, trailX[i], trailY[i], trail.width/2, trail.height/4);
        }
      }else{
        for(int i = trailCount-1; i > 1; i--){
        image(trail, trailX[i], trailY[i], trail.width/2, trail.height/4);
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



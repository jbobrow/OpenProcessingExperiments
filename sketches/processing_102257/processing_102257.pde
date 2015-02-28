
int margin = 0;

int bbrush1x, bbrush1y;
int bbrush2x, bbrush2y;
int bbrush3x, bbrush3y;
int bplayx, bplayy;

boolean bbrush1Playing = false;
boolean bbrush2Playing = false;
boolean bbrush3Playing = false;
boolean bplayPlaying = false;

float rotateBbrush1 = 8;
float rotateBbrush2 = 8;
float rotateBbrush3 = 8;
float rotateBplay = 0;
float currentFrame = 0;

float speedAdjust=1.0;

PImage Board;
PImage [] BBrush;
PImage [] BPlay;
PImage [] images;
PImage WhiteBoard;
PImage WhiteBottom;

Maxim maxim;
AudioPlayer player;

void setup() {
  margin = width/20;
  size(1200, 500);
  noStroke();
  fill(255, 153); 
  background(255); 
  images = loadImages("Animation_data/movie", ".jpg", 157);
  Board = loadImage("frame.png");
  WhiteBoard = loadImage("whiteBoard.png");
  WhiteBottom = loadImage("whiteBottom.png");
  BBrush = loadImages("BBrush/b", ".png", 13);
  BPlay = loadImages("BPlay/b", ".png", 18);
  maxim = new Maxim(this);
  player = maxim.loadFile("ghost.wav");
  player.setLooping(true);
}
int isInsideBoard(int x, int y) {
  if (( x > (width/2 + 5*margin)) && ( x < (width - 10*margin) ))
    if (( y < 29*height/44 ) && (y > height/10))
      return 1;
  return 0;
}
void draw() {
  imageMode(CENTER);

  image(WhiteBottom, width/2, height/2 + height/3 + margin, width, height/6 + 1.5*margin);

  image(images[(int)currentFrame], width/4 + margin, height/3 + 5*margin, width/2 - 6*margin, height/2 + height/4 - 7*margin);

  image(Board, width/4 + margin, height/3 + 5*margin, width/2-3*margin, height/2 + height/4);
  image(Board, 3*width/4 - margin, height/3 + 5*margin, width/2-3*margin, height/2 + height/4);


  bplayx = width/15;
  bplayy = height/2 + height/3;
  image(BPlay[(int) rotateBplay], bplayx, bplayy, BPlay[0].width /1.5, BPlay[0].height /1.5);

  bbrush1x = width/2 + width/9 + width/50;
  bbrush1y = height/2 + height/3;
  image(BBrush[(int) rotateBbrush1], bbrush1x, bbrush1y, BBrush[0].width /1.5, BBrush[0].height /1.5);

  bbrush2x = width/2 + 2*width/9 + width/50;
  bbrush2y = height/2 + height/3;
  image(BBrush[(int) rotateBbrush2], bbrush2x, bbrush2y, BBrush[0].width /1.5, BBrush[0].height /1.5);

  bbrush3x = width/2 + 3*width/9 + width/50;
  bbrush3y = height/2 + height/3;
  image(BBrush[(int) rotateBbrush3], bbrush3x, bbrush3y, BBrush[0].width /1.5, BBrush[0].height /1.5);

  if (bplayPlaying) {

    player.speed(speedAdjust);
    currentFrame = currentFrame+1*speedAdjust;
  }
  if (currentFrame >= images.length)
    currentFrame = 0;

  if (bbrush1Playing) {
    rotateBbrush1 += speedAdjust / 2;
    if (rotateBbrush1 >= BBrush.length) 
      rotateBbrush1 = 0;
  }

  if (bbrush2Playing) {
    rotateBbrush2 += speedAdjust / 2 ;
    if (rotateBbrush2 >= BBrush.length) 
      rotateBbrush2 = 0;
  }

  if (bbrush3Playing) {
    rotateBbrush3 += speedAdjust / 2;
    if (rotateBbrush3 >= BBrush.length) 
      rotateBbrush3 = 0;
  }

  if (bplayPlaying) {
    rotateBplay += speedAdjust / 2;
    if ( rotateBplay >= BPlay.length) 
      rotateBplay = 0;
  }
}  

void mouseDragged() {
  int BoardXLeft = width/2 + 5*margin; 
  int BoardXRight = width - 10*margin;
  int BoardYUp = height/10;
  int BoardYDown = 29*height/44;

  float red = map(mouseX, 0, BoardXRight, BoardXLeft, 255);
  red = (red/1.5) % 255;
  float blue = map(mouseY, 0, BoardYDown, BoardYUp, 255);
  blue = (blue * 2) % 255;
  float green = dist(mouseX, mouseY, 3*width/4 - margin, height/3 + 5*margin);
  green = (green * 2) % 255;
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float lineWidth = map(speed, 10, 0, 10, 1);
  lineWidth = constrain(lineWidth, 0, 4);
  
  float alpha = map(speed, 0, 20, 0, 5);
  fill(255, alpha);
  noStroke();
  rect(width/2 - 1.5*margin, margin, width/2-3*margin, height/2 + height/4);
  
  
  stroke(red, green, blue, random(200) + 55);
  strokeWeight(lineWidth);
  if ( isInsideBoard(mouseX, mouseY) == 1 ) {
    if(bbrush1Playing == true)
      brush1(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
    else if (bbrush2Playing == true)
              brush2(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
         else if (bbrush3Playing == true) 
                 brush3(pmouseX, pmouseY, mouseX, mouseY, lineWidth);
  }

  if ( mouseX > width/10 && mouseX < width/2 && mouseY > 2*height/3 + 5*margin)
    speedAdjust = map(mouseX, width/10, width/2, 0, 2);
}
void mousePressed() {
  if (dist(mouseX, mouseY, bplayx, bplayy) < BPlay[0].width/1.5/2) {
    bplayPlaying = !bplayPlaying;
    rotateBplay = 0;
  }
  if (bplayPlaying) 
    player.play();
  else player.stop();

  //to STOP the video and the music from top left corner
  if ( mouseX < BBrush[0].width/2 - 3*margin && mouseX > margin &&
    mouseY < BBrush[0].height/2 - 5*margin && mouseY > margin ) {
    currentFrame = 0;
    if (bplayPlaying) {
      bplayPlaying = !bplayPlaying;
      player.stop();
      rotateBplay = 0;
    }
  }
  //to ERASE the drawable section of the screen
  if ( mouseX < width/2 + BBrush[0].width/2 - 3*margin && mouseX > width/2 + margin &&
    mouseY < BBrush[0].height/2 - 5*margin && mouseY > margin ) {
    image(WhiteBoard, 3*width/4 - margin, height/3 + 5*margin, width, height);
    image(Board, 3*width/4 - margin, height/3 + 5*margin, width/2-3*margin, height/2 + height/4);
    bbrush1Playing = false;
    rotateBbrush1 = 8;
    bbrush2Playing = false;
    rotateBbrush2 = 8;
    bbrush3Playing = false;
    rotateBbrush3 = 8;

  }

  if (dist(mouseX, mouseY, bbrush1x, bbrush1y) < BBrush[0].width/1.5/2) {
    bbrush1Playing = !bbrush1Playing;
    rotateBbrush1 = 8;
    if(bbrush1Playing == true){
      bbrush2Playing = false;
      rotateBbrush2 = 8;
      bbrush3Playing = false;
      rotateBbrush3 = 8;
    }
  }
  if (dist(mouseX, mouseY, bbrush2x, bbrush2y) < BBrush[0].width/1.5/2) {
    bbrush2Playing = !bbrush2Playing;
    rotateBbrush2 = 8;
    if(bbrush2Playing == true){
      bbrush1Playing = false;
      rotateBbrush1 = 8;
      bbrush3Playing = false;
      rotateBbrush3 = 8;
    }
  }
  if (dist(mouseX, mouseY, bbrush3x, bbrush3y) < BBrush[0].width/1.5/2) {
    bbrush3Playing = !bbrush3Playing;
    rotateBbrush3 = 8;
    if(bbrush3Playing == true){
      bbrush2Playing = false;
      rotateBbrush2 = 8;
      bbrush1Playing = false;
      rotateBbrush1 = 8;
    }
  }
}
void brush1(float x,float y, float px, float py, float lineWidth) {
  //stroke(random(x*random(x*10))%255, random(y*random(y*10))%255, random(x*y)%255, random(x+y)%255);
  line (x,y,width/2 + 7*margin,5*margin);
  line (x,y,width - 7*margin,4*margin);
  line (x,y,width/2 + 5*margin, height/2+height/4-5*margin);
  line (x,y,width - 7*margin, height/2+height/4-5*margin);
  return;
}


void brush2(float x,float y, float px, float py, float lineWidth) {
  
  ellipse(x+random(20),y+random(20),lineWidth,lineWidth);
  ellipse(x-random(20),y-random(20),lineWidth,lineWidth);
 
  return;
}

void brush3(float x,float y, float px, float py, float lineWidth) {
  for(int i=0;i<(x+y)%10;i++){
    strokeWeight((lineWidth*i)%(lineWidth*3));
    line(px-random(30)+random(30),py-random(30)+random(30),x,y);
  }

  return;
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



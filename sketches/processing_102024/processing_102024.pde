
//The MIT License (MIT) - See Licence.txt for details

// This submission for peer review is 1 of 2 for the Creative Programming for Digital Media & Mobile Apps course
// offered by Marco Gillies, Matthew Yee-King, Mick Grierson via Coursera

// Program submitted for peer review by Prabhakar K

int imgRightArrowx, imgRightArrowy;
int imgDownArrowx, imgDownArrowy;
int imgLeftArrowx, imgLeftArrowy;
int imgUpArrowx, imgUpArrowy;
int imgArrowWidth = 50;
int countClicks = 0;

boolean mouseWasClicked = false;
boolean firstTime = true;

// start at this port always
int portx = 800;
int porty = 400;
int treasureX, treasureY; 

PImage imgBostonMap;
PImage imgRightArrow;
PImage imgDownArrow;
PImage imgLeftArrow;
PImage imgUpArrow;
PImage imgTreasureChest;


Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
float speedAdjust=1.0;

void setup()
{
  size(400, 400);
  imageMode(CENTER);
  // setup images
  imgBostonMap = loadImage("BostonMap.jpg");
  imgRightArrow = loadImage("red-right-arrow-th.png");
  imgDownArrow = loadImage("red-down-arrow-th.png");
  imgLeftArrow = loadImage("red-left-arrow-th.png");
  imgUpArrow = loadImage("red-up-arrow-th.png");
  imgTreasureChest = loadImage("treasure-chest-th.png");

  // arrow positions
  imgRightArrowx = width*15/16;
  imgRightArrowy = height/2;
  imgDownArrowx = width/2;
  imgDownArrowy = height*15/16;
  imgLeftArrowx = 25;
  imgLeftArrowy = height/2;
  imgUpArrowx = width/2;
  imgUpArrowy = 25;
  
  // setup audio
  maxim = new Maxim(this);
  player1 = maxim.loadFile("beat1.wav");
  player1.setLooping(true);
  player2 = maxim.loadFile("beat2.wav");
  player2.setLooping(true);
  background(10);

  placeTreasure();
}

void placeTreasure() {
  boolean positionGood = false;
  while(!positionGood) {
    int randomx = (int) random(2400);
    int randomy = (int) random(1200);
    
    // ensure treasure is not right in the first port
    if (!isPointInPort( randomx, randomy)) { 
      positionGood = true;
      treasureX = randomx;
      treasureY = randomy;
      
      // place it away from right and bottom edges so the whole treasure can be drawn
      int margin = 50;
      int distEdgex = treasureX % width;
      if (distEdgex > width - margin) 
        treasureX -= margin - distEdgex;
      int distEdgey = treasureY % height;
      if (distEdgey > height - margin) 
        treasureY -= margin - distEdgey;
     
    }
    
  }
  // println("portx = " + portx + ", porty = " + porty + ",  treasure x = " + treasureX + ", treasureY = " + treasureY); 
 
}

// is this point in the current port
boolean isPointInPort(int x, int y) {
  if (portx <= x && x < portx + width && porty <= y && y < porty + height) {
    return true;
  }
  else
    return false;
}

void draw()
{
  // nothing changed if mouse was not clicked. leave everything as is.
  if (mouseWasClicked || firstTime) {
    background(10); 
    drawPort();
    drawArrows();
    setPlayerSpeed();
    player1.play();
    drawTreasure(portx,porty);
    mouseWasClicked = false;
  }
}

void drawPort() {
  int xshift = 0 - portx;
  int yshift = 0 - porty;
  imageMode(CORNER);
  image(imgBostonMap, xshift, yshift, imgBostonMap.width*2, imgBostonMap.height*2);
  
}

void drawArrows() {
  imageMode(CENTER);
  image(imgRightArrow, imgRightArrowx, imgRightArrowy, imgArrowWidth, imgArrowWidth );
  image(imgDownArrow, imgDownArrowx, imgDownArrowy, imgArrowWidth, imgArrowWidth);
  image(imgLeftArrow, imgLeftArrowx, imgLeftArrowy, imgArrowWidth, imgArrowWidth);
  image(imgUpArrow, imgUpArrowx, imgUpArrowy, imgArrowWidth, imgArrowWidth);
}

void drawTreasure(int x, int y) {
  if (isPointInPort(treasureX, treasureY)) {
   // treasure found is in this square
    speedAdjust = 1; // standardize max speed.
    imageMode(CORNER);
    image(imgTreasureChest, treasureX - portx, treasureY - porty, imgTreasureChest.width/2, imgTreasureChest.height/2);
    player1.stop();
    player2.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
    player2.play();
    
    textSize(40);
    fill(240, 52, 53);
    text("Congratulations!",40,100);
    textSize(20);
    text("You found it in " + countClicks + " mouse clicks",60,150);
  }
  else {
    player2.stop();
  }
  // else nothing to draw 
  // println("x = " + x + ", y = " + y + ", width = " + width + ", treasure x = " + treasureX + ", treasureY = " + treasureY); 
}

void setPlayerSpeed() {
  speedAdjust = (width/2)*1/dist(portx + width/2, porty + width/2, treasureX, treasureY);
  if (speedAdjust > 1)
    speedAdjust = 1;
   // println("speed = " + speed);
  player1.speed(speedAdjust); 
}



void mouseClicked()
{
  mouseWasClicked = true;
  countClicks += 1;

  int increment = 400;
  if(dist(mouseX, mouseY, imgRightArrowx, imgRightArrowy) < imgArrowWidth/2) 
    portx += increment;
  if(dist(mouseX, mouseY, imgDownArrowx, imgDownArrowy) < imgArrowWidth/2) 
    porty += increment;
  if(dist(mouseX, mouseY, imgLeftArrowx, imgLeftArrowy) < imgArrowWidth/2) 
    portx -= increment;
  if(dist(mouseX, mouseY, imgUpArrowx, imgUpArrowy) < imgArrowWidth/2) 
    porty -= increment;

  // prevent from going off the edge - picture is 2400 x 1200
  if (portx > 2000) portx = 2000;
  if (portx < 0) portx = 0;
  if (porty > 800) porty = 800;
  if (porty < 0) porty = 0;
  //println("portx = " + portx + ",porty = " + porty);

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




//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

int tvx, tvy;
int animx, animy;
//int deck1x, deck1y;
//int deck2x, deck2y;

int lefthandX, lefthandY;
int righthandX, righthandY;


boolean deck1Playing = false;
boolean deck2Playing = false;

boolean lefthandPlaying = false;
boolean righthandPlaying = false;

float rotateDeck1 = 0;
float rotateDeck2 = 0;
float currentFrame = 0;

int margin = width/40;
PImage [] images;
//PImage [] recordPlayer;

PImage[ ]leftHand;
PImage[ ]rightHand;

PImage TV;
Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
float speedAdjust=1.0;


void setup()
{
  size(768,1024);
  imageMode(CENTER);
   // on Android, the manufacturer of the device dictates a RAM limit 
  // for your app. If you get out of memory errors, check what this
  // line it outputting... note that jpg images will be uncompressed
  // for display so they take up more RAM than the file sizes
  //println("Ram available for this app: "+(Runtime.getRuntime().maxMemory()/1024)+"k");
  images = loadImages("Animation_data/movie", ".jpg", 30); // reduce that number to use less RAM
  //recordPlayer = loadImages("black-record_", ".png", 36);
    
  leftHand = loadImages("Piano_data/left/left", ".jpg", 80);
  rightHand= loadImages("Piano_data/right/risz/right", ".jpg", 73);
  
  TV = loadImage("TV.png");
  maxim = new Maxim(this);
  player1 = maxim.loadFile("beat1.wav");
  player1.setLooping(true);
  player2 = maxim.loadFile("beat2.wav");
  player2.setLooping(true);
  background(0);
  
}

void draw()
{
  background(0); 
  imageMode(CENTER);
  image(images[(int)currentFrame], width/2, images[0].height/2+30, images[0].width*1.8, images[0].height*1.5);
  image(TV, width/2, TV.height/2+margin, TV.width*2, TV.height*2);
  
  //deck1x = (width/2)-recordPlayer[0].width/2-(margin*10);
  //deck1y = TV.height+recordPlayer[0].height/2+margin;
  //image(recordPlayer[(int) rotateDeck1], deck1x, deck1y, recordPlayer[0].width, recordPlayer[0].height);
  
  lefthandX=  (width/2)-leftHand[0].width/2-(margin*10);
  lefthandY = TV.height+leftHand[0].height/2+margin;
  image(leftHand[(int) rotateDeck1], lefthandX, lefthandY, leftHand[0].width, leftHand[0].height);

  righthandX = (width/2)+rightHand[0].width/2+(margin*10);
  righthandY = TV.height+rightHand[0].height/2+margin;
  image(rightHand[(int) rotateDeck2], righthandX+30, righthandY-10, rightHand[0].width, rightHand[0].height);
  
  
  
  //deck2x = (width/2)+recordPlayer[0].width/2+(margin*10);
  //deck2y = TV.height+recordPlayer[0].height/2+margin;
  //image(recordPlayer[(int) rotateDeck2], deck2x, deck2y, recordPlayer[0].width, recordPlayer[0].height);

  if (deck1Playing || deck2Playing) {
    
    player1.speed(speedAdjust);
    player2.speed((player2.getLengthMs()/player1.getLengthMs())*speedAdjust);
    currentFrame= currentFrame+1*speedAdjust;
  }

  if (currentFrame >= images.length) {

    currentFrame = 0;
  }

  if (deck1Playing) {

    rotateDeck1 += 1*speedAdjust;

    if (rotateDeck1 >= leftHand.length) {

      rotateDeck1 = 0;
    }
  }

  if (deck2Playing) {

    rotateDeck2 += 1*speedAdjust;

    if (rotateDeck2 >= rightHand.length) {

      rotateDeck2 = 0;
    }
  }
}

// mouseClicked does not work on Android
//void mouseClicked(){
void mousePressed()
{
  //if (mouseX > (width/2)-recordPlayer[0].width-(margin*10) && mouseX < recordPlayer[0].width+((width/2)-recordPlayer[0].width-(margin*10)) && mouseY>TV.height+margin && mouseY <TV.height+margin + recordPlayer[0].height) {
  if(dist(mouseX, mouseY, lefthandX, lefthandY) < leftHand[0].width/2){
    
    deck1Playing = !deck1Playing;
  }

  if (deck1Playing) {
    player1.play();
  } 
  else {

    player1.stop();
  }

  if(dist(mouseX, mouseY, righthandX, righthandY) < rightHand[0].width/2){
  
    deck2Playing = !deck2Playing;
  }

  if (deck2Playing) {
    player2.play();
  } 
  else {

    player2.stop();
  }
}

void mouseDragged() {
   
 if (mouseY>height/2) {
     speedAdjust=map(mouseX,0,width,0,2);
     
 
   
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



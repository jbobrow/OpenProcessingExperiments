


// coordonates of images
int headerX, headerY;
int hbX, hbY;
int piafX, piafY;
int parsleyX, parsleyY;
int alexX, alexY;
int janaX, janaY;
int davidX, davidY;

//on and off players
boolean PiafPlaying = false;
boolean ParsleyPlaying = false;
boolean JanaPlaying = false;
boolean AlexPlaying = false;
boolean DavidPlaying = false;

float currentFrameHeader = 0;
float currentFrameParsley = 0;
float currentFrameAlex = 0;
float currentFrameJana = 0;
float currentFramePiaf = 0;
float currentFrameDavid = 0;
int margin = width/40;

//images and animation arrays

PImage [] images;
PImage [] piaf;
PImage [] parsley;
PImage [] alex;
PImage [] jana;
PImage [] david;
PImage [] header;
PImage happyB;

//players
Maxim maxim;
AudioPlayer playerPiaf;
AudioPlayer playerParsley;
AudioPlayer playerAlex;
AudioPlayer playerJana;
AudioPlayer playerDavid;

float delay=0.05;

float delayH=0.09;

void setup()
{
  size(1080, 720);
  background(255);
  imageMode(CENTER);
  header = loadImages("header_anim/header", ".jpg", 7);
  piaf=loadImages("piaf_anim/piaf", ".jpg", 5);
  parsley=loadImages("parsley_anim/parsley", ".jpg", 5);
  alex=loadImages("alex_anim/alex", ".jpg", 5);
  david=loadImages("david_anim/david", ".jpg", 5);
  jana=loadImages("jana_anim/jana", ".jpg", 5);

  happyB=loadImage("hb.jpg");
  maxim = new Maxim(this);

  playerPiaf = maxim.loadFile("beat1.wav");
  playerPiaf.setLooping(true);

  playerParsley = maxim.loadFile("beat2.wav");
  playerParsley.setLooping(true);

  playerAlex = maxim.loadFile("beat1.wav");
  playerAlex.setLooping(true);

  playerJana = maxim.loadFile("jana01.wav");
  playerJana.setLooping(true);

  playerDavid = maxim.loadFile("david.wav");
  playerDavid.setLooping(true);
}

void draw()
{

  imageMode(CENTER);


  //HEADER
  image(header[(int)currentFrameHeader], width/2, header[0].height/2+margin, header[0].width, header[0].height);
  currentFrameHeader= currentFrameHeader+1*delayH;
  if (currentFrameHeader >= header.length) {
    currentFrameHeader = 0;
  }

  //happy birthday
  image(happyB, width-happyB.width/2, height-happyB.height/3.5);

  //****CATS****


  //PIAF

  image(piaf[(int)currentFramePiaf], width/2-piaf[0].width/1.3, height/2-piaf[0].height/2 );

  piafX=(int)(width/2-piaf[0].width/1.3);
  piafY=(int)(height/2-piaf[0].height/2);

  //PARSLEY
  image(parsley[(int)currentFrameParsley], width/2+parsley[0].width/1.3, height/2-parsley[0].height/2 );

  parsleyX=(int)(width/2+parsley[0].width/1.3);
  parsleyY=(int)(height/2-parsley[0].height/2);

  //****HUMANS****

  //ALEX
  image(alex[(int)currentFrameAlex], width/2-1.5*alex[0].width, height/2+alex[0].height/2);

  alexX=(int)(width/2-1.5*alex[0].width);
  alexY=(int)(height/2+alex[0].height/2);

  //DAVID
  image(david[(int)currentFrameDavid], width/2, height/2+david[0].height/2 );

  davidX=(int)(width/2);
  davidY=(int)(height/2+david[0].height/2);

  //JANA  
  image(jana[(int)currentFrameJana], width/2+1.5*jana[0].width, height/2+jana[0].height/2 );

  janaX=(int)(width/2+1.5*jana[0].width);
  janaY=(int)(height/2+jana[0].height/2);

if (PiafPlaying){
 
  currentFramePiaf= currentFramePiaf+1*delay;}
  else {currentFramePiaf=0;}

  if (currentFramePiaf >= piaf.length) {

    currentFramePiaf = 0;
  }


if (ParsleyPlaying){
 
  currentFrameParsley= currentFrameParsley+1*delay;}
  else {currentFrameParsley=0;}

  if (currentFrameParsley >= piaf.length) {

    currentFrameParsley = 0;
  }


if (AlexPlaying){
 
  currentFrameAlex= currentFrameAlex+1*delay;}
  else {currentFrameAlex=0;}

  if (currentFrameAlex >= piaf.length) {

    currentFrameAlex = 0;
  }

 
  
if (DavidPlaying){
 
  currentFrameDavid= currentFrameDavid+1*delay;}
  else {currentFrameDavid=0;}

  if (currentFrameDavid >= piaf.length) {

    currentFrameDavid = 0;
  } 


if (JanaPlaying){
 
  currentFrameJana= currentFrameJana+1*delay;}
  else {currentFrameJana=0;}

  if (currentFrameJana >= piaf.length) {

    currentFrameJana = 0;
  } 

}







void mouseClicked()
{

  //PLAY PIAF

  if (dist(mouseX, mouseY, piafX, piafY) < piaf[0].width/2) {

    PiafPlaying=!PiafPlaying;
  }
  if (PiafPlaying) {
    playerPiaf.play();
  }
  else {
    playerPiaf.stop();
  }
  
   //PLAY PARSLEY

  if (dist(mouseX, mouseY, parsleyX, parsleyY) < parsley[0].width/2) {

    ParsleyPlaying=!ParsleyPlaying;
  }
  if (ParsleyPlaying) {
    playerParsley.play();
  }
  else {
    playerParsley.stop();
  }
  
     //PLAY ALEX

  if (dist(mouseX, mouseY, alexX, alexY) < alex[0].width/2) {

    AlexPlaying=!AlexPlaying;
  }
  if (AlexPlaying) {
    playerAlex.play();
  }
  else {
    playerAlex.stop();
  }
  
      //PLAY DAVID

  if (dist(mouseX, mouseY, davidX, davidY) < david[0].width/2) {

    DavidPlaying=!DavidPlaying;
  }
  if (DavidPlaying) {
    playerDavid.play();
  }
  else {
    playerDavid.stop();
  }
  
     //PLAY JANA

  if (dist(mouseX, mouseY, janaX, janaY) < jana[0].width/2) {

    JanaPlaying=!JanaPlaying;
  }
  if (JanaPlaying) {
    playerJana.play();
  }
  else {
    playerJana.stop();
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



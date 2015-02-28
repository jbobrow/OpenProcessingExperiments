
int tvx, tvy;
int animx, animy;
int deck1x, deck1y;
int deck2x, deck2y;

boolean deck1Playing = false;
boolean deck2Playing = false;
float rotateDeck1 = 0;
float rotateDeck2 = 0;
float currentFrame1 = 0;
float currentFrame2 = 0;
int margin = width/40;
PImage [] images;
PImage [] recordPlayer;
PImage TV;
Maxim maxim;
AudioPlayer player1;
AudioPlayer player2;
float speedAdjust1=1.0;
float speedAdjust2=1.0;

int sliderColour1 = 256/2;
int sliderColour2 = 256/2;

float  AudioPower1 = 1.0;
float  AudioPower2 = 1.0;

float[] spectro1;
float[] spectro2;


void setup()
{
  size(768,1024);
  imageMode(CENTER);
  
  images = loadImages("Gamal-Animation/movie", ".jpg", 500);
  
  recordPlayer = loadImages("black-record/black-record_", ".png", 36);
  TV = loadImage("TV.png");
  maxim = new Maxim(this);
  player1 = maxim.loadFile("Gamal-Sound.wav");
  player1.setLooping(true);
  player1.setAnalysing(true);
  player2 = maxim.loadFile("Gamal-Sound.wav");
  player2.setLooping(true);
  player2.setAnalysing(true);
  background(10);
}

void draw()
{
  background(10); 
  imageMode(CENTER);
  image(images[(int)currentFrame1], width/4, images[0].height/2+margin, images[0].width/1.5, images[0].height/1.5);
  image(images[(int)currentFrame2], width/1.33, images[0].height/2+margin, images[0].width/1.5, images[0].height/1.5);
  
  colorMode(HSB);
  fill(sliderColour1,sliderColour1,sliderColour1*AudioPower1+150);
  rect(width/4,images[0].height/2+margin+115,images[0].width/1.5*AudioPower1,20);
  fill(sliderColour2,sliderColour2,sliderColour2*AudioPower2+150);
  rect(width/1.33,images[0].height/2+margin+115,images[0].width/1.5*AudioPower2,20);
  
  
  //image(TV, width/2, TV.height/2+margin, TV.width, TV.height);
  deck1x = (width/2)-recordPlayer[0].width/2-(margin*10);
  deck1y = TV.height+recordPlayer[0].height/2+margin;
  image(recordPlayer[(int) rotateDeck1], deck1x, deck1y, recordPlayer[0].width, recordPlayer[0].height);
  deck2x = (width/2)+recordPlayer[0].width/2+(margin*10);
  deck2y = TV.height+recordPlayer[0].height/2+margin;
  image(recordPlayer[(int) rotateDeck2], deck2x, deck2y, recordPlayer[0].width, recordPlayer[0].height);
  
  stroke(255);
  line (0,height/2,width,height/2);
  line (0,(height/2)+50,width,(height/2)+50);
  line (0,(height/2)+100,width,(height/2)+100);
  
  rectMode(CENTER);
  stroke(0);
  fill(sliderColour1);
  rect (width/2,(height/2)+25,width,50);
  fill(sliderColour2);
  rect (width/2,(height/2)+75,width,50);


  if (deck1Playing) {
    player1.play();
    player1.speed(speedAdjust1);
    spectro1 = player1.getPowerSpectrum();
    currentFrame1= currentFrame1+1*speedAdjust1;
    AudioPower1 = player1.getAveragePower();
    
 
    strokeWeight(1);
    if (spectro1!=null) {// got something to plot!
      // iterate over the values in the spectrum, plotting them down the screen
      for (int i=0; i< spectro1.length; i++) {
        // set the colour based on the power in this band
           stroke(255*spectro1[i]);
           line(i,(height/2)+300,i,(height/2)+250+spectro1[i]);
      }
    }
  
 
    
  }
  
    if (deck2Playing) {
    player2.play();
    player2.speed(speedAdjust2);
    spectro2 = player2.getPowerSpectrum();
    currentFrame2= currentFrame2+1*speedAdjust2;
    AudioPower2 = player2.getAveragePower();
    
    
    strokeWeight(1);
    if (spectro2!=null) {// got something to plot!
      // iterate over the values in the spectrum, plotting them down the screen
      for (int i=0; i< spectro2.length; i++) {
        // set the colour based on the power in this band
           stroke(255 * spectro2[i]);
           line(i,height,i,(height/2)+475+spectro2[i]);
      }
    }
  }

  if (currentFrame1 >= images.length) {

    currentFrame1 = 0;
  }

  if (currentFrame2 >= images.length) {

    currentFrame2 = 0;
  }


  if (deck1Playing) {

    rotateDeck1 += 1*speedAdjust1;

    if (rotateDeck1 >= recordPlayer.length) {

      rotateDeck1 = 0;
    }
  }

  if (deck2Playing) {

    rotateDeck2 += 1*speedAdjust2;

    if (rotateDeck2 >= recordPlayer.length) {

      rotateDeck2 = 0;
    }
  }
}


void mouseClicked()
{

  //if (mouseX > (width/2)-recordPlayer[0].width-(margin*10) && mouseX < recordPlayer[0].width+((width/2)-recordPlayer[0].width-(margin*10)) && mouseY>TV.height+margin && mouseY <TV.height+margin + recordPlayer[0].height) {
  if(dist(mouseX, mouseY, deck1x, deck1y) < recordPlayer[0].width/2){
    
    deck1Playing = !deck1Playing;
   
  }

  if (deck1Playing) {
    player1.play();
  } 
  else {

    player1.stop();
  }

  if(dist(mouseX, mouseY, deck2x, deck2y) < recordPlayer[0].width/2){
  
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
   
 if ((mouseY>height/2) && (mouseY<(height/2)+50)) { 
   speedAdjust1=map(mouseX,0,width,0,2);  
   sliderColour1= (int) map(mouseX,0,width,0,255); 
 } 
 
 if ((mouseY>(height/2)+50) && (mouseY<(height/2)+100)) {
    speedAdjust2=map(mouseX,0,width,0,2);
    sliderColour2= (int) map(mouseX,0,width,0,255);
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



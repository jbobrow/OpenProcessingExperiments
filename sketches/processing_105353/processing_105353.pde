
float current_frame = 0;
int periscope_margin = 0;
PImage torpedo;
PImage emptyContainer;
PImage [] torpedos;
PImage periscope;
PImage fire;
PImage [] ships;
PImage fire_button;
PImage reset_button;
float koefX = 1;
float koefY = 1;
int frame = 10;
boolean doFire = false;

int shipPosY=0;

int currShip=0;
boolean doTorpedo=false;
int torpedoNum = 0;

int position = 10;
int timer = 0;
int targetStartX=0;
int targetStartY=0;
int targetEndX=0;
int targetEndY=0;
int score = 0;

PFont f;

boolean doAudio = false;

//if (doAudio){
//  Maxim maxim;
//  AudioPlayer wavePlayer;
//  AudioPlayer launchPlayer;
//  AudioPlayer boomPlayer;
  
//}


void setup()
{
/*  if(doAudio){
    maxim = new Maxim(this);
   
    
    wavePlayer = maxim.loadFile("waves.wav"); 
    wavePlayer.speed(1);
    wavePlayer.setLooping(true);
    wavePlayer.volume(0.25);
    wavePlayer.cue(0);
    
    
    boomPlayer = maxim.loadFile("boom.wav"); 
    boomPlayer.speed(1);
    boomPlayer.setLooping(false);
    boomPlayer.cue(0);

    
    launchPlayer = maxim.loadFile("launch.wav"); 
    launchPlayer.speed(1);
    launchPlayer.setLooping(false);
    launchPlayer.cue(0);
  } */
  
  background(10);  
  imageMode(CENTER);
  periscope = loadImage("periscope_frame.png");
  fire = loadImage("fire.png");
  ships = loadImages("ship", ".png", 1, 4);
  size(600,800);
  
  torpedo = loadImage("flash.png");
  emptyContainer = loadImage("torpedo_empty.png");
  
  loadTorpedos();
  f = createFont("Arial",16,true); 
  fire_button =  loadImage("fire_button.png");
  reset_button =  loadImage("reset_button.png");
  }
  
  void loadTorpedos()
  {
    torpedos = new PImage[0];
    for(int i = 0; i <= 9; i++)
    {
      PImage img = loadImage("torpedo.png");
      
      if(img != null)
      {
        torpedos = (PImage [])append(torpedos,img);
      }
      else
      {
        break;
      }
    }
  }
  

void draw()
{
  background(10); 
  imageMode(CENTER);
  koefX = width/periscope.width;
  koefY = height/periscope.height;
  image(periscope, width/2, periscope.height/2*koefX, periscope.width*koefX, periscope.height*koefX);

  int shift=0; 
  for (i=0;i<10;i++){
    image(torpedos[i], width/10 + shift, periscope.height*koefX + 20, torpedos[i].width, torpedos[i].height);
    shift = shift + 50;
  }
  //switchPlayer(wavePlayer, true);
  if (doFire){
      timer = timer + 1;
      image(fire, width/2, periscope.height*koefX - position - fire.height/2, fire.width, fire.height);
      if (timer > 250){
        doFire = false;
        //switchPlayer(boomPlayer, false);
        frame = 10;
        timer = 0;
    }
  } else {
    if (frame < 850)
    {
      ship(-frame, shipPosY);
      frame = frame + 5;
    } else {
      newShip();
    }
  
  if (doTorpedo && position < 200){
    println("Torpedo launched!");
    torpedo1(0, -position);
    position = position + 5;
  } else {
    //switchPlayer(launchPlayer, false);
    doTorpedo = false;
    position = 10;
  }

   int posShipLeftX = (int)(width/2 - ships[currShip].width/2);
   int posShipRight = (int)(width/2 + ships[currShip].width/2);
   int posTorpedoY = (int)(periscope.height*koefX - position);
   
   if (position > 10 && posShipLeftX < targetStartX && targetStartX < posShipRight && targetStartY == posTorpedoY){
     //switchPlayer(boomPlayer, true);
     //switchPlayer(launchPlayer, false);
     doFire = true;
     score++;
   }
  }  
  
  stroke(0);
  textFont(f,16);                 
  textAlign(CENTER);  
  text("score:", 30, 20);
  textFont(f,24);   
  text(score, 30, 50);
  

  image(fire_button, width/2-fire_button.width/2, height*0.75, fire_button.width/2, fire_button.height/2);
  image(reset_button, width/2+reset_button.width/2, height*0.75, reset_button.width/2, reset_button.height/2);
}

/*
void switchPlayer (AudioPlayer player, boolean doPlay){
    if (doAudio){
      if (doPlay){
        player.play();
      } else {
        player.stop();
      }
    }
}
*/
void newShip(){
    frame=10;
    shipPosY=(int)random(0, 8)*5;
    currShip=(int)random(0, 3);
}

void torpedo1(int x, int y){
  image(torpedo, width/2 + x, periscope.height*koefX + y, torpedo.width, torpedo.height);
}

void ship(int x, int y){
  targetStartX = (int)(width + ships[currShip].width/2 + x);
  targetStartY = (int)(periscope.height/2*koefX + y);
  image(ships[currShip], targetStartX, targetStartY, ships[currShip].width, ships[currShip].height);
}

 
boolean overAnyCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}  



void mouseClicked()
{
  var fire_buttonOver = overAnyCircle(width/2-fire_button.width/2, height*0.75, fire_button.width);
  if (fire_buttonOver && torpedoNum < 11){
      //switchPlayer(launchPlayer, true);
      doTorpedo = true;
      torpedos[torpedoNum] = emptyContainer;
      torpedoNum = torpedoNum + 1;
  }
  
  var reset_buttonOver = overAnyCircle(width/2+reset_button.width/2, height*0.75, reset_button.width);
    if (reset_buttonOver){
      doTorpedo = false;
      score = 0;
      loadTorpedos();
      torpedoNum = 0;
     // switchPlayer(boomPlayer, false);
     // switchPlayer(launchPlayer, false);
  }
}
 
//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PImage [] loadImages(String stub, String extension, int startIndex, int endIndex)
{
  PImage [] images = new PImage[0];
  for(int i = startIndex; i <= endIndex; i++)
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



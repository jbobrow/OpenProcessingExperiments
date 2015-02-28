

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer rawrNoise;

List<ball> balls = new ArrayList<ball>();
int numballs = 200;

int x = 20;
int y = 170;
int eyeCenterX = 648 + x;
int eyeCenterY = 17 + y;
int mouthCenterX = 645 + x;
int mouthCenterY = 75 + y;
int bowCenterX = 632 + x;
int bowCenterY = 183 + y;
float eyeMouseDistance = 0;
float bowMouseDistance = 0;

int standCounter = 0;
int standWait = 5;
PImage rex;

int startTime = 0;
float time = 0;
float songTime = 0;
boolean songOn = false;

int startTimeFire = 0;
float timeFire = 0;
float fireTime = 0;
boolean fireOn = false;

float mouthTop = 1;
float mouthBottom = 1;
float mouthHeight = 50;
float mouthWidth = 100;
int eyeValue = 11;
String eyeValueChar = "#D12C2C";

void setup()
{

  smooth();
  size(1500,800);
  //size(2500,1300);
  background(60, 209, 237);

}

//------------Input Code--------------
  void keyPressed()
  {
    if(key == CODED)
    { 
      if (keyCode == UP)
      { 

      }
      else if (keyCode == DOWN)
      { 

      } 
      if (keyCode == LEFT)
      { 
        x =  x - 15;
        y = y - 20;
      }
      else if (keyCode == RIGHT)
      { 
        x =  x + 15;
        y = y - 20;
      }
    } 
  }
void mouseClicked()
{
  eyeMouseDistance = sqrt((pow(abs(mouseX - eyeCenterX),2)+pow(abs(mouseY - eyeCenterY),2)));
  bowMouseDistance = sqrt((pow(abs(mouseX - bowCenterX),2)+pow(abs(mouseY - bowCenterY),2)));
  if (eyeMouseDistance <= 19 && (mouseY < (y + 20)))
  {
    if(eyeValueChar == "#D12C2C")//(eyeValue == 11)
    {
        minim = new Minim(this);
        rawrNoise = minim.loadFile("Rawr.wav");
        rawrNoise.play();
        songOn = true;
        eyeValueChar = "#C12525";//eyeValue = 255;
    }
  } 
  else if (bowMouseDistance <= 40 && (mouseY >= (y + 70)))
  {
    fireOn = true;
    for (int i = 0; i < numballs; i++)
    {
          balls.add(new ball(mouthCenterX, mouthCenterY,abs(random(200)+50),random(7)-1, color((random(150) + 100), 0, 0)));
    }
    
    if(eyeValueChar == "#D12C2C")//(eyeValue == 11)
    {
        minim = new Minim(this);
        rawrNoise = minim.loadFile("Rawr.wav");
        rawrNoise.play();
        songOn = true;
        eyeValueChar = "#C12525";//eyeValue = 255;
    }
  }
}
//------------------------------------

void draw()
{
  PImage backdrop;
  backdrop = loadImage("backOLD.png");
  image(backdrop, 0, 0);
  //background(60, 209, 237);
  //------------------------------------
  //-------------Font Code--------------
  PFont font, font2;
  font = loadFont("MediaBlackoutDemo-48.vlw");
  font2 = loadFont("AlienEncounters-48.vlw"); 
  //textFont(font, 60); 
  //text("mbates", 150, 500);
  textFont(font2, 48); 
  fill(0,15,0);
  text("mbates", 10, 790);
  //text(time, 1400, 790);
  //text(songTime, 1000, 790);
  //------------------------------------
  //----------Dinosaur Code-------------
  fill(eyeValue, 0, 0);
  noStroke();
  eyeCenterX = 648 + x;
  eyeCenterY = 17 + y;
  mouthCenterX = 645 + x;
  mouthCenterY = 75 + y;
  bowCenterX = 632 + x;
  bowCenterY = 183 + y;
  ellipse(eyeCenterX, eyeCenterY, 18, 14);
  fill(7, 0, 0);
  if(!songOn && !fireOn)
  {
    if (standCounter >= 0 && standCounter < standWait)
    {
      rex = loadImage("RexStand1.png");
    }
    
    else if (standCounter >= standWait && standCounter < (standWait * 2))
    {
      rex = loadImage("RexStand2.png");
    }
    
    else if (standCounter >= (standWait * 2) && standCounter < (standWait * 3))
    {
      rex = loadImage("RexStand3.png");
    }
    
    else if (standCounter >= (standWait * 3) && standCounter < (standWait * 4))
    {
      rex = loadImage("RexStand2.png");
    }
    
    else if (standCounter >= (standWait * 4))
    {
      standCounter = 0;
    }
    
    standCounter += 1;
    
    /*
    print(standCounter);
    println();
    */
  }
  else
  {
    rex = loadImage("Rex2.png");
  }
  image(rex, x, y);
  //ellipse(bowCenterX, bowCenterY, 40, 40);
  //------------------------------------
  //------------Belly Code--------------
  
  //------------------------------------
  //-----------Gravity Code-------------
  if (y < 170)
  {
    y = y + 10;
  }
  //------------------------------------
  //-------------Song Code--------------
  if (songOn)
  {
    songTime = songTime + ((millis() - startTime)/1000);
    for (ball b: balls)
    {
      b.render();
    }
    if(songTime >= 1.1)
    {
       songOn = false;
       eyeValueChar = "#D12C2C";
       //eyeValue = 11;
       songTime = 0;
       rawrNoise.close();
    }
  }
  if(millis() >= startTime + 1000)
    {
      startTime = millis();
      time = startTime / 1000;
   }
  //------------------------------------
  //-------------Fire Code--------------
  if (fireOn)
  {
    fireTime = fireTime + ((millis() - startTimeFire)/1000);
    for (ball b: balls)
    {
      b.render();
    }
    if(fireTime >= 1.1)
    {
       fireOn = false;
       fireTime = 0;
       for (int i = (numballs - 1); i > 0; i--)
       {
         balls.remove(i);
       }
    }
  }
  if(millis() >= startTimeFire + 1000)
    {
      startTimeFire = millis();
      timeFire = startTimeFire / 1000;
   }
}
  //------------------------------------


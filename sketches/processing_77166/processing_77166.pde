
/*
Some code first implemented from
 - Prey and Predator Example, by Brian Schrank, PhD
 */
//First things first create 3 types
//PREDATOR
//ATTRACTION
//NORMAL PLAYER

//Audio track
import ddf.minim.*;
AudioPlayer MansionMusic; 
Minim minim;

PImage mansion;


float a = 30;
float q= 0; //Time Attraction stays with ghost
float neutralX = 0;
float neutralY = 0;
float AttractionX = 0;
float AttractionY = 0;
float PredatorX = 0;
float PredatorY = 0; //These are variables that control x and y coordiantes

float neutralMoveX;
float neutralMoveY;
float PredatorMoveX;
float PredatorMoveY;
float AttractionMoveX;
float AttractionMoveY; // X and Y Coordinates to move objects

float maxSpeed = 3; //highest speed objects move
float radius1 = 25;
float Pradius1 = 25; //player Radius

boolean GrossedOut = false; // If this is false, makes player grossed out

void setup()
{
  mansion = loadImage("mansion.png");
  size(400, 400);

  neutralMoveX = random(-maxSpeed, maxSpeed);
  neutralMoveY = random(-maxSpeed, maxSpeed);
  PredatorMoveX = random(-maxSpeed, maxSpeed);
  PredatorMoveY = random(-maxSpeed, maxSpeed);
  AttractionMoveX = random(-maxSpeed, maxSpeed);
  AttractionMoveY = random(-maxSpeed, maxSpeed); //These set speed for objects

  neutralX = random(Pradius1*3, width-Pradius1*3); //width = x position of entire program screen
  neutralY = random(Pradius1*3, height-Pradius1*3); //height = y position of entire program screen
  AttractionX = random(width-radius1);
  AttractionY = random(width-radius1);
  PredatorX = random(width-radius1);
  PredatorY = random(width-radius1);

  smooth();
  noStroke();
  minim = new Minim(this);
  MansionMusic = minim.loadFile("Mansionmu.mp3", 1024); 
  MansionMusic.loop();
}

void draw()
{     
  background(mansion);
  //PREDATOR ELLIPSE
  PredatorX += PredatorMoveX;
  PredatorY += PredatorMoveY;
  if (PredatorX >width-radius1 || PredatorX< 10) //These 2 "if" statements make syure they stay on screen
  {
    PredatorMoveX = -PredatorMoveX;
  }

  if (PredatorY >width-radius1 || PredatorY< radius1)
  {
    PredatorMoveY = -PredatorMoveY;
  }
  fill(0, 255, 100);
  ellipse(PredatorX, PredatorY, radius1, radius1);
  fill(100, 0, 0);
  ellipse(PredatorX+4, PredatorY-4, 5, 5);
  ellipse(PredatorX-4, PredatorY-4, 5, 5);
  ellipse(PredatorX, PredatorY+5, 10, 5);

  //Attraction ELLIPSE

  AttractionX += AttractionMoveX;
  AttractionY += AttractionMoveY;

  if (AttractionX >width-radius1 || AttractionX< radius1) //These 2 "if" statements make syure they stay on screen
  {
    AttractionMoveX = -AttractionMoveX;
  }

  if (AttractionY >width-radius1 || AttractionY< radius1)
  {
    AttractionMoveY = -AttractionMoveY;
  }
  a= dist(AttractionX, AttractionY, neutralX, neutralY);
  if (a< 50)
  {
    AttractionX = neutralX;
    AttractionY = neutralY;
    if (dist(PredatorX, PredatorY, neutralX, neutralY)< Pradius1*5)
    {
      AttractionX = random(width-radius1);
      AttractionY = random(width-radius1);
      AttractionMoveX = random(-maxSpeed, maxSpeed);
      AttractionMoveY = random(-maxSpeed, maxSpeed);
      PredatorMoveX = random(-maxSpeed, maxSpeed);
      PredatorMoveY = random(-maxSpeed, maxSpeed);
    }
  }
  fill(250, 180, 0);
  ellipse(AttractionX, AttractionY, radius1*2, radius1*2);
  fill(50, 255, 20);
  ellipse(AttractionX+25, AttractionY, 10, 10);
  ellipse(AttractionX-25, AttractionY, 10, 10);

  fill(0);
  rect(AttractionX+5, AttractionY-10, 5, 20);
  rect(AttractionX-5, AttractionY-10, 5, 20);

  //NEUTRAL ELLIPSE PLAYER ACTIONS

  neutralX += neutralMoveX;
  neutralY += neutralMoveY;

  if (neutralX >width-radius1 || neutralX< radius1) //These 2 "if" statements make syure they stay on screen
  {
    neutralMoveX = -neutralMoveX;
  }

  if (neutralY >width-radius1 || neutralY< radius1)
  {
    neutralMoveY = -neutralMoveY;
  }

  if (dist(PredatorX, PredatorY, neutralX, neutralY)< Pradius1*3)
  {
    if (GrossedOut == false)
    {
      neutralMoveX =-neutralMoveX;
      neutralMoveY = -neutralMoveY;
      neutralMoveX = maxSpeed;
      neutralMoveY =  maxSpeed;
      GrossedOut= true;
    }
  }
  else 
  {
    GrossedOut=false;
  }
  if (GrossedOut==true)
  {
    fill(255, 100, 0);
    neutralMoveX = random(-maxSpeed, maxSpeed);
    neutralMoveY = random(-maxSpeed, maxSpeed);
  }
  else
  {
    fill(255);
  }
  if (dist(AttractionX, AttractionY, neutralX, neutralY)< radius1*2)
  {
    fill(220, 80, 210);
  }
  ellipse(neutralX, neutralY, Pradius1*3, Pradius1*3);
  fill(125);
  ellipse(neutralX+40, neutralY-5, 20, 20);//arms
  ellipse(neutralX-40, neutralY-5, 20, 20);
  fill(0);
  ellipse(neutralX-10, neutralY, 10, 30); //eyes
  ellipse(neutralX+10, neutralY, 10, 30);
  fill(255);
  ellipse(neutralX-12, neutralY-10, 10, 10); //eyes glares
  ellipse(neutralX+9, neutralY-10, 10, 10);
}



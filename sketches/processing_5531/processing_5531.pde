
//Chris Hill
//Abstract Clock

import ddf.minim.*;
Minim minim;
AudioSnippet alarmSound;

//600x340
PImage sunrise;
PImage sunset;
PImage noon; 
PImage night;

void setup()
{
  size(600,400);
  background(255);
  smooth();
  //load music
  minim = new Minim(this);
  alarmSound = minim.loadSnippet("alarm.wav");
  //load sounds
  sunrise = loadImage("sunrise.jpg");
  sunset = loadImage("sunset.jpg");
  noon = loadImage("noon.jpg");
  night = loadImage("night.jpg");
}

int alarmHour = 14;
int alarmMin = 44;

void draw()
{  
  //box clock
  drawHours();
  drawMinutes();
  drawSeconds();
  
  //alarm
  alarm();
}

void minsecBoxes(int x, int y)
{
  rect(x,y, 10, 20);
  x += 10;
}

void hourBoxes(int x)
{
  rect(x,0, 25,20);
}

void drawHours()
{
  //hours
  int hours = hour();    // Values from 0 - 23
  int c = 0;
  float clr = 235;
  int cntr = 0;
  
  for(int i = 0; i < 24; i++)//draw 24 hour boxes
  {
    fill(clr);
    hourBoxes(c);
    c += 25;
    cntr++;
    if(cntr == 6)//every 6 boxes change fill shade for better viewing
    {
      clr = clr/1.2;
      cntr = 0;
    }
  }
  //change fill color based on time of day for hours
  if(hours >=21 || hours < 6)//night
  {
    fill(25, 25, 112);
    image(night, 0, 60);
  }
  else if(hours >=6 && hours < 9)//sunrise
  {
    fill(255, 165, 0);
    image(sunrise, 0, 60);
  }
  else if(hours >= 9 && hours < 18)//day
  {
    fill(255, 255, 0);
    image(noon, 0, 60);
  }
  else if(hours >= 18 && hours < 21)//sunset
  {
    fill(255, 69, 0);
    image(sunset, 0, 60);
  }
  hourBoxes(hours*25);  //move hour bar 25 pixels every hour 
}

void drawMinutes()
{  
  //minutes
  int minutes = minute();  // Values from 0 - 59

  int a = 0;  //initial x val
  float clr = 235; //initial fill val
  int cntr = 0;  //initial fill counter val
  
  for(int i = 0; i < 60; i++) //make 60 minute boxes
  {
    fill(clr);
    minsecBoxes(a, 20);
    a +=10;//move box 10 pixels
    cntr++;
    if(cntr == 15)//every 15 boxes change fill shade for better viewing
    {
      clr = clr/1.2;
      cntr = 0;
    }
  }
  fill(0, 100, 0);
  minsecBoxes(minutes*10, 20);//move minute box 10 pixels every minute
}

void drawSeconds()
{
  //seconds
  int seconds = second();  // Values from 0 - 59
  
  int b = 0;  //initial x val
  float clr = 235; //initial fill val
  int cntr = 0;  //initial fill counter val
  
  for(int i = 0; i < 60; i++) //make 60 second boxes
  {
    fill(clr);
    minsecBoxes(b, 40);
    b +=10;//move box 10 pixels
    cntr++;
    if(cntr == 15)//every 15 sections change fill shade for better viewing
    {
      clr = clr/1.2;
      cntr = 0;
    }
  }
  fill(240, 149, 37);
  minsecBoxes(seconds*10, 40);//move box 10 pixels every second
}

void alarm()
{
  //sound alarm at pre-set time
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  int playOnce = 0;
  
  if(h == alarmHour && m == alarmMin)
  {
    alarmSound.play();
  }
}

void stop()
{
  alarmSound.close();
}


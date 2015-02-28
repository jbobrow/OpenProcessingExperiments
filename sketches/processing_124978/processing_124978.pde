
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//auxiliar
int y=0;
int a=0;
int b=0;
int d=0;

//image
PImage background;
PImage thunder;
PImage rain;
PImage rain2;
PImage rain3;

//sound
Minim minim;
AudioPlayer soundRain; //constant rain sound
AudioSample soundThunder; //thunder sound

void setup ()
{
  size (1000,700);
  
  //image
  background = loadImage("background.png");
  thunder = loadImage("thunder.png");
  rain = loadImage("chuva3.png");
    rain2 = loadImage("chuva1.png");
      rain3 = loadImage("chuva2.png");
  
  //sounds
  minim = new Minim (this);
  soundRain = minim.loadFile("rainLoop.mp3");
  
  //to loop background sound
  soundRain.loop();
  soundThunder = minim.loadSample("thunder.mp3");
}

void draw()
{
  //background
  image(background,0,0);
  
  //rain 
  image(rain,0,y);
  image(rain,0,y-rain.height);
  image (rain2,0,a);
  image (rain2,0,a-rain2.height);
  image(rain3,0,b);
  image(rain3,0,b-rain3.height);
  
  //to make rain goes down
  y= y+30;
  a= a+20;
  b= b+10;
 
 //to loop
  if (y==height)
    y=0;
  if (a==height)
     a=0;
  if (b==height)
  {
     b=0;
  }
  
}

//if the user click he starts a thunder
void mouseClicked()
{
  //sound 
  soundThunder.trigger();
  //flash image
  image (thunder, random(1000),0);
}


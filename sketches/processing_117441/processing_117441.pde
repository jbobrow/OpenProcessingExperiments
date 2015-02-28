
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioInput input;

void setup()
{
  size(400,400);
  
  minim = new Minim(this);
  player = minim.loadFile("Runninginthe90's.mp3");
  input = minim.getLineIn();
  player.play();
  
}
//Rumskib
int xRumskib = 200;
int yRumskib = 388;
int radius = 30;
int radius2 = 15;

//Sten 1
float xSten1 = random(10,380);
float ySten1 = random(-100,20);
int rSten1 = 20;

//Sten 2
float xSten2 = random(10,380);
float ySten2 = random(-100,20);
int rSten2 = 20;

//Sten 3
float xSten3 = random(10,380);
float ySten3 = random(-100,20);
int rSten3 = 20;

//Sten 4
float xSten4 = random(10,380);
float ySten4 = random(-100,20);
int rSten4 = 20;

//fart
float speed1 = 10;
float speed2 = 5;
float speed3 = 7;
float speed4 = 8;

//Forskel mellem ufo og bomber
float distance1 = sqrt((xSten1-xRumskib)*(xSten1-xRumskib)+(ySten1-yRumskib)*(ySten1-yRumskib));
float distance2 = sqrt((xSten2-xRumskib)*(xSten2-xRumskib)+(ySten2-yRumskib)*(ySten2-yRumskib));
float distance3 = sqrt((xSten3-xRumskib)*(xSten3-xRumskib)+(ySten3-yRumskib)*(ySten3-yRumskib));
float distance4 = sqrt((xSten4-xRumskib)*(xSten4-xRumskib)+(ySten4-yRumskib)*(ySten4-yRumskib));

void draw()
{
  background(random(0,255),random(0,255),random(0,255));
//Sten der falder ned Nr 1!
stroke(0,0,0);
ellipse(xSten1,ySten1,rSten1,rSten1);
ySten1 = ySten1+speed1;
if(ySten1>=410)
{
  xSten1 = random(0,390);
  ySten1 = random(-20,1);
  ellipse(xSten1,ySten1+speed1,rSten1,rSten1);
}

//Sten der falder ned Nr 2!
stroke(0,0,0);
ellipse(xSten2,ySten2,rSten2,rSten2);
ySten2 = ySten2+speed2;
if(ySten2>=410)
{
  xSten2 = random(0,390);
  ySten2 = random(-20,1);
  ellipse(xSten2,ySten2+speed2,rSten2,rSten2);
}

//Sten der falder ned Nr 3!
stroke(0,0,0);
ellipse(xSten3,ySten3,rSten3,rSten3);
ySten3 = ySten3+speed3;
if(ySten3>=410)
{
  xSten3 = random(0,390);
  ySten3 = random(-20,1);
  ellipse(xSten3,ySten3+speed3,rSten3,rSten3);
}

//Sten der falder ned Nr 4!
stroke(0,0,0);
ellipse(xSten4,ySten4,rSten4,rSten4);
ySten4 = ySten4+speed4;
if(ySten4>=410)
{
  xSten4 = random(0,390);
  ySten4 = random(-20,1);
  ellipse(xSten4,ySten4+speed4,rSten4,rSten4);
}

//Rumskib som bevæger sig
  fill(0,255,0);
  ellipse(xRumskib,yRumskib,radius,radius2);
  fill(255,255,255);
  if(keyPressed)
  {
    if(key == 'a' || key == 'A')
    {
      fill(0,255,0);
      ellipse(xRumskib-7,yRumskib,radius,radius2);
      fill(255,255,255);
      xRumskib = xRumskib-7;
    }
    if(key == 'd' || key == 'D')
    {
      fill(0,255,0);
      ellipse(xRumskib+7,yRumskib,radius,radius2);
      fill(255,255,255);
      xRumskib = xRumskib+7;
      }
      
//Kode, der får spillet til at slutte når meteor rammer rumskib
  distance1 = sqrt((xSten1-xRumskib)*(xSten1-xRumskib)+(ySten1-yRumskib)*(ySten1-yRumskib));
  if(distance1<30)
  {
    exit();
  }
  }
    distance2 = sqrt((xSten2-xRumskib)*(xSten2-xRumskib)+(ySten2-yRumskib)*(ySten2-yRumskib));
  if(distance2<30)
  {
    exit();
  }
    distance3 = sqrt((xSten3-xRumskib)*(xSten3-xRumskib)+(ySten3-yRumskib)*(ySten3-yRumskib));
  if(distance3<30)
  {
    exit();
  }
    distance4 = sqrt((xSten4-xRumskib)*(xSten4-xRumskib)+(ySten4-yRumskib)*(ySten4-yRumskib));
  if(distance4<30)
  {
    exit();
  }
}

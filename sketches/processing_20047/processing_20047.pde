
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import processing.video.*;

Minim minim;
AudioPlayer sauronVoice;
AudioInput input;

Capture myCapture;

PImage cornea;
PImage flameImage;

EyeSlit slit = new EyeSlit();
ArrayList flames = new ArrayList();
ArrayList ripples = new ArrayList();

int maxFlames = 60;
float audioGain = 0;
float gainMax = 0;

float ringX = 320;
float ringY = 240;

boolean holdingRing = false;

void setup() 
{
  size(640, 480);
  cornea = loadImage("sauron_cornea.png");
  flameImage = loadImage("test_flame.png");
  myCapture = new Capture(this, width, height, 30);
  
  minim = new Minim(this);
  sauronVoice = minim.loadFile("Eye_See_You.mp3");
  input = minim.getLineIn();
}

void captureEvent(Capture myCapture)
{
  myCapture.read();
}

void draw() 
{
  
  if(holdingRing)
  {
    background(0);
    
    if(!sauronVoice.isPlaying())
    {
      sauronVoice.loop();
    }
    
    image(cornea,0,0);
    
    pushMatrix();
    translate(width/2,height/2);
    
    //flames------------------------------------
    for(int i = 0; i < 1; i++)
    {
      Flame flame = new Flame();
      flames.add(flame);
    }
    for(int i = 0; i < flames.size(); i++)
    {
      Flame tFlame = (Flame) flames.get(i);
      tFlame.update();
    }
    while(flames.size()>maxFlames)
    {
      flames.remove(0);
    }
    //-------------------------------------------
    
    //eyeslit
    slit.update();
    popMatrix();
    
    ringX = mouseX;
    ringY = mouseY;
    
    gainMax = -(0.125 * abs(width/2-ringX))+5;
  }
  
  //display webcam video feed
  else
  {
    gainMax = -100;
    
    image(myCapture, 0, 0);
    
    for(int i = 0; i < ripples.size(); i++)
    {
      Ripple tRip = (Ripple) ripples.get(i);
      tRip.update();
      if(tRip.diamX > 10000)
      {
        ripples.remove(i);
        i--;
      }
    }
  }
  
  //ring
  strokeWeight(7);
  stroke(255,215,103);
  noFill();
  ellipse(ringX,ringY,50,50);
  
  maxFlames = int (70 - 0.2 * abs(ringX-width/2));
  slit.controlX = 0.6 * maxFlames;
  slit.controlY = 0.6 * maxFlames;
  
  audioGain += (gainMax - audioGain) * 0.05;
  sauronVoice.setGain(audioGain);
}

void mousePressed()
{
  if(!holdingRing)
  {
    if(abs(mouseX-ringX)<25 && abs(mouseY-ringY)<25)
    {
      sauronVoice.play();
      holdingRing = true;
    }
    else
    {
      Ripple rip = new Ripple(mouseX,mouseY);
      ripples.add(rip);
    }
  }
  else
  {
    holdingRing = false;
  }
}

class EyeSlit extends PShape
{
  float eyeHeight = 350;
  float controlX = 50; //distance from start/end points on x-axis
  float controlY = 50; //distance from start/end points on y-axis
  
  void update()
  {
    drawSlit();
  }
  
  void drawSlit()
  {
    float top = height/2-eyeHeight/2;
    float bottom = height/2+eyeHeight/2;
    
    noStroke();
    fill(0); 
    beginShape();
    bezier(width/2,top, width/2-controlX,top+controlY, width/2-controlX,bottom-controlY, width/2,bottom);
    bezier(width/2,top, width/2+controlX,top+controlY, width/2+controlX,bottom-controlY, width/2,bottom);
    endShape();
  }
}

class Flame
{
  float angleValue = random(0,TWO_PI);
  float xPos = -70 * cos(angleValue);
  float yPos = -70 * sin(angleValue);
  float speed = random(5,8);
  float flameScale = random(2, 3);
  
  void update()
  {
    xPos += speed * cos(angleValue);
    yPos += speed * sin(angleValue) * 0.6;
    
    pushMatrix();
    translate(xPos,yPos);
    scale(flameScale);
    rotate(angleValue+PI*0.5);
    image(flameImage,-25,-39);
    popMatrix();
  }
}

class Ripple
{
  float xPos;
  float yPos;
  float diamX = 1;
  float diamY = 1;
  
  Ripple(float x, float y)
  {
    xPos = x;
    yPos = y;
  }
  
  void update()
  {
    stroke(103,203,255,100);
    strokeWeight(diamX/20);
    noFill();
    diamX+=5;
    diamY+=5;
    ellipse(xPos,yPos,diamX,diamY);
  }
}


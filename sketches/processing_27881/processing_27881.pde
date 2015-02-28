
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;

float[] yCoord;
float[] speed;
float[] circles;
int space=20;
float size1=50;
int r=0;
int g=0;
int b=255;
void setup()
{
  minim = new Minim(this);
  song2 = minim.loadFile("noise1.aif");
  song3 = minim.loadFile("nosie2.aif");
  song4 = minim.loadFile("noise3.aif");
  song5 = minim.loadFile("noise4.aif");
  size (500,500);
  smooth();
  yCoord = new float [width/space+1];
  speed = new float [width/space+1];
  for(int i=0;i<yCoord.length;i=i+1) {

    yCoord[i]=0;
    speed[i]=random(6,8);
  }
  circles = new float [50+1];
  for(int n=0;n<circles.length;n=n+1) {
    circles[n]=random(10,50);
  }

  background(0);
  fill(0,5);
  rect(0,0,width,height);
  stroke(56, 146,240);
  strokeWeight(5);
}

void draw()
{
  noCursor();
  noStroke();
  fill(0,70);
  ellipse(mouseX,mouseY,20,20);
  ellipse(mouseX,mouseY,90,90);
  ellipse(mouseX,mouseY,170,170);
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  int coltone = 0;
  strokeWeight(8);
  for(int i=0;i<yCoord.length;i=i+1) { 
    
    yCoord[i]= yCoord[i] + speed[i];
    if(dist(mouseX,i*space,mouseY,yCoord[i]) <= 10 && mouseX>0&&mouseX<150){
      song2.loop(5);
      coltone = 100;
    }

    if(dist(mouseX,i*space,mouseY,yCoord[i]) <= 15 && mouseX>80&&mouseX<120){
      song4.loop(2);
      coltone = 150;
    }

    if(dist(mouseX,i*space,mouseY,yCoord[i]) <= 10 && mouseX>140&&mouseX<310){
      song3.loop(2);
      coltone = 50;
    }
    
     if(dist(mouseX,i*space,mouseY,yCoord[i]) <= 15 && mouseX>250&&mouseX<350){
      song2.loop(2);
      coltone = 100;
    }

    if(dist(mouseX,i*space,mouseY,yCoord[i]) <= 10 && mouseX>320&&mouseX<500){
      song4.loop(5);
      coltone = 150;
    }
    
    stroke(43 + coltone, 85,234-coltone, 180- coltone);
    line(i*space,yCoord[i]-coltone,i*space,yCoord[i]);
    
    if (yCoord[i]>500)
    {
      yCoord[i]=0;
    }
   song3.loop(0);
  }
}

void stop()
{
  song2.close();
  minim.stop();
  super.stop();
}



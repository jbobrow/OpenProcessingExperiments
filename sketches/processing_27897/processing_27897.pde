

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer song2;
BeatDetect beat;

//Ben's cunning code to provide resources
PImage bflyImg;
PImage mouseImg;
PImage blankImg;
int soundDelay = 10;

//controlling colour over time
int okay;




void setup() {
  size(500, 500);
  okay = 10;

  background(147,49,219);
  minim = new Minim(this);
  song = minim.loadFile("purpose.wav");
  song2 = minim.loadFile("xplosion.wav");
  song.loop();
  beat = new BeatDetect();
  
  //Ben's cunning code to load images.
  bflyImg = loadImage("images.gif");
  blankImg = createImage(1,1,ARGB);
  mouseImg = blankImg;
  
}

void draw() {
  //background(255)
  stroke(27,22,51);
  if(okay<255) {
    okay = okay+1;
  }
  else {
    okay=0;
  }
  fill(147,49,219,10);
  rect(0,0,width,height);
  beat.detect(song.mix);
  if (beat.isOnset()) {
    fill(255);
    rect(0,0,width,height);
  }


  fill(okay,0,25,100);

  float butterflatter = width*sin(frameCount*.01);


  float x1 =mouseX-1-butterflatter;
  float y1=mouseY-1-width*sin(frameCount*.01);
  float x2=mouseX+2+width*0.1*sin(frameCount*.01);
  float y2=mouseY-2+width*sin(frameCount*.01);
  float x3= mouseX+4+width*sin(frameCount*.01);
  float y3=mouseY+4+width*sin(frameCount*.01);
  float x4=mouseX-6+width*sin(frameCount*.01);
  float y4=mouseY+6+width*sin(frameCount*.01);

  //put collision test here
  boolean collided = false;
  if (x1<1)
  {
    x1=0;
    collided=true;
  }
  if (y1<0)
  {
    y1=0;
    collided=true;
  }
  if (x2<0)
  {
    x2=0;
    collided=true;
  }
  if (y2<0)
  {
    y2=0;
    collided=true;
  }
  if (x3<0)
  {
    x3=0;
    collided=true;
  }
  if (y3<0)
  {
    y3=0;
    collided=true;
  }
  if (x4<0)
  {
    x4=0;
    collided=true;
  }
  if (y4<0)
  {
    y4=0;
    collided=true;
  }
  if(x1>width)
  {
    x1=width;
    collided=true;
  }
  if (y1>width)
  {
    y1=width;
    collided=true;
  }
  if(x2>width)
  {
    x2=width;
    collided=true;
  }
  if (y2>width)
  {
    y2=width;
    collided=true;
  }
  if(x3>width)
  {
    x3=width;
    collided=true;
  }
  if (y3>width)
  {
    y3=width;
    collided=true;
  }
  if(x4>width)
  {
    x4=width;
    collided=true;
  }
  if (y4>width)
  {
    y4=width;
    collided=true;
  }
  //if (collided) {
    //song2.play();
  //}
  quad(x1,y1,x2,y2,x3,y3,x4,y4); 
  quad(y4,x4,y3,x3,y2,x2,y1,x1);
  

  
  //Ben's cunning code to put stuff on the mouse pointer
  image(mouseImg, mouseX - 0, mouseY - 0);
  
  //Ben's cunning code to change the mouse pointer
  if(mousePressed)
  {
    mouseImg = bflyImg;
  }
  else
  {
    mouseImg = blankImg;
  }
}


void stop() {

  song.close();
  song2.close();
  minim.stop();
  super.stop();
}



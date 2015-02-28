
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer song2;
AudioPlayer song3;
BeatDetect beat;

PImage butterfly;
PImage growImg;

float[] butterflyXpositions = new float[20];
float[] butterflyYpositions = new float[20];

int more = 0;
int counter = 0;


void setup() {
  size(500,500);
  background(255,83,38);

  minim = new Minim(this);
  song = minim.loadFile("purpose.wav");
  song2 = minim.loadFile("sound2.wav");
  song3 = minim.loadFile("sound3.wav");
  
  beat = new BeatDetect();
  growImg = loadImage("flowerdrw.gif");
  butterfly = loadImage("butter.gif");


  imageMode(CENTER);
  int i = 0;

  while(i < 20) {
    butterflyXpositions[i] = -1;
    butterflyYpositions[i] = -1;
    i=i+1;
  }
}


void draw() {
    
      fill(147,49,219,10);  
      ellipse(50,50,counter,counter);
      ellipse(50,100,counter,counter);
      ellipse(50,150,counter,counter);
      ellipse(100,200,counter,counter);
      ellipse(100,250,counter,counter);
      ellipse(100,250,counter,counter);
      ellipse(150,100,counter,counter);
      ellipse(150,150,counter,counter);
      ellipse(150,200,counter,counter);
      ellipse(250,25,counter,counter);
      ellipse(200,50,counter,counter);
      ellipse(200,350,counter,counter);
      ellipse(200,400,counter,counter);
      ellipse(200,450,counter,counter);
      ellipse(200,500,counter,counter);
      ellipse(250,20,counter,counter);
      ellipse(250,70,counter,counter);
      ellipse(250,125,counter,counter);
      ellipse(300,175,counter,counter);
      ellipse(300,220,counter,counter);
      ellipse(300,270,counter,counter);
      ellipse(350,325,counter,counter);
      ellipse(350,370,counter,counter);
      ellipse(350,420,counter,counter);
      ellipse(400,470,counter,counter);
      ellipse(400,70,counter,counter);
      ellipse(400,125,counter,counter);
      ellipse(450,175,counter,counter);
      ellipse(450,220,counter,counter);
      ellipse(450,270,counter,counter);
      ellipse(500,325,counter,counter);
      ellipse(500,370,counter,counter);
      ellipse(500,420,counter,counter);
      ellipse(50,470,counter,counter);
      counter=counter+2;
    


    image(growImg,100,400);

    int i = 0;
    while(i < 20) {
      if(butterflyXpositions[i]>0)
      {  
        image(butterfly,butterflyXpositions[i]+sin(frameCount/75.0)*50,butterflyYpositions[i]+sin(frameCount/50.0)*200);
        }  
      i=i+1;
    }
 
}

  void mousePressed() {

    if(more<20)
    {
      butterflyXpositions[more] = mouseX;
      butterflyYpositions[more] = mouseY;

      more=more+1;
    }
    if(more>=20)
    {
      more=0;
    }
if(mousePressed)
{
 song.play();  
 
}
if(more>4)
{
  song.rewind();
  song3.play();
  
 }
if(more>8)
  {
    song3.rewind();
    song2.play();
  } 
 if(more>12)
{
 song2.loop();
} 
}

void stop() {

  song.close();
  song2.close();
  song3.close();
  minim.stop();
  super.stop();
}


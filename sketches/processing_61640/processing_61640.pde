
//project 2: Javier the talking java
//copyright kyree 2012 
//section 257-757
//Andrew ID kholmes
//code inspired by steve tiffany: http://www.openprocessing.org/sketch/50408

import ddf.minim.*;
Minim minim;

AudioPlayer[] voice = new AudioPlayer[14];
int voiceIndex = 0;

PImage cup,  mouth1;


void setup() 
{
  size(350, 500);
  smooth(); 
  background(#edaa96);

  minim=new Minim(this);
  voice[0]=minim.loadFile("convo1.mp3", 1024);
  voice[1]=minim.loadFile("convo2.mp3", 1024);
  voice[2]=minim.loadFile("convo3.mp3", 1024);
  voice[3]=minim.loadFile("convo4.mp3", 1024);
  voice[4]=minim.loadFile("convo5.mp3", 1024);
  voice[5]=minim.loadFile("convo6.mp3", 1024);
  voice[6]=minim.loadFile("convo7.mp3", 1024);
  voice[7]=minim.loadFile("convo8.mp3", 1024);
  voice[8]=minim.loadFile("convo9.mp3", 1024);
  voice[9]=minim.loadFile("convo10.mp3", 1024);
  voice[10]=minim.loadFile("convo11.mp3", 1024);
  voice[11]=minim.loadFile("convo12.mp3", 1024);
  voice[12]=minim.loadFile("convo13.mp3", 1024);
  voice[13]=minim.loadFile("convo14.mp3", 1024);
// for (int i = 0; i < music.length; i++)
//{
//music[i] = minim.loadFile("music" + i + ".mp3");
//}

  cup = loadImage("cup.png");
  mouth1 = loadImage("mouth1.png");
}

 void draw () 
{
  image(cup,25,0);

  for (int i=0; i < voice.length; i++) 
  {     
  int mouthHeight = int(250 + (abs(voice[i].mix.get(512)*200)));
  //keeps mouth from going too far up or down
  if (mouthHeight<250) {mouthHeight = 250;}
  if (mouthHeight>275) {mouthHeight = 275;}
  image(mouth1,90,mouthHeight);
  }
}

 void mousePressed () 
{
  voiceIndex = int(random(voice.length));
  for (int i = 0; i< voice.length; i++)
  {
  voice[voiceIndex].play();
  }
}


void stop() 
  {
   for (int i=0; i < voice.length; i++) 
   {
     voice[i].close();
   }
   minim.stop();
   super.stop(); 
}



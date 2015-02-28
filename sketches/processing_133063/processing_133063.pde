
float posizioneXPalla;
float posizioneYPalla;
float PosizioneYGuanto;

int start;
int avanti;
int goal;
int parata;

PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;

PFont font;

import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup(){

  size(400,600);
  img =loadImage("pax.png");
  img1 =loadImage("decoroS.png");
  img2 =loadImage("decoroD.png");
  img3 =loadImage("Fiorebianco.png");
  img4 =loadImage("Fiorenero.png");
  
  
  start=1;
  avanti=1;
  PosizioneYGuanto=300;
  goal=0;
  parata=0;
  font = loadFont("EverydayTypo-18.vlw");
  textFont(font);
  
   minim = new Minim(this);
  player = minim.loadFile("Trippy.mp3");
  player.loop();    
 



}


void draw(){

  background(0,240,206);
  fill(211,26,26);
  text("Parate:", 45, 520);
  text("Goal:", 250, 520);
  text(parata,120, 520);
  text(goal, 310, 520);
  
  noStroke();
  fill(0);
  rect(0,355,800,15);
  fill(255);
  rect(0,365,800,10);
 

  image(img1,10,300);
  image(img2,390,300);
  
  imageMode(CENTER);
  image (img, 0+mouseX,PosizioneYGuanto,60,60);

  if (start==1)
  {
    posizioneXPalla=random(width);
    posizioneYPalla=0;
    image(img3,posizioneXPalla,posizioneYPalla,30,30);
    start=0;
  }
  else
  {
    if (avanti==1)
    {
      posizioneYPalla=posizioneYPalla+5;
      image(img4,posizioneXPalla,posizioneYPalla,30,30);
      
      if(mouseX-40<posizioneXPalla && mouseX+40>posizioneXPalla && PosizioneYGuanto-30<posizioneYPalla && PosizioneYGuanto+30>posizioneYPalla)
      {
        avanti=0;
        
        parata=parata+1;
        println("numero parate: ");
        println(parata);
       

        
      }
      else
      {
        if(posizioneYPalla==PosizioneYGuanto+35){
          goal=goal+1;
          println("numero goal: ");
          println(goal);
          start=1;
        }
      }

    }
    else{//indietro
    
          posizioneYPalla=posizioneYPalla-5;
          image(img3,posizioneXPalla,posizioneYPalla,30,30);
                    
          if(posizioneYPalla<0){
          
            start=1;
            avanti=1;
          }

    
    }
  
  
  }
  
}
  
  


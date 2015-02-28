

import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

void setup()
{size(754,1131);
img=loadImage("1.jpg");
img2=loadImage("2.jpg");
img3=loadImage("3.jpg");
img4=loadImage("4.jpg");
img5=loadImage("6.png");
img6=loadImage("Fenster.png");

minim=new Minim (this);
player=minim.loadFile("hexe.mp3");
player2=minim.loadFile("Donner.mp3");
player3=minim.loadFile("tuer.mp3");
}

void draw()
{
  imageMode(CORNER);
  background(0);
  image(img,0,0);
  
if(mouseX>=0 && mouseX<=360 && mouseY>=118 && mouseY<=504)
{
cursor(HAND);
}
else if(mouseX>=69 && mouseX<=119 && mouseY>=796 && mouseY<=882)
{
  cursor(HAND);
}

else if(mouseX>=370 && mouseY>=0 && mouseY<=190)
{
  cursor(HAND);
}


else
{
cursor(ARROW);
}


  if(mouseX>=0 && mouseX<=360 && mouseY>=118 && mouseY<=504 && mousePressed==true)
  {imageMode(CORNER);
  image(img2,0,0);
  }
  
  if(mouseX>=370 && mouseY>=0 && mouseY<=190 && mouseButton==LEFT)
  {image(img3,0,0);
  }
 if(mousePressed==true)
 if(mouseX>=370 && mouseY>=0 && mouseY<=190 && mouseButton==RIGHT)
 {image(img4,0,0);
  player2.rewind();
  player2.play();
 }
 
  
  if (mousePressed==true && player.isPlaying()==false && mouseX>=22 && mouseX<=716 && mouseY>=358)
{
  player.rewind();
  player.play();
}

if (mousePressed==true && mouseX>=69 && mouseX<=119 && mouseY>=796 && mouseY<=882)
{
  player3.rewind();
  player3.play();
}
if(mousePressed==true && mouseX>=69 && mouseX<=119 && mouseY>=796 && mouseY<=882)
{
  player.pause();
}

if(hour()>=17)
{imageMode(CORNER);
image(img6,0,0);
}
if(hour()>=0 && hour()<=7)
{image(img6,0,0);
}

  
  if(mouseY>=334 && mouseY<=height)
  {
    imageMode(CENTER);
    image(img5,mouseX, mouseY);
  }

}



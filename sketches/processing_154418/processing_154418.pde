
// James Vaughn
// 7/6/2014

Maxim maxim;
AudioPlayer player;

PImage img;
PImage img2;
PImage img3;
PImage img4;
PImage c;
Boolean firstTime = true;
Float musicSpeed;

/* @pjs preload="stars.jpg"; */
/* @pjs preload="indonesia.jpg"; */
/* @pjs preload="circuit.jpg"; */
/* @pjs preload="meat.jpg"; */

void setup()
{
      maxim = new Maxim(this);
      player = maxim.loadFile("prize_from_heaven.wav");
      player.setLooping(true);
  
      img = loadImage("stars.jpg");
      img2 = loadImage("indonesia.jpg");
      img3 = loadImage("circuit.jpg");
      img4 = loadImage("meat.jpg");
      size(640, 480);
      background(0,0,0);
      textSize(32);
      text("Picture Palette",  (width-200)/2,height/2);  
     
     
}

void draw()
{ 
      
  image(img,width - 100,0,100,100);     
  image(img2,width - 100,100,100,100); 
  image(img3,width - 100, 200,100,100);
  image(img4,width - 100, 300, 100, 100);
  
   textSize(14);
   text("Music: Prize From Heaven by SOUNDGENIUS.COM", 15,20);
   text("Images courtesy of the following",15, 420);
   text("Stuart Miles(top),Suwatpo(second), Michelle Meiklejohn(third), Suat Elman(bottom)",15,440);
   text("FreeDigitalPhotos.net", 15,460);
         
}

void mouseClicked()
{  
  
  if(mouseX > (width - 100) && mouseY < 400 && mouseButton == LEFT)
  {
     c = get(mouseX,mouseY,15,15);
  }  
  
  if(mouseButton == RIGHT)
  {
    background(0,0,0);
  }
}

void mouseDragged()
{
  if(c != null)
  {
   musicSpeed = (dist(mouseX,mouseY,pmouseX,pmouseY));
   image(c,mouseX,mouseY);
   player.play();
   player.speed(map(musicSpeed,0,50,1,2));
  }
}

void mouseMoved()
{
  player.stop();
}



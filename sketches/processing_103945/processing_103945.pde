
import ddf.minim.spi.*;
import ddf.minim.*;

//global audio variables
Minim music;
AudioPlayer song;
AudioInput input;

//global pages array variables
int num = 12;
int index;
PImage[] myPages=new PImage[num];
scrollbar hs1;

void setup() 
{
  size(960, 560);
  
//set pages
  myPages[0]=loadImage("Page0.jpg");
  myPages[1]=loadImage("Page1.jpg");
  myPages[2]=loadImage("Page2.jpg");
  myPages[3]=loadImage("Page3.jpg");
  myPages[4]=loadImage("Page4.jpg");
  myPages[5]=loadImage("Page5.jpg");
  myPages[6]=loadImage("Page6.jpg");
  myPages[7]=loadImage("Page7.jpg");
  myPages[8]=loadImage("Page8.jpg");
  myPages[9]=loadImage("Page9.jpg");
  myPages[10]=loadImage("Page10.jpg");
  myPages[11]=loadImage("Page11.jpg");
  
  hs1 = new scrollbar(0, height-20, width, 16, 16);  

//set audio
  music = new Minim(this);
  song = music.loadFile("piano.mp3");
  song.loop();
}

void draw() 
{
  int index=0;
  background(255);
  
//pages
  index=int(hs1.spos/(width/num));
  image(myPages[index], width/2 - myPages[index].width/2, 0);  
  
  hs1.display();
  hs1.update();
  
}

//audio playback

void stop()
{
  song.close();
  music.stop();

  super.stop();
}

//scrollbar class

class scrollbar 
{
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // the mouse over the slider?
  boolean dragged;
  float ratio;

  scrollbar (float xp, float yp, int sw, int sh, int l) 
  {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + 16 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() 
  {
    if (overEvent()) 
    {
      over = true;
    } 
    else 
    {
      over = false;
    }
    if (mousePressed && over) 
    {
      dragged = true;
    }
    if (!mousePressed) 
    {
      dragged = false;
    }
    if (dragged) 
    {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) 
    {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) 
  {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() 
  {
    if (mouseX > xpos && mouseX < xpos+swidth && mouseY > ypos && mouseY < ypos+sheight) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }

  void display() 
  {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || dragged) {
      fill(0, 0, 0);
    } 
    else 
    {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() 
  {
    // Convert spos to be values between 0 and the total width of the scrollbar
    return spos * ratio;
  }
}





import ddf.minim.*;


float randomnumber;
int fontsize = 10;
int e = 5;
int value = 0;

int scratchcount =0;

Minim minim;
AudioPlayer song1, song2, song3;

PImage img;

void setup()
{
  size(1000, 1000);
  minim = new Minim(this);
  img = loadImage("fur.jpeg");
}

//fade image
void fade()
{
  tint(200, 150, 150, 5*e);
  image(img, 0, 0, height, width);
}


void draw()
{

if (scratchcount <10)
{
  fill(255, 255, 255, 100);
  textFont(createFont("Futura", fontsize));
  measurespeed(mouseX, mouseY, pmouseX, pmouseY);
  
}

else if (scratchcount ==10)
{
    song3 = minim.loadFile("meow.wav");
     song3.play();
     scratchcount++;
}

else if (scratchcount > 10)
  {
  
    blackout();
  }
  
}


//end interaction
void blackout()
{
  background(100);
  text("thanks.", width/2, height/2);
}

//random words
void ow()
{
  randomnumber=random(0, 1);
  if (randomnumber<0.5)
  {
    text("ouch!", random(width), random(height));
  }
  else if (randomnumber>0.5 && randomnumber < 0.8 )
  {
    fill(50, 50, 50);
    text("no!", random(width), random(height));
  }
  else if (randomnumber>0.8)
  {
    fill(50, 50, 50);
    text("scratch me please!", random(width), random(height));
  }
}

//mouseclick play sound
void mouseClicked()
{
  song1 = minim.loadFile("mouseclick.wav");
  song1.play();

  ow();
  fontsize+=e;
  fade();
}

//figure out the speed of the mouse
void measurespeed(int x, int y, int px, int py)
{
  int speed = abs(x-px) + abs(y-py);
  //text(speed, mouseX, mouseY);

  if (speed < 100 && speed > 90)
  {

    if (x > 700 && y > 700) {
      text("nice", mouseX, mouseY);
      song2 = minim.loadFile("scratchskin.wav"); 
      scratchcount++;
      song2.play();
      
    }
    
    //mouse moving above
    else if (x > 700 && y < 700)
    {
      text("down a little", mouseX, mouseY);
    }

    //mouse moving far from the scratch
    else if (x < 700 && y < 700)
    {
      text("you're totally off", mouseX, mouseY);
    }

    //mouse moving on the left of the scratch
    else if (x < 700 && y >700)
    {
      text("go right", mouseX, mouseY);
    }
  }
}

//create a point
void mouseMoved()
{
  value = value + 1;
  point(mouseX, mouseY);
}


//required!
void stop()
{
  //  song1.close();
  //    song2.close();

  minim.stop();
  super.stop();
}




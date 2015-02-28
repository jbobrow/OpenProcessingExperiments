
float timer;
PImage mountain;
PImage mountain2;
PImage mountain3;
PImage mountain4;
PFont daun;
void setup()
{
  size (500,500);
  mountain = requestImage("mountain.png");
  mountain2 = requestImage("mountain2.png");
  mountain3 = requestImage("mountain3.png");
  mountain4 = requestImage("mountain4.png");
  daun= createFont("DaunPenh", 48);
}

void draw()
{
  timer+=.0167;
  fill(232,229,229);
  textFont(daun);
  
  if(timer<=5)
  {
    if (mountain.width > 0)
  {
    image(mountain, 0, 0, width, height);
  }
  }
    if(timer<=6&&timer>5)
  {
    if (mountain2.width > 0)
  {
    image(mountain2, 0, 0, width, height);
  }
  }
      if(timer<=7&&timer>6)
  {
    if (mountain3.width > 0)
  {
    image(mountain3, 0, 0, width, height);
  }
  }
        if(timer>7)
  {
    if (mountain4.width > 0)
  {
    image(mountain4, 0, 0, width, height);
  }
  }
  if(timer<=1.5)
  {
    text("mountains", 30, 350);
  }
  
    if(timer>=1&&timer<=2.5)
  {
    text("are", 40, 400);
  }
      if(timer>=1.5&&timer<=3)
  {
    text("mute", 50, 450);
  }
        if(timer>=3&&timer<=4)
  {
    text("why", 30, 200);
  }
          if(timer>=3.5&&timer<=4.5)
  {
    text("are you speaking", 40, 250);
  }
          if(timer>=4&&timer<=5)
  {
    text("to one?", 50, 300);
  }
            if(timer>=5&&timer<=6)
  {
    text("That's weird.", 50, 270);
  }
              if(timer>=6&&timer<=7)
  {
    text("I hear though", 30, 350);
  }
                if(timer>=6.5&&timer<=7.5)
  {
    text("that they're", 40, 400);
  }
                  if(timer>=7&&timer<=8)
  {
    text("sometimes hollow.", 50, 500);
  }
}



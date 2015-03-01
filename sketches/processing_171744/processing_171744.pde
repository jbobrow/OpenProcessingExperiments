
int frames = 10;
int panel = 0;
PImage bardock = new PImage [frames];
float xpos, ypos;
PImage RightPunch;
PImage LeftPunch;
PImage RightKick;
PImage LeftKick;
PImage stance;
PImage SS;
PImage blast1;
PImage blast2;

void setup()
{
  size (500,500);
  stance=loadImage("bardock_0.png");
  frameRate(1);
  SS=loadImage("bardock_9.png");
  frameRate(1);
  RightPunch=loadImage("bardock.punch_0.png");
  frameRate(1);
  LeftPunch=loadImage("bardock.punch_1.png");
  frameRate(1);
  RightKick=loadImage("bardock.kick_0.png");
  frameRate(1);
  LeftKick=loadImage("bardock.kick_1.png");
  blast1=loadImage("bardockSS.blast_0.png");
  blast2=loadImage("bardockSS.blast_1.png");
  for(int i=0; i<bardock.length; i++)
  {
    bardock[i]=loadImage("bardock_"+i+".png");
    frameRate(10);
  }
}

void draw()
{
  fill(255);
  rect(0,0,500,500);
  
  if(keyPressed)
  {
    if(key== 'b' || key == 'B')
    {
      panel = (panel+1) % frames;
      image(bardock[panel%frames],0,0);
    }
  } else {
    image (bardock[panel%frames],0,0);
  }
  if (key == 'q' && 'Q')
  {
   image (RightPunch,0,0);
  }
  if (key == 'e' && 'E')
  {
    image(LeftPunch,0,0);
  }
  if (key == 'a' && 'A')
  {
    image (RightKick,0,0);
  }
  if (key == 'd' && 'D')
  {
    image (LeftKick,0,0);
  }
  if (key == 's' && 'S')
  {
    image (stance,0,0);
  }
  if (key == 'w' && 'W')
  {
    image (SS,0,0);
  }
  if (key == 'r' && 'R')
  {
    image (blast1,0,0);
  }
  if (key == 't' && 'T')
  {
    image (blast2,0,0);
  }
}



    



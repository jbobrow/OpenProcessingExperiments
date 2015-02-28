
float WORLD_SIZE = 10;
int nAnts = 1000;
Ant[] antList = new Ant[nAnts];
color cWhite = color(255, 255, 255),
   cGreen = color(0, 255,0),
   cRed = color(255,0,0),
   cBlue = color(150,150,255);
   
World world = new World(1000);

void setup()
{
  size(300, 300); 
  background(0);
  
  for (int iAnt=0;iAnt<nAnts;iAnt++)
    antList[iAnt] = new Ant();  
  
}

void draw()
{
    background(51);
    
    for (int iAnt=0;iAnt<nAnts;iAnt++)
    {
      antList[iAnt].Update();
      antList[iAnt].Draw();      
    }
    
    world.Draw();
}

class Point
{
   float x, y, vx, vy;
   color _color;
   boolean doDraw;
   
   Point()
   { 
     x = random(-WORLD_SIZE/2, WORLD_SIZE/2);
     y = random(-WORLD_SIZE/2, WORLD_SIZE/2);
     doDraw = true;
   }
   
  void Draw()
  {
    if (doDraw)
    {
      set(round(x/WORLD_SIZE * width + width/2),
        round(y/WORLD_SIZE * width + width/2),
        _color);
    }
  }
}

class Ant extends Point
{
  float maxSpeed = 0.1;
  float minStuffDist = 0.05;
  int hasStuff = -1;
  float putDownTime = -1;
  
  Ant()
  {
    _color = cBlue;
  }
  
  void Update()
  {
     vx = vx + (0.5-random(1)) * maxSpeed;
      vy = vy + (0.5-random(1)) * maxSpeed;
      
     float nx = x + (0.5-random(1)) * maxSpeed,// + vx * 1.0/framerate,
      ny = y + (0.5-random(1)) * maxSpeed;// + vy * 1.0/framerate;

    while(nx < -WORLD_SIZE/2) nx+=WORLD_SIZE;
    while(nx > WORLD_SIZE/2) nx-=WORLD_SIZE;
    while(ny < -WORLD_SIZE/2) ny+=WORLD_SIZE;
    while(ny > WORLD_SIZE/2) ny-=WORLD_SIZE;

    x = nx; y = ny;
      
      int stuffIndex = IsNearStuff();
      
      if (stuffIndex != -1) // if near stuff
      {
        if (hasStuff == -1) // if not has stuff
        {
          if (putDownTime < 0) // if not put down stuff recently
          {
            PickUp(stuffIndex);
          }
        }
        else PutDown();
      }
      else putDownTime--;
  }
  
  int IsNearStuff()
  {
    for (int iStuff=0; iStuff<world.stuffList.length; iStuff++)
    {
      Stuff cStuff = world.stuffList[iStuff];
      if (!cStuff.pickedUp)
        if ((x<cStuff.x+minStuffDist) &&
          (x>cStuff.x-minStuffDist) &&
          (y<cStuff.y+minStuffDist) &&
          (y>cStuff.y-minStuffDist))
          {
            return iStuff;
          }
    }
    return -1;
  }
  
  void PickUp(int stuffIndex)
  {
     hasStuff = stuffIndex;
    world.stuffList[hasStuff].pickedUp = true;
    world.stuffList[hasStuff].doDraw = false;
    _color = cRed;
  }
  
  void PutDown()
  {
 
    world.stuffList[hasStuff].pickedUp = false;
    world.stuffList[hasStuff].doDraw = true;
    world.stuffList[hasStuff].x = x;
    world.stuffList[hasStuff].y = y;
    hasStuff = -1;
    putDownTime = 100;
    _color = cBlue;  
  }
}

class Stuff extends Point
{
  boolean pickedUp;
  String name;
  
  Stuff()
  {
    _color = cGreen;
    pickedUp = false;
  }
 
}

class World
{
  Stuff[] stuffList;
  
  World(int nStuff)
  {
    stuffList = new Stuff[nStuff];
    
    for (int iStuff=0; iStuff<nStuff; iStuff++)
    {
      stuffList[iStuff] = new Stuff();
      stuffList[iStuff].name = "stuff"+ iStuff;
    }
    
   /* float stuffSqr = sqrt(nStuff);
    int iStuff = 0;
    for (float iStuffX = 0; iStuffX<stuffSqr; iStuffX++)
    {
      for (float iStuffY = 0; iStuffY<stuffSqr; iStuffY++)
      {
        iStuff++;
        if (iStuff < nStuff)
        {
          stuffList[iStuff].x = (iStuffX)/stuffSqr*WORLD_SIZE - WORLD_SIZE/2.0;
          stuffList[iStuff].y = (iStuffY)/stuffSqr*WORLD_SIZE - WORLD_SIZE/2.0;
        }
      }
    }*/
  }
  
  
 
  
  void Draw()
  {
    for (int iStuff=0; iStuff<stuffList.length; iStuff++)
      stuffList[iStuff].Draw();
  }
}



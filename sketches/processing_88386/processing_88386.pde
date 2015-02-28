
//Copyright Kelechi Anyadiegwu
//Homework 6

float lipsx, lipsy, lipsSize, lipsSpeed;
float lipsturqx, lipsturqy, lipsturqSize, lipsturqSpeed;
float lipspurplex, lipspurpley, lipspurpleSize, lipspurpleSpeed;
float lipscherryx, lipscherryy, lipscherrySize, lipscherrySpeed;
float lipsdarkcherryx, lipsdarkcherryy, lipsdarkcherrySize, lipsdarkcherrySpeed;
float lipslimex, lipslimey, lipslimeSize, lipslimeSpeed;

PImage lipsImage, lipsturq, lipscherrypink, lipsdarkerpink, lipslimegreen, lipspurple;

void setup ()
{
 
 size(400,400);
 smooth();
 frameRate(20);
 lipsx =random(width);
 lipsy =random(height);
 lipsSize=100;
 lipsSpeed=5;
 
 lipsturqx=random(width);
 lipsturqy=random(height);
 lipsturqSize=100;
 lipsturqSpeed=2;
 
 lipspurplex=random(width/1.5);
 lipspurpley=random(height/1.5);
 lipspurpleSize=100;
 lipspurpleSpeed=5;
 
 lipscherryx=random(width/3);
 lipscherryy=random(height/3);
 lipscherrySize=100;
 lipscherrySpeed=10;
 
 lipsdarkcherryx=random(width/4);
 lipsdarkcherryy=random(height/4);
 lipsdarkcherrySize=100;
 lipsdarkcherrySpeed=15;
 
 lipslimex=random(width/5);
 lipslimey=random(height/5);
 lipslimeSize=100;
 lipslimeSpeed=20;
 
 lipsImage = loadImage("lipsorange.png");
 lipsturq = loadImage("lipsturq.png"); 
 lipscherrypink = loadImage("lipscherrypink.png");
 lipsdarkerpink = loadImage("lipsdarkerpink.png");
 lipslimegreen = loadImage("lipslimegreen.png");
 lipspurple = loadImage("lipspurple.png");
 
 frameRate(5);
}

void draw()
{
 //prepWindow();
 
 background(random(255), random(255), random(255));
 moveLips();
 drawLips(lipsx, lipsy, lipsSize); 
 moveLipsTurq();
 drawLipsTurq(lipsturqx, lipsturqy, lipsturqSize);
 moveLipsPurp();
 drawLipsPurp(lipspurplex, lipspurpley, lipspurpleSize);
 moveLipsCherry();
 drawLipsCherry(lipscherryx, lipscherryy, lipscherrySize);
 moveLipsDarkCherry();
 drawLipsDarkCherry(lipsdarkcherryx, lipsdarkcherryy, lipsdarkcherrySize);
 moveLipsLime();
 drawLipsLime(lipslimex, lipslimey, lipslimeSize);
}

void moveLips()
{
 lipsx = lipsx + lipsSpeed;
  if(lipsx > width)
   {
    lipsSpeed = -lipsSpeed*2;
   }
  else if (lipsx< 0)
   {
    lipsSpeed = -lipsSpeed*2;
   } 
                   
}

void drawLips(float lipsx, float lipsy, float lipsSize)
{
 image(lipsImage, lipsx, lipsy, lipsSize, lipsSize); 
}

void moveLipsTurq()
{
 lipsturqy = lipsturqy + lipsturqSpeed;
  if(lipsturqy > height)
   {
    lipsturqSpeed = -lipsturqSpeed;
   }
  else if (lipsturqy< 0)
   {
    lipsturqSpeed = -lipsturqSpeed;
   } 
}

void drawLipsTurq(float lipsturqx, float lipsturqy, float lipsturqSize)
{
 
  image(lipsturq, lipsturqx, lipsturqy, lipsturqSize, lipsturqSize); 
}

void keyPressed()
{
 if (key =='b')
  {
   //lipsSpeed=lipsSpeed+5;
   lipsturqSize = lipsturqSize*2;
   lipslimeSize=lipslimeSize*1.5;
   lipscherrySize=lipscherrySize*3;
   lipsdarkcherrySize=lipsdarkcherrySize*4;
   
  } 
  else if (key =='s')
  {
    lipsturqSize = lipsturqSize/2; 
    lipslimeSize=lipslimeSize/1.5;
   lipscherrySize=lipscherrySize/3;
   lipsdarkcherrySize=lipsdarkcherrySize/4;
  }
  else if (key ==' ')
  {
    //lipspurpleSpeed=lipspurpSpeed+5;
    lipsSpeed=lipsturqSpeed/2;
  }
}

void drawLipsPurp(float lipspurplex, float lipspurpley, float lipspurpleSize)
{
 
  image(lipspurple, lipspurplex, lipspurpley, lipspurpleSize, lipspurpleSize); 
}

void moveLipsPurp()
{
 lipspurpley = lipspurpley + lipspurpleSpeed;
  if(lipspurpley > height)
   {
    lipspurpleSpeed = -lipspurpleSpeed;
   }
  else if (lipspurpley< 0)
   {
    lipspurpleSpeed = -lipspurpleSpeed;
   } 
}

void drawLipsCherry(float lipscherryx, float lipscherryy, float lipscherrySize)
{
 
  image(lipscherrypink, lipscherryx, lipscherryy, lipscherrySize, lipscherrySize); 
}

void moveLipsCherry()
{
 lipscherryy = lipscherryy + lipscherrySpeed;
  if(lipscherryy > height)
   {
    lipscherrySpeed = -lipscherrySpeed;
   }
  else if (lipscherryy< 0)
   {
    lipscherrySpeed = -lipscherrySpeed;
   } 
}

void drawLipsDarkCherry(float lipsdarkcherryx, float lipsdarkcherryy, float lipsdarkcherrySize)
{
 
  image(lipspurple, lipspurplex, lipspurpley, lipspurpleSize, lipspurpleSize); 
}

void moveLipsDarkCherry()
{
 lipspurpley = lipsdarkcherryy + lipsdarkcherrySpeed;
  if(lipsdarkcherryy > height)
   {
    lipsdarkcherrySpeed = -lipsdarkcherrySpeed;
   }
  else if (lipsdarkcherryy< 0)
   {
    lipsdarkcherrySpeed = -lipsdarkcherrySpeed;
   } 
}

void drawLipsLime(float lipslimex, float lipslimey, float lipslimeSize)
{
 
  image(lipslimegreen, lipslimex, lipslimey, lipslimeSize, lipslimeSize); 
}

void moveLipsLime()
{
 lipslimey = lipslimey + lipslimeSpeed;
  if(lipslimey > height)
   {
    lipslimeSpeed = -lipslimeSpeed;
   }
  else if (lipslimey< 0)
   {
    lipslimeSpeed = -lipslimeSpeed;
   } 
}



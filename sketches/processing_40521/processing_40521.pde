
//location
//timing
float posX;
float posY;
float veloX;
float veloY;
PImage troll;

// OHHHH face
float ohX;
float ohY;
float ohveloX;
float ohveloY;
PImage oh;

PImage rage;

int trolled;


void setup()
{
  
  size(400, 400);
  fill(255);
  textAlign(CENTER);
  textSize(10);
  troll = loadImage("Trollface.png");
  posX = random(width);
  posY = random(height);
  veloX = 2;
  veloY = 2;
  image(troll, posX, posY);
  oh = loadImage("Oface.png");
  ohX = (width/2) - (oh.width/2);
  ohY = (height/2) - (oh.height/2);
  image(oh, ohX, ohY);
  ohveloX = 0;
  ohveloY = 0;
  rage = loadImage("rage.jpg");
  trolled = 0;
 
}

void draw()
{
  noCursor();
  background(0);
  frameNormal();
 drawSomething();
 collision();
 oFace();
 centerOh();
 displayNumbers();
 moveOh();
 ohNO();
 trolledRage();

 
 
}

void frameNormal()
{
 frameRate(60); 
}

void drawSomething()
{
  posX = posX + veloX;
  posY = posY + veloY;
  image(troll, posX, posY);
  

}
  
void collision()
{
 if (posX >= width - troll.width)
 {
   if (veloX > 0)
   {
     veloX = -veloX;
   }
 }
 if (posY >= height - troll.height)
 {
   if (veloY > 0)
   {
    veloY = -veloY;
   } 
 }
 if (posX <= 0)
 {
  veloX = -veloX; 
 }
 if (posY <= 0)
 {
   veloY = -veloY;
 }

}

void oFace()
{
 image(oh, ohX, ohY); 
}

void centerOh()
{
 if (key == ' ')
{
  ohX = (width/2) - (oh.width/2);
  ohY = (height/2) - (oh.height/2);
  ohveloX = 0;
  ohveloY = 0;
} 
}

void moveOh()
{
  ohX = ohX + ohveloX;
  ohY = ohY + ohveloY;
  if (keyCode == UP)
  {
   ohveloY = ohveloY - .01; 
  }
  else if (keyCode == DOWN)
  {
    ohveloY = ohveloY + .01;
  }
  else if (keyCode == RIGHT)
  {
    ohveloX = ohveloX + .01;
    
  }
  else if (keyCode == LEFT)
  {
   ohveloX = ohveloX - .01; 
  }
}

void displayNumbers()
{
  fill(255);
  
    text("Elapsed Time?! " + millis()/1000, width/2, height*.9);
    text("X VELOCITY?!" + ohveloX, width/2, 20);
    text("Y VELOCITY?!" + ohveloY, width/2, 35);
    text("HOW MUCH DID I RAGE?" + trolled, width/2, 50);
    text("N0o0Oo! GET AWAY FROM ME TROLL!!", width/2, height/2);
}

void ohNO()
{
 if (ohX > width || ohX + oh.width<0 || ohY > height || ohY + oh.height < 0) 
 {
 
 fill(0);
 rect(width/4, height/2.2, width/2, height/8);
 fill(255);
 line(posX + (troll.width/2), posY + (troll.height/2), ohX, ohY);
 text("OHH!!!!!! OH I'M" + (int)(dist(posX, posY, ohX, ohY)) + "FROM TROLL", width/2, height/2);
 text("DON'T PRESS SPACEBAR I DUN LYK TROLL", width/2, ((height/2) + 10));
 text("8O!!!!", width/2, ((height/2) + 20));
 }
}

void trolledRage()
{
 if (dist(ohX, ohY, posX, posY) < oh.width)
{
  frameRate(1);
  rageFace();
  trolled = trolled + 1;
  posX = random(width);
  posY = random(height);
  ohveloX = 0;
  ohveloY = 0;
  veloX = veloX + .05;
  veloY = veloY + .05;
} 
}
void rageFace()
{
  image(rage, 0, 0);
}


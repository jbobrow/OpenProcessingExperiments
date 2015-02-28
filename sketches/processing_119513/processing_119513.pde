
//AKolosky HW7
//Copyright: Angela Kolosky, Pittsburgh, PA, 2013.

//Credits: Ocean Wave Sound and Underwater Pool Sound: Mike Koenig
//Credits: Wave Crashing: SoundBible.com
//Credits: Tenticle: Kate Gruen...modifed by use in Adobe Photoshop
//Images created in Adobe PhotoShop

//Game: Avoid the crashing wave or risk sinking your ship
//Hint: rogue waves can come from any direction!
//Controls: Steer your ship with the the arrow keys but remember you're fighting both the wind and tide!

PImage ocean, underwater, ship, wave, kraken;
float shipX,shipY,shipDX,shipDY;
float waveX, waveY,waveDX,waveDY;
float szship,szwave;
float underwaterX,underwaterY, underwaterDY;

int hits;



void setup()
{
 size(600,400);
 
 shipX= random(25,400);
 shipY= random(25,400);
 shipDX= 2;
 shipDY= 2;
 
 waveX= random(10,600);
 waveY= random(10,400);
 waveDX=6;
 waveDY=6;
 
 ocean = loadImage ("ocean.jpg");
 underwater = loadImage ("underwater.jpg");
 ship = loadImage ("ship.png");
 wave = loadImage ("wave.png");
 kraken = loadImage ("kraken.png");
 
 szship = 75;
 szwave = 75;
 
 underwaterX = 0;
 underwaterY = 400;
 underwaterDY = 5;
}

void draw()
{
 OCEANscreen();
 showStats(); 
 sinkShip();
 showShip();
   moveShip();
 showWave();
   moveWave();
 checkCollision();
}

void sinkShip()
{
  if (hits>=50)
  {shipDX=0;
    if (shipY == width*.75)
    {shipDY=0;
    }
  
  waveDX=0;
  waveDY=0;
  waveX=700;
  waveY=500;
  
  imageMode(CORNER);
  image (underwater,underwaterX,underwaterY,width,height);
  underwaterY-=underwaterDY;
    if (underwaterY == 0)
    {underwaterDY=0;
    underwaterY=0;
    }
  
  fill(255);
  textMode(CENTER);
  textSize(50);
  text("Your ship has sunk!",width*.5,height*.5);
  }
}

void showStats()
{
  fill(255);
  textAlign(CENTER);
  textSize(10);
  text("Damage: "+hits,width*.5,height*.95);
  text("Time: "+millis()/1000,width*.5,height*.9);  
}

void checkCollision()
{
  float d =dist(shipX,shipY,waveX,waveY);
  float colDist =szship/2+szwave/2;
  if (d<= colDist)
  {
    hits = hits +1;
    imageMode(CORNER);
    pushMatrix();
    tint(255,125);
    image (kraken,0,0,width,height);
    popMatrix();
    textMode(CENTER);
    textSize(60);
    fill(255,0,0);
    text("AHHH KRAKEN!",width*.5,height*.5);
    shipDX=-shipDX;
    shipDY=-shipDY;
  }
}

void moveWave()
{
  waveY+=waveDY;
    if (waveY>height)
    {waveY=random(10,350);
    waveX=random(10,550);
    }
  waveX+=waveDX;
    if(waveX>width)
    {waveX=random(10,600);
    waveY=random(10,350);
    }
}

void showWave()
{
  image (wave,waveX,waveY);
}

void keyPressed()
{
  if (keyCode == RIGHT)
  {shipX=shipX+3;
  }
  if (keyCode == LEFT)
  {shipX=shipX-3;
  }
  if (keyCode == DOWN)
  {shipY=shipY+3;
  }
  if (keyCode == UP)
  {shipY=shipY-3;
  }
}

void moveShip()
{
   if (hits < 50)
   {
     shipX+= shipDX;
     if (shipX>width ||shipX<0)
       {
         shipDX=-shipDX;
       }
     shipY+= shipDY;
     if (shipY>height ||shipY<0)
       {
         shipDY=-shipDY;
       }
   }
}

void showShip()
{
  imageMode(CENTER);
  image (ship,shipX,shipY);
}

void OCEANscreen()
{
  imageMode(CORNER);
  image (ocean,0,0,width,height);
}




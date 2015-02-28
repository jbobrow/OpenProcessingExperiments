
PImage Sunset;
PImage Birds;
PImage Birdsright;
int birdsTint;
int sunsetTint;
int birdsX;
int birdsY;
int birdsrightX;
int birdsrightY;
float redsuntint = map(255,birdsX,600,-100,birdsY);
int greensuntint;
int bluesuntint;


void setup()
{
  Sunset = loadImage("Sunset.jpg");
  Birds = loadImage("Birds.png");
  Birdsright = loadImage("Birdsright.png");
  size(500,500);
  noStroke(); smooth();
  background(255);
  birdsX = -250;
  birdsY = 450;
  birdsrightX =500;
  birdsrightY =500;
  greensuntint = 0;
  bluesuntint = 0;
  
}

void draw()
{
  birdsY = birdsY - int (random(1,3));
  birdsX = birdsX + int (random(1,3));
  drawSunset();
  drawBirds();
  redsuntint = birdsX;
  greensuntint = greensuntint + 1;
  bluesuntint = bluesuntint + 3;
   if (greensuntint > 50) {
     greensuntint = 50;
   }
   if (bluesuntint > 100) {
     bluesuntint = 100;
   }
   if (birdsX > 450) {
    birdsX = -250;
    birdsY = 450;
    greensuntint = 0;
    bluesuntint = 0;
  }
}

void drawBirds()
{
  pushMatrix();
  image(Birds,birdsX,birdsY,300,300);
  popMatrix();
  }

void drawSunset()
{
  pushMatrix();
  image(Sunset,0,0,width,height);
  tint(redsuntint,greensuntint,bluesuntint);
  popMatrix();
}


 


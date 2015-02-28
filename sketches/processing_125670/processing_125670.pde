
// hw 10
// Copyright Melissa Mak, December 2013, Pittsburgh, PA
// data and images sourced from: http://www.allthesky.com/constellations/julaug.html

int phase;
float [ ] names = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
PImage [ ] imageArray;
PImage p;

void setup()
{
 size (400, 400);
 rectMode(CENTER);
 textAlign(CENTER, CENTER);
 textSize(10);
 imageMode(CENTER);
 phase = 0;


 imageArray = new PImage[12];
 for(int i = 1; i <=11; i++)
 {
   if (i<11)
   imageArray[i] = loadImage(i + ".jpg");
   else
   imageArray[i] = loadImage(i + ".jpg");
 }
}
 
void draw()
 {
   background(0);
   drawConstellations();
 }
 
void drawConstellations()
{
  if (phase == 0)
  {
  fill(255);
  text("CONSTELLATIONS", 200, 200); 
  text("July – August", 200, 250);
  text("Normal views with about 39 x 36 degrees field of view", 200, 300);
  }
  if (phase == 1)
  {
  p = imageArray[1];
    image (p, 200, 200);
    fill(255);
    text ("DRACO", 200, 325);
  }
  
  if (phase == 2)
  {
  p = imageArray[2];
    image (p, 200, 200);
    fill(255);
    text ("CYGNUS AND LYRA", 200, 325);
  }
  
  if (phase == 3)
  {
  p = imageArray[3];
    image (p, 200, 200);
    fill(255);
    text ("VULPECULA AND SAGITTA", 200, 325);
  }
  
  if (phase == 4)
  {
  p = imageArray[4];
    image (p, 200, 200);
    fill(255);
    text ("AQUILA", 200, 350);
  }
  
  if (phase == 5)
  {
  p = imageArray[5];
    image (p, 200, 200);
    fill(255);
    text ("CAPRICORNUS", 200, 325);
  }
  
  if (phase == 6)
  {
  p = imageArray[6];
    image (p, 200, 200);
    fill(255);
    text ("SCUTUM AND SERPENS (CAUDA)", 200, 350);
  }
  
  if (phase == 7)
  {
  p = imageArray[7];
    image (p, 200, 200);
    fill(255);
    text ("SAGITTARIUS", 200, 325);
  }
  
   if (phase == 8)
  {
  p = imageArray[8];
    image (p, 200, 200);
    fill(255);
    text ("CORONA AUSTRALIS AND TELESCOPIUM", 200, 350);
  }
  
  if (phase == 9)
  {
  p = imageArray[9];
    image (p, 200, 200);
    fill(255);
    text ("TRIANGULUM AUSTRALE, NORMA AND ARA", 200, 350);
  }
  
  if (phase == 10)
  {
  p = imageArray[10];
    image (p, 200, 200);
    fill(255);
    text ("PAVO", 200, 325);
  }
  if (phase == 11)
  {
  p = imageArray[11];
    image (p, 200, 200);
    fill(255);
    text ("APUS AND OCTANS", 200, 325);
  }
}

void keyPressed()
{
  if (phase <12) phase++;
}



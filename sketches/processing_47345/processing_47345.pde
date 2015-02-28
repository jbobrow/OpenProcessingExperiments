
final int MAX = 12;
int sw = 33; //square width
float sh = 20; //square height
float st = 200.00; //start point
float [] xlocations = {st, st + sw, st + 2*sw, st + 3*sw, st + 4*sw, st + 5*sw, st + 6*sw, st + 7*sw, st + 8*sw, st + 9*sw, st + 10*sw, st + 11*sw};

PImage [] syn;
PImage [] hunt;
PImage [] clpgh;

void setup()
{
 size (800,470);
 
syn = new PImage[MAX];
hunt = new PImage[MAX];
clpgh = new PImage[MAX];
initializeArrays();
}



void initializeArrays()
{
 for (int i = 0; i < syn.length; i++)
  {
  String synName = "SYN" + (i+1) + ".jpg";
  syn[i] = loadImage(synName);
  
  String huntName = "HUNT" + (i+1) + ".jpg";
  hunt[i] = loadImage(huntName);
  
  String clpghName = "CLPGH" + (i+1) + ".jpg";
  clpgh[i] = loadImage(clpghName);

  }

}

void draw()
{
 
background(0);
 
SYNsquares();
CLPGHsquares();
HUNTsquares();
displayImage();
  
}

void SYNsquares()
{
  text("Synagogue", 130, 365);
  float y = 350;
  for (int i = 0; i < xlocations.length; i++)
 {
  fill(200); 
  rect(xlocations[i], y, sw, sh);
 } 
}

void CLPGHsquares()
{
  text("Public Library", 110, 405);
  float y = 390;
  for (int i = 0; i < xlocations.length; i++)
 {
  fill(200); 
  rect(xlocations[i], y, sw, sh);
 } 
}

void HUNTsquares()
{
  text("Carnegie Mellon", 95, 445);
  float y = 430;
  for (int i = 0; i < xlocations.length; i++)
 {
  fill(200); 
  rect(xlocations[i], y, sw, sh);
 } 
}


void displayImage()
{
 
for (int i = 0; i < syn.length; i++)
{
  
  //SYNOGAGUE PHOTOS
  if( mouseY > 350 && mouseY < 370)
  {
    if (mouseX > 200 && mouseX < 596)
    {
      int index = (mouseX-200)/sw;
      image( syn[index], 200, 20); 
    }  
  } 
  
 //CLPGH PHOTOS
   if( mouseY > 390 && mouseY < 410)
  {
    if (mouseX > 200 && mouseX < 596)
    {
      int index = (mouseX-200)/sw;
      image( clpgh[index], 200, 20); 
    }   
  } 
  
 //HUNT PHOTOS
 if( mouseY > 430 && mouseY < 450)
  {
    if (mouseX > 200 && mouseX < 596)
    {
      int index = (mouseX-200)/sw;
      image( hunt[index], 200, 20); 
    }   
  } 
  

}
}


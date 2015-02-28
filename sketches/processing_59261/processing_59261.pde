
//Drop[] myDrops;

PImage cloudTree;
int side,a;

final int numDropsAtTheBeginning = 3; // how many you have at the beginning
final int numDropsInTotal = 3000;  // how many you can have in total till program crashes
int numDropsAtTheMoment = 0;  // how many you have now

Drop[] myDrops = new Drop[numDropsInTotal];

void setup()
{
  smooth();
  side = 430;
  a=10;
  size(433, 450);
  
  //frameRate(30);
  cloudTree = loadImage("background.jpg");
  
  for (int i = 0; i < numDropsAtTheBeginning ; i++)
  {
      myDrops[i] = new Drop( random(80,320), random(220,240) );
  }
  
  numDropsAtTheMoment=numDropsAtTheBeginning;
  
  noStroke();
}
 
void draw()
{
  background(cloudTree);
  
  for (int i = 0; i < numDropsAtTheMoment ; i++)
  {
    myDrops[i].repeatDraw();
  }
 
  noStroke();

}
void keyPressed()
{
  if (key == ' ')
  {
      myDrops[numDropsAtTheMoment] = new Drop( random(80,320), random(220,240) );
 
      for (int i = 0; i < numDropsAtTheMoment ; i++)
      {
        myDrops[i].rain(side);
      }
      
      numDropsAtTheMoment++;
  }
}



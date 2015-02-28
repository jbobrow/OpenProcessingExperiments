
public flower[][] flowerArray = new flower[10][10];

void setup()
{
  size(640,480);
  background(0,100,0);
  for(int i = 0; i <10; i++)
    {
       for(int j = 0; j <10; j++)
         {
           flowerArray[i][j] = new flower();
           flowerArray[i][j].locX = i;
           flowerArray[i][j].locY = j;
           flowerArray[i][j].createFlower();
           
         }
    }
}

class flower
{
  int locX;
  int locY;
  float centerSizeX;
  float centerSizeY;
  float numberOfPetals;
  float colorOfPetalsR;
  float colorOfPetalsG;
  float colorOfPetalsB;
   
  void createFlower()
  {
  
   
   numberOfPetals = random(3,13);
   
   centerSizeX = random(48/numberOfPetals,24);
   centerSizeY = centerSizeX;
   
   colorOfPetalsR = random(255);
   colorOfPetalsG = random(255);
   colorOfPetalsB = random(255);
  }
  
  
  void drawCenter()
  {
     stroke(0);
     fill(255,255,50);
     ellipse(locX * 64 + 32, locY * 48 + 24, centerSizeX,centerSizeY);
  }
  void drawPetals()
  {
    stroke(colorOfPetalsR/2,colorOfPetalsG/2,colorOfPetalsB/2);
    int aPetal = 0;
    fill(colorOfPetalsR,colorOfPetalsG,colorOfPetalsB);
    for(int i = 0; i < numberOfPetals; i++)
    {
      pushMatrix();
      translate(locX * 64 + 32,locY * 48 + 24);
      rotate((PI/numberOfPetals) * aPetal);
      ellipse(0,0,48/numberOfPetals, 48);
      popMatrix();
      aPetal++;
    }
  }
}

void draw()
{
  
  for(int i = 0; i < 10; i++)
  {
    for(int j = 0; j <10; j++)
    {
       flowerArray[i][j].drawPetals();
       flowerArray[i][j].drawCenter();
      
    }
  }
}



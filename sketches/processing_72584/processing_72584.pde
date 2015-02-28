
//source http://codelikezell.com/create-a-sick-game-with-processing/

PFont fontA;
  int sphereDiameter = int(random(15,30));
  boolean shoot = false;
  
  int randx()
  {
    return int(random(600));
  }
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(),randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx(), randx()};
  int[] sphereYCoords = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
  
  void setup()
  {
    size(600,620);
  }
  
  void draw()
  {
    int a = int(random(0,620));
    int b = int(random(0,620));
    int c = int(random(0,620));
    int d = int(random(0,620));
    rect(a,b,c,d);
    fill(color(0,255,0));
    stroke(color(0,255,0));
    triangle(mouseX-15, mouseY+25, mouseX+15, mouseY+25, mouseX, mouseY);
    fill(color(255,0,0));
    stroke(color(255,0,0));
  
    if(shoot==true)
    {
      sphereKiller(mouseX);
      shoot = false;
    }
  
    sphereDropper();
    gameEnder();  
  }
  
  void mousePressed()
  {
    shoot = true;
  }
  
  void sphereDropper()
  {  
    stroke(random(0,255),random(0,255),random(0,255));
    fill(random(0,255),random(0,255),random(0,255));
    for (int i=0; i<13; i++)
    {
      if(sphereXCoords[i]==620)
      {
      sphereXCoords[i]=0;
      }
      if(sphereYCoords[i]==620)
      {
      sphereYCoords[i]=0;
      }
      ellipse(sphereXCoords[i]++, sphereYCoords[i]+=5,
              sphereDiameter, sphereDiameter);
    }
  }
  
  void sphereKiller(int shotX)
  {
    boolean hit = false;
    for (int i = 0; i < 13; i++)
    {
      int sphereDiameter = int(random(15,30));
      if((shotX >= (sphereXCoords[i]-sphereDiameter)) && 
         (shotX <= (sphereXCoords[i]+sphereDiameter)))
      {
        hit = true;
        line(mouseX, 565, mouseX, sphereYCoords[i]);
        ellipse(sphereXCoords[i], sphereYCoords[i],
                sphereDiameter+25, sphereDiameter+25);
        sphereXCoords[i] = randx();
        sphereYCoords[i] = 9;
      }    
    }
  
    if(hit == false)
    {
      line(mouseX, 565, mouseX, 0);
    }  
  
  }
  
  void gameEnder()
  {
    for (int i=0; i< 5; i++)
    {
      if(sphereYCoords[i]==600)
      {
       sphereYCoords[i]=560;
      }
    }
  }

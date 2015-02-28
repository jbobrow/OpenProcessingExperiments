
PFont fontA;
  int sphereDiameter = 10;
  boolean shoot = false;
  
  int randx()
  {
    return int(random(600));
  }
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(), randx() };
  int[] sphereYCoords = { 0, 0, 0, 0, 0 };
  
  void setup()
  {
    size(480,800);
    smooth();
  }
  
  void draw()
  {
    background(255);
    fill(color(188,15,15));
    stroke(color(0));
    triangle(mouseX-8, 580, mouseX+8, 580, mouseX, 565);
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
    stroke(255);
    fill(0);
    for (int i=0; i<5; i++)
    {
      ellipse(sphereXCoords[i], sphereYCoords[i]++,
              sphereDiameter, sphereDiameter);
    }
  }
  
  void sphereKiller(int shotX)
  {
    boolean hit = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (sphereXCoords[i]-sphereDiameter/2)) && 
         (shotX <= (sphereXCoords[i]+sphereDiameter/2)))
      {
        hit = true;
        line(mouseX, 565, mouseX, sphereYCoords[i]);
        ellipse(sphereXCoords[i], sphereYCoords[i],
                sphereDiameter+50, sphereDiameter+50);
        sphereXCoords[i] = randx();
        sphereYCoords[i] = 0;
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
        fill(color(255,0,0));
        noLoop();
      }
    }
  }


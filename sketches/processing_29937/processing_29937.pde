


PFont fontA;
  int sphereDiameter = 50;
  boolean shoot = false;
PImage ceu;  
  int randx()
  {
    return int(random(600));
  }
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(), randx() };
  int[] sphereYCoords = { 0, 0, 0, 0, 0 };
  
  void setup()
  {
    size(600,620); 
   ceu = loadImage("ceu.png"); 
    

}
  
  void draw()
  {
   
    
    background(ceu);

    fill(color(255,0,0));
    stroke(color(255,0,0));
    triangle(mouseX-8, 600, mouseX+8, 600, mouseX, 550);
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
    stroke (random(255));
    fill (random(255));
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
                sphereDiameter+25, sphereDiameter+25);
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


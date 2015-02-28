
//Shooting Pigs 
//Charles, Sean, Daniel, Alyssa 

PImage pic; //tank
PImage pig;
PImage back;

PFont fontA;
  int sphereDiameter = 35;
  boolean shoot = false;
  
  int randx()
  {
    return int(random(500));
  }
  
  int[] sphereYCoords = {randx(), randx(), randx(), randx(), randx()};
  int[] sphereXCoords = {randx(), randx(), randx(), randx(), randx() };
  
  void setup()
  {
    frameRate(130);
    size(700,700);
    pic = loadImage("Tank.png");
    pig = loadImage("Pig.png");
    back = loadImage("background.jpg");
  
}
  
  void draw()
  {
    background(back);
    loadPixels();
    fill(color(0,255,0));
    stroke(color(0,255,0));
    //triangle(mouseX-8, 680, mouseX+8, 680, mouseX, 665);
    //image(pic, 0, 0);
    image(pic, mouseX-8, 580);
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
    fill(255);
    for (int i=0; i<5; i++)
    {
      image(pig, sphereXCoords[i]++, sphereYCoords[i],
              sphereDiameter, sphereDiameter);
      //ellipse(sphereXCoords[i]++, sphereYCoords[i],
              //sphereDiameter, sphereDiameter);
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
                sphereDiameter+35, sphereDiameter+35);
        sphereXCoords[i] = 0;
        sphereYCoords[i] = randx ();
      }    
    }
  
    if(hit == false)
    {
      line(mouseX, 0, mouseX, 600);
    }  
  
  }
  
  void gameEnder()
  {
    for (int i=0; i< 5; i++)
    {
      if(sphereXCoords[i]==700)
      {
        fill(color(255,0,0));
        noLoop();
      }
    }
  }



PFont LiSong;
PImage universe;
String instructions = "Click to shoot down the spaceships!";

  int sphere = 10;
  boolean shoot = false;
  
  int randx()
  {
    return int(random(400));
  }
  
  int[] sphereXCoords = { randx(), randx(), randx(), randx(), randx() };
  int[] sphereYCoords = { 0, 0, 0, 0, 0 };
  
  void setup()
  
  {
    size(600,400);
    LiSong = loadFont ("LiSongPro-48.vlw");
    universe = loadImage("universe.jpg");
  }
  
  void draw()

  {  image (universe, 0, 0);
    fill(color(0,255,0));
    noStroke();
    fill(color(255,0,0));
    stroke(color(255,0,0));
  
    if(shoot==true)
    {
      sphereKiller(mouseX);
      shoot = false;
    }
  
    droppers();
   
     fill(255); 
    textFont(LiSong, 32);
    text(instructions, 10, 10, 200, 300);
    
  }
  
  void mousePressed()
  {
    shoot = true;
  }
  
  void droppers()
  {  
    noStroke();
    fill(187,189,192);
    for (int i=0; i<5; i++)
    {
      ellipse(sphereXCoords[i], sphereYCoords[i]++,
              sphere, sphere);
    }
  }
  
  void sphereKiller(int shotX)
  {
    boolean hit = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (sphereXCoords[i]-sphere/2)) && 
         (shotX <= (sphereXCoords[i]+sphere/2)))
      {
        hit = true;
        line(mouseX, 400, mouseX, sphereYCoords[i]);
        sphereXCoords[i] = randx();
        sphereYCoords[i] = 0;
      }    
    }
  
     if(hit == false)
    {
      line(mouseX, 565, mouseX, 0);
    }
  
  }
  

  
  




PFont fontA;
  int ballDiameter = 25;
  boolean shoot = false;
  boolean gameEnder= false;
  
  PFont f;
  int randx()
  {
    return int(random(600));
  }
   //How often the cordinates follow
  int[] ballXCoords = { randx(), randx(), randx(), randx(), randx() };
  int[] ballYCoords = { 0, 0, 0, 0, 0 };
  
  void setup()
  {
    //size of the frame
    size(600,620);
    f = createFont("Arial",12,true); 
    // A font to write text on the screen
     textFont(f,48);

 
    textAlign(CENTER);
  }
  
  void draw()
  
  
  {
    //What is going to be shown in the game
    background(34,23,67);
    noStroke();
    triangle(mouseX-60, 580, mouseX+60, 580, mouseX, 520);
    fill(color(0,0,0));
    stroke(color(255,0,25));
    
    
    if(gameEnder){
   
    fill(random(255));
  
  } else{
    text("GOODLUCK!",width/2,height/2);
  
  }

    
  
    if(shoot==true){//setting up a boolean

      sphereKiller(mouseX);
      shoot = false;
    }
  
    ballDropper();
    gameEnder();  
  }
  
  void mousePressed()//If the mouse is pressed, send of the sphere killer
  {
    shoot = true;
  }
  
  void ballDropper()//rate at which the spheres drop
  {  
    noStroke();
    fill(random(23,250.23));
    for (int i=0; i<5; i++)
    {
      ellipse(ballXCoords[i], ballYCoords[i]++,
              ballDiameter, ballDiameter);
    }
  }
  
  void sphereKiller(int shotX)
  {
    boolean hit = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (ballXCoords[i]-ballDiameter/2)) && 
         (shotX <= (ballXCoords[i]+ballDiameter/2)))
      {
        hit = true;
        line(mouseX, 565, mouseX, ballYCoords[i]);
        ellipse(ballXCoords[i], ballYCoords[i],
                ballDiameter+25, ballDiameter+25);
        ballXCoords[i] = randx();
        ballYCoords[i] = 0;
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
      if(ballYCoords[i]==600)
      {
        gameEnder=true; 
        fill(color(0));
        noLoop();
        background(255);
        text("GAME OVER",width/2,height/2);
      }
    }
  }



//initialise score variable
int score;
int ballSize = 500;
  boolean fire = false;
   
  //Initialise gameOver variable
 int gameOver = 200;
  
 //int startGame;
  int getRandomX()
   
   
 // int score;
  {
    return int(random(600));
  }
   
  int[] ballx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
  int[] bally = { 0, 0, 0, 0, 0 };
   
  void setup()
  {
     
    //Size
    size (900, 500);
    smooth ();
     
  }
   
  void draw()
  {
 
   //Game Style
    
   background (0);
    fill(#FF8D00);
    stroke (255);
    triangle(mouseX-8, 480, mouseX+8, 480, mouseX, 565);
    // display score
    fill(255);
    text("Balls Shot " + score, 20,20);
    text("Hitmarkers Earned: " + score + "LOL your Bad Kid", 400, 20);
    if(fire)
    {
      cannon(mouseX);
      fire = false;
    }
   
     ballFalling();
     gameFinish(); 
  }
  
  //Play the game
   
  
  void mousePressed()
  {
    fire = true;
  }
   
  void ballFalling()
  { 
    stroke(39, 154, 240);
    fill (#FC082C);
     
    for (int i=0; i<5; i++)
    {
      ellipse(ballx[i], bally[i]++, ballSize, ballSize);
    }
  }
   
  void cannon(int shotX)
  {
    boolean strike = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
        strike = true;
        line(mouseX, 565, mouseX, bally[i]);
        ellipse(ballx[i], bally[i],
                ballSize+500, ballSize+500);
        ballx[i] = getRandomX();
        bally[i] = 0;
 
 
// update score
        score++;
      }   
    }
   
    if(strike == false)
    {
      line(mouseX, 565, mouseX, 0);
    } 
   
  }
   
   
  //GameOver
   
  void gameFinish()
  {
    for (int i=0; i< 5; i++)
    {
      if(bally[i]==530)
      {
 
     
        fill(color(255,0,0));
     fill(255, 255, 0);
    textAlign(CENTER);
    text("You lost!", width/2, height/2);
    text("You rekted : "+ score + " balls", width/2, height/2 + 50);
       
     noLoop();
 
   
       }
      }
    }

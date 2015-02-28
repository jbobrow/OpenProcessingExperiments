
//initialise score variable
int score;
int ballSize = 20;
  boolean fire = false;
   
  //Initialise gameOver variable
 int gameOver = 0;
  
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
    
size(500,500);
background(22,108,102);
 
//Body
smooth();
fill(0,0,0);
ellipse(350,450,75,95);
fill(255,255,255);
noStroke();
ellipse(350,475,40,45);
noStroke();
 
//Eyes
fill(255,255,255);
ellipse(339,420,20,24);
ellipse(365,420,20,24);
fill(0,0,0);
ellipse(340,420,2,5);
fill(0,0,0);
ellipse(365,420,2,5);
 
//Feet
fill(255,239,62);
ellipse(323,495,30,20);
fill(255,239,62);
ellipse(380,495,30,20);
 
//Mouth
fill(355,439,62);
ellipse(350,440,20,20);
 
//Arms
fill(0,0,0);
ellipse(395,450,20,20);
fill(0,0,0);
ellipse(305,450,20,20);
 
    // display score
    fill(255);
    text(score, 20,20);
    if(fire)
    {
      penguin(mouseX);
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
    fill (255, 255, 255);
     
    for (int i=0; i<5; i++)
    {
      ellipse(ballx[i], bally[i]++, ballSize, ballSize);
    }
  }
    
 void penguin(int shotX)
  {
    boolean strike = false;
    for (int i = 0; i < 5; i++)
    {
      if((shotX >= (ballx[i]-ballSize/2)) && (shotX <= (ballx[i]+ballSize/2))) {
        strike = true;
        line(mouseX, 565, mouseX, bally[i]);
        ellipse(ballx[i], bally[i],
                ballSize+25, ballSize+25);
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
     fill(255, 0, 0);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    text("Well done! Your score was : "+ score, width/2, height/2 + 50);
       
     noLoop();
 
   
       }
      }
    }




//initialise score variable
int score;
int ballSize = 30;
PImage throat;
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context
  boolean fire = false;
   
  //Initialise gameOver variable
 int gameOver = 0;
  
 //int startGame;
  int getRandomX()
   
   
 // int score;
  {
    return int(random(200,1100));
  }
   
  int[] ballx = { getRandomX(), getRandomX(), getRandomX(), getRandomX(), getRandomX() };
  int[] bally = { 0, 0, 0, 0, 0 };
   
  void setup()
  {
     
    //Size
    size (1280, 720);
    smooth ();
    throat = loadImage("throat.jpg");
    minim = new Minim(this);
    player = minim.loadFile("song.mp3", 2048);
    player.play();
     
  }
   
  void draw()
  {
 
   //Game Style
    
   image(throat, 0, 0);
    fill(255);
    stroke (255);
    triangle(mouseX-8, 700, mouseX+20, 700, mouseX, 700);
    // display score
    fill(255);
    text(score, 20,20);
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
    stroke(250,0,0);
    fill (71,64,49);
     
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
                ballSize+100, ballSize+100);
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
      if(bally[i]==700)
      {
 
     
        fill(color(255,0,0));
     fill(0, 0, 0);
     textSize(40);
    textAlign(CENTER);
    text("YOU LET ACID REFLUX DEFEAT YOU!", width/2, height/2 - 120);
    textSize(20);
    text("You failed to keep food from going back to the esophagus!!! Score : "+ score, width/2, height/2 - 50);
       
     noLoop();
 
   
       }
      }
    }

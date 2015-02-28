
/* @pjs preload= "b.jpg, Ball.png, Flaming_Ball.png, Rim_Bottom.png, Rim_Top.png"; */

PImage court = requestImage("b.jpg");
PImage fball = requestImage("Flaming_Ball.png");
PImage BRim = requestImage("Rim_Bottom.png");
PImage TRim = requestImage("Rim_Top.png");
PImage foul = requestImage("Foul.png");
int foulCount = 0;
int bonusCount = 0;
float gameTimer = 660;
int score = 0;
float iconTimer = 0;
Ball ball= new Ball();

void setup()
{
  size(700,800); 
}

void draw()
{
 imageMode(CENTER);
 image(court,width/2,height/2);
 image(TRim,mouseX - 5,430);
 fill(3,255,17);
 textSize(30);
 text("Score:" + score,20,100);
 textSize(40);
 text("Shot Clock:" + int(gameTimer/60),20,75);
 fill(0);
 
 gameTimer -= 1;
 if (gameTimer > 0)
  { 
   ball.render();
   if (bonusCount < 3)
   {
    ball.y += 14;
   }
   if (bonusCount >= 3)
   {
    ball.y += 16;
   }
   
   if (ball.y > height + 10)
    {
     ball.reset();
     iconTimer = 60;
     foulCount += 1;
     bonusCount = 0;
    } 
    
   if (ball.x > mouseX - 50 && ball.x < mouseX + 50 && ball.y > 420 && ball.y < 445)
    {
      foulCount = 0;
      ball.reset();
      score += ball.pointValue;
      bonusCount += 1;
    }
       
    image(BRim,mouseX, 458);
    
     if (iconTimer > 0)
    {
      if (foulCount == 1)
      {
      image(foul,250,325);
      }
      if (foulCount == 2)
      {
        image(foul,250,325);
        image(foul,375,325);
      }
      if (foulCount >= 3)
      {
        image(foul,250,325);
        image(foul,375,325);
        image(foul,500,325);
        score = 0;
      }
      iconTimer -= 2;
    }
  }
  if (gameTimer <= 0)
  {
    image(court,width/2,height/2);
    fill(3,255,17);
    textSize(80);
    text("Times Up!", width/2 - 175, height/2- 75);  
    textSize(50);
    text("Score: " + score, width/2 - 175, height/2 -25);
    fill(0);
    textSize(70);
    text("Click to Play Again!", width/2 -275, height/2 + 200);

    
    if(mousePressed == true)
    {
      gameTimer = 660;
      ball.reset();
      score = 0;
      foulCount = 0;
      bonusCount = 0;
    }
  }
    
}
  



class Ball
{
  float x = 350;
  float y = 0;
  PImage img = requestImage("Ball.png");
  PImage img2 = requestImage("Flaming_Ball.png");
  int pointValue = 0;
 
  void render()
  {
    if (bonusCount >= 3)
    {
      image(img2,this.x,this.y);
      this.pointValue = 15;
    }
    else
    {
    image(img,this.x,this.y);
    this.pointValue = 5;
    }
  }
  
  void reset()
  {
    this.y = 0;
    this.x = random(20,width - 20);
  }
}




float windowX = 600;
float windowY = 700;

float PlatW = 100;
float PlatH = 20;

float PlatX = random(windowX - PlatW);
float PlatY = 0;
float PlatX2 = random(windowX - PlatW);
float PlatY2 = 100;
float PlatX3 = random(windowX - PlatW);
float PlatY3 = 200;
float PlatX4 = random(windowX - PlatW);
float PlatY4 = 300;
float PlatX5 = random(windowX - PlatW);
float PlatY5 = 400;
float PlatX6 = random(windowX - PlatW);
float PlatY6 = 500;
float PlatX7 = random(windowX - PlatW);
float PlatY7 = 600;
float PlatX8 = random(windowX - PlatW);
float PlatY8 = 700;

float ballX = 100;
float ballY = windowY/3;
float h = 100;

float speedY = 2;
float speedX = 0;

boolean GameModeEasy = false;
boolean GameModeModerate = false;
boolean GameModeHard = false;
boolean GameModeExtream = false;

boolean GameStart = false;
boolean Menu = true;
boolean GameOver = false;

float dificultyTimer = 0;
float distance = 0;

float ground = 650;
float BH;
//----------------------------------------
SpriteObject Grass;
SpriteObject Grass2;
SpriteObject Stars;
SpriteObject Stars2;
SpriteObject Stars3;
SpriteObject Stars4;
SpriteObject Stars5;
SpriteObject Moon;
SpriteObject Clouds;
SpriteObject Clouds2;
SpriteObject Clouds3;
SpriteObject Clouds4;
SpriteObject Clouds5;
//----------------------------------------
void setup()
{
  player = new Audio("Cat.mp3");
  
  size(600, 700);
  frameRate(60);
  smooth();
  noStroke();
  ellipseMode(CENTER);
//--------------------------------------------------------------  
  Grass = new SpriteObject("grass-preview.png");
  Grass.x = 150;
  Grass.y = windowY - 75;
  Grass.s = .5;
  
  Grass2 = new SpriteObject("grass-preview.png");
  Grass2.x = width/2 + 150;
  Grass2.y = windowY - 75;
  Grass2.s = .5;
 //--------------------------------------------------------- Clouds 
  Clouds = new SpriteObject("clouds.png");
  Clouds.x = random(windowX);
  Clouds.y = 0;
  Clouds.s = 0.1;
  
  Clouds2 = new SpriteObject("clouds.png");
  Clouds2.x = random(windowX);
  Clouds2.y = 150;
  Clouds2.s = 0.1;
  
  Clouds3 = new SpriteObject("clouds.png");
  Clouds3.x = random(windowX);
  Clouds3.y = 300;
  Clouds3.s = 0.1;
  
  Clouds4 = new SpriteObject("clouds.png");
  Clouds4.x = random(windowX);
  Clouds4.y = 450;
  Clouds4.s = 0.1;
  
  Clouds5 = new SpriteObject("clouds.png");
  Clouds5.x = random(windowX);
  Clouds5.y = 600;
  Clouds5.s = 0.1;
 //---------------------------------------------------------end clouds
 //---------------------------------------------------------start stars
  Stars = new SpriteObject("stars.png");
  Stars.x = random(windowX);
  Stars.y = 0;
  Stars.s = 0.2;
  
  Stars2 = new SpriteObject("stars.png");
  Stars2.x = random(windowX);
  Stars2.y = 150;
  Stars2.s = 0.2;
  
  Stars3 = new SpriteObject("stars.png");
  Stars3.x = random(windowX);
  Stars3.y = 300;
  Stars3.s = 0.2;
  
  Stars4 = new SpriteObject("stars.png");
  Stars4.x = random(windowX);
  Stars4.y = 450;
  Stars4.s = 0.2;
  
  Stars5 = new SpriteObject("stars.png");
  Stars5.x = random(windowX);
  Stars5.y = 600;
  Stars5.s = 0.2;

//----------------------------------------------------------end Stars
  Moon = new SpriteObject("moon.png");
  Moon.x = 100;
  Moon.y = -50;
  Moon.s = 0.5;
  
//--------------------------------------------------------------
}

void draw()
{
  if(Menu == true)
  {
    background(0);
    
    fill(255);
    textSize(40);
    text("Cat Climb", width/2, 200);
    
    fill(255, 0, 0);
    ellipse(width/2, height/2, 200, 200);
    fill(255);
    textSize(50);
    text("START", width/2 - 80, height/2 + 20);
    
    textSize(20);
    text("Controls", 100, windowY - 100);
    textSize(15);
    text("Up Arrow (pressed) = allows player to increase speed while moving upwards", 25, windowY - 85);
    text("Right Arrow (held or pressed) = move right", 25, windowY - 70);
    text("Left Arrow (held or pressed) = move left", 25, windowY - 55);
    text("Down Arrow (held or pressed) = increase fall speed - causes higher bounce", 25, windowY - 40);
    
    if(mouseX >= width/2 - 100 && mouseX <= width/2 + 100)
    {
      if(mouseY >= height/2 - 100 && mouseY <= height/2 + 100)
        {
          fill(0, 255, 0);
          ellipse(width/2, height/2, 200, 200);
            
            if(mousePressed)
            {
              GameStart = true;
              Menu = false;
            }
        }
    }
  }
  
  if(GameStart == true)
  {
     player.play();

  background(0);
  
  //background----------------------------------------------
  //--------------------------------------------------------
  
  dificultyTimer += 0.0167;
  distance = BH;
  
  ground += .25;
  
  BH = ground - ballY;
  
  fill(255);
  textSize(40);
  text("distance: " + (int)distance, 50, 50);
  
  if(dificultyTimer >= 3)
  {
    if(ballY >= windowY - h/2)
    {
      GameOver = true;
    }
  }

  //-----------------------------------------------
  if(dificultyTimer >= 0 && dificultyTimer <= 30)
  {
    GameModeEasy = true;
  }
  if(dificultyTimer > 30)
  {
    GameModeEasy = false;
  }
//--------------------------------------------------  
    if(dificultyTimer >= 30 && dificultyTimer <= 60)
  {
    GameModeModerate = true;
  }
  if(dificultyTimer > 60 || dificultyTimer < 30)
  {
    GameModeModerate = false;
  }
//---------------------------------------------------
   if(dificultyTimer >= 60 && dificultyTimer <= 90)
  {
    GameModeHard = true;
  }
  if(dificultyTimer > 90 || dificultyTimer < 60)
  {
    GameModeHard = false;
  }
//---------------------------------------------------
   if(dificultyTimer >= 90)
  {
    GameModeExtream = true;
  }
  if(dificultyTimer < 90)
  {
    GameModeExtream = false;
  }
//---------------------------------------------------
  if(GameModeEasy == true)//GameModeEasy Starts
  {
  background(#55FFF2);
  fill(255);
  text("distance: " + (int)distance, 50, 50);
    
  Grass.render();
  Grass.y += .5;
  Grass2.render();
  Grass2.y += .5;
  
  Clouds.render();
   Clouds.y += .5;
   if(Clouds.y >= windowY)
   {
     Clouds.y = 0;
     Clouds.x = random(windowX);
   }
  Clouds2.render();
   Clouds2.y += .5;
    if(Clouds2.y >= windowY)
   {
     Clouds2.y = 0;
     Clouds2.x = random(windowX);
   }
  Clouds3.render();
   Clouds3.y += .5;
    if(Clouds3.y >= windowY)
   {
     Clouds3.y = 0;
     Clouds3.x = random(windowX);
   }
  Clouds4.render();
   Clouds4.y += .5;
    if(Clouds4.y >= windowY)
   {
     Clouds4.y = 0;
     Clouds4.x = random(windowX);
   }
  Clouds5.render();
   Clouds5.y += .5;
    if(Clouds5.y >= windowY)
   {
     Clouds5.y = 0;
     Clouds5.x = random(windowX);
   }
  
// platform
 //---------------------------------------------------------- 
  fill(255);
  
  PlatY += 1;
  
  rect(PlatX, PlatY, PlatW, PlatH);
  
  if(PlatY >= (windowY + PlatH))
  {
    PlatY = 0;
    PlatX = random(windowX - PlatW);
  }

  if(ballX >= PlatX && ballX <= (PlatX + PlatW))
  {
    if(ballY >= (PlatY - h/2) && ballY <= PlatY - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
 //-------------------------------------------------------- 
  fill(255);
  
  PlatY2 += 1;
  
  rect(PlatX2, PlatY2, PlatW, PlatH);
  
  if(PlatY2 >= (windowY + PlatH))
  {
    PlatY2 = 0;
    PlatX2 = random(windowX - PlatW);
  }

  if(ballX >= PlatX2 && ballX <= (PlatX2 + PlatW))
  {
    if(ballY >= (PlatY2 - h/2) && ballY <= PlatY2 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY2 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------------
  fill(255);
  
  PlatY3 += 1;
  
  rect(PlatX3, PlatY3, PlatW, PlatH);
  
  if(PlatY3 >= (windowY + PlatH))
  {
    PlatY3 = 0;
    PlatX3 = random(windowX - PlatW);
  }

  if(ballX >= PlatX3 && ballX <= (PlatX3 + PlatW))
  {
    if(ballY >= (PlatY3 - h/2) && ballY <= PlatY3 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY3 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //------------------------------------------------------
  
  fill(255);
  
  PlatY4 += 1;
  
  rect(PlatX4, PlatY4, PlatW, PlatH);
  
  if(PlatY4 >= (windowY + PlatH))
  {
    PlatY4 = 0;
    PlatX4 = random(windowX - PlatW);
  }

  if(ballX >= PlatX4 && ballX <= (PlatX4 + PlatW))
  {
    if(ballY >= (PlatY4 - h/2) && ballY <= PlatY4 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY4 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //-----------------------------------------------------
    
  fill(255);
  
  PlatY5 += 1;
  
  rect(PlatX5, PlatY5, PlatW, PlatH);
  
  if(PlatY5 >= (windowY + PlatH))
  {
    PlatY5 = 0;
    PlatX5 = random(windowX - PlatW);
  }

  if(ballX >= PlatX5 && ballX <= (PlatX5 + PlatW))
  {
    if(ballY >= (PlatY5 - h/2) && ballY <= PlatY5 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY5 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  fill(255);
  
  PlatY6 += 1;
  
  rect(PlatX6, PlatY6, PlatW, PlatH);
  
  if(PlatY6 >= (windowY + PlatH))
  {
    PlatY6 = 0;
    PlatX6 = random(windowX - PlatW);
  }

  if(ballX >= PlatX6 && ballX <= (PlatX6 + PlatW))
  {
    if(ballY >= (PlatY6 - h/2) && ballY <= PlatY6 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY6 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  fill(255);
  
  PlatY7 += 1;
  
  rect(PlatX7, PlatY7, PlatW, PlatH);
  
  if(PlatY7 >= (windowY + PlatH))
  {
    PlatY7 = 0;
    PlatX7 = random(windowX - PlatW);
  }

  if(ballX >= PlatX7 && ballX <= (PlatX7 + PlatW))
  {
    if(ballY >= (PlatY7 - h/2) && ballY <= PlatY7 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY7 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //------------------------------------------------------
  fill(255);
  
  PlatY8 += 1;
  
  rect(PlatX8, PlatY8, PlatW, PlatH);
  
  if(PlatY8 >= (windowY + PlatH))
  {
    PlatY8 = 0;
    PlatX8 = random(windowX - PlatW);
  }

  if(ballX >= PlatX8 && ballX <= (PlatX8 + PlatW))
  {
    if(ballY >= (PlatY8 - h/2) && ballY <= PlatY8 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY8 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  }// end GameModeEasy
//-------------------------------------------------------
//-------------------------------------------------------
//-------------------------------------------------------
    if(GameModeModerate == true)//GameModeModerate Starts
  {
    // loose 2, 4, 7
  background(#00B1F5);
  fill(255);
  text("distance: " + (int)distance, 50, 50);
    
  Clouds.render();
   Clouds.y += .5;
   if(Clouds.y >= windowY)
   {
     Clouds.y = 0;
     Clouds.x = random(windowX);
   }
  Clouds2.render();
   Clouds2.y += .5;
    if(Clouds2.y >= windowY)
   {
     Clouds2.y = 0;
     Clouds2.x = random(windowX);
   }
  Clouds3.render();
   Clouds3.y += .5;
    if(Clouds3.y >= windowY)
   {
     Clouds3.y = 0;
     Clouds3.x = random(windowX);
   }
  Clouds4.render();
   Clouds4.y += .5;
    if(Clouds4.y >= windowY)
   {
     Clouds4.y = 0;
     Clouds4.x = random(windowX);
   }
  Clouds5.render();
   Clouds5.y += .5;
    if(Clouds5.y >= windowY)
   {
     Clouds5.y = 0;
     Clouds5.x = random(windowX);
   }
  
// platform
 //---------------------------------------------------------- 
  fill(255);
  
  PlatY += 1;
  
  rect(PlatX, PlatY, PlatW, PlatH);
  
  if(PlatY >= (windowY + PlatH))
  {
    PlatY = 0;
    PlatX = random(windowX - PlatW);
  }

  if(ballX >= PlatX && ballX <= (PlatX + PlatW))
  {
    if(ballY >= (PlatY - h/2) && ballY <= PlatY - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
 //-------------------------------------------------------- 
  fill(255);
  
  PlatY2 += 1;
  
  rect(PlatX2, PlatY2, PlatW, PlatH);
  
  if(PlatY2 >= (windowY + PlatH))
  {
     PlatY2 = (windowY + PlatH);
     PlatY2 += 0;
  }

  if(ballX >= PlatX2 && ballX <= (PlatX2 + PlatW))
  {
    if(ballY >= (PlatY2 - h/2) && ballY <= PlatY2 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY2 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------------
  fill(255);
  
  PlatY3 += 1;
  
  rect(PlatX3, PlatY3, PlatW, PlatH);
  
  if(PlatY3 >= (windowY + PlatH))
  {
    PlatY3 = 0;
    PlatX3 = random(windowX - PlatW);
  }

  if(ballX >= PlatX3 && ballX <= (PlatX3 + PlatW))
  {
    if(ballY >= (PlatY3 - h/2) && ballY <= PlatY3 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY3 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //------------------------------------------------------
  
  fill(255);
  
  PlatY4 += 1;
  
  rect(PlatX4, PlatY4, PlatW, PlatH);
  
  if(PlatY4 >= (windowY + PlatH))
  {
     PlatY4 = (windowY + PlatH);
     PlatY4 += 0;
  }

  if(ballX >= PlatX4 && ballX <= (PlatX4 + PlatW))
  {
    if(ballY >= (PlatY4 - h/2) && ballY <= PlatY4 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY4 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //-----------------------------------------------------
    
  fill(255);
  
  PlatY5 += 1;
  
  rect(PlatX5, PlatY5, PlatW, PlatH);
  
  if(PlatY5 >= (windowY + PlatH))
  {
    PlatY5 = 0;
    PlatX5 = random(windowX - PlatW);
  }

  if(ballX >= PlatX5 && ballX <= (PlatX5 + PlatW))
  {
    if(ballY >= (PlatY5 - h/2) && ballY <= PlatY5 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY5 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  fill(255);
  
  PlatY6 += 1;
  
  rect(PlatX6, PlatY6, PlatW, PlatH);
  
  if(PlatY6 >= (windowY + PlatH))
  {
    PlatY6 = 0;
    PlatX6 = random(windowX - PlatW);
  }

  if(ballX >= PlatX6 && ballX <= (PlatX6 + PlatW))
  {
    if(ballY >= (PlatY6 - h/2) && ballY <= PlatY6 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY6 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  fill(255);
  
  PlatY7 += 1;
  
  rect(PlatX7, PlatY7, PlatW, PlatH);
  
  if(PlatY7 >= (windowY + PlatH))
  {
     PlatY7 = (windowY + PlatH);
     PlatY7 += 0;
  }

  if(ballX >= PlatX7 && ballX <= (PlatX7 + PlatW))
  {
    if(ballY >= (PlatY7 - h/2) && ballY <= PlatY7 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY7 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //------------------------------------------------------
  fill(255);
  
  PlatY8 += 1;
  
  rect(PlatX8, PlatY8, PlatW, PlatH);
  
  if(PlatY8 >= (windowY + PlatH))
  {
     PlatY8 = 0;
     PlatX8 = random(windowX - PlatW);
  }

  if(ballX >= PlatX8 && ballX <= (PlatX8 + PlatW))
  {
    if(ballY >= (PlatY8 - h/2) && ballY <= PlatY8 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY8 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  }// end GameModeModerate
  //-------------------------------------------------------
//-------------------------------------------------------
//-------------------------------------------------------
    if(GameModeHard == true)//GameModeHard Starts
  {
    // loose 1, 5
      background(#0053F5);
  fill(255);
  text("distance: " + (int)distance, 50, 50);
  
  Clouds.render();
   Clouds.y += .5;

  Clouds2.render();
   Clouds2.y += .5;

  Clouds3.render();
   Clouds3.y += .5;

  Clouds4.render();
   Clouds4.y += .5;
 
  Clouds5.render();
   Clouds5.y += .5;

  Stars.render();
  Stars.y += .5;
    if(Stars.y >= windowY)
   {
     Stars.y = 0;
     Stars.x = random(windowX);
   }
   
   Stars2.render();
    Stars2.y += .5;
    if(Stars2.y >= windowY)
   {
     Stars2.y = 0;
     Stars2.x = random(windowX);
   }
   
   Stars3.render();
    Stars3.y += .5;
    if(Stars3.y >= windowY)
   {
     Stars3.y = 0;
     Stars3.x = random(windowX);
   }
   
   Stars4.render();
    Stars4.y += .5;
    if(Stars4.y >= windowY)
   {
     Stars4.y = 0;
     Stars4.x = random(windowX);
   }
   
   Stars5.render();
    Stars5.y += .5;
    if(Stars5.y >= windowY)
   {
     Stars5.y = 0;
     Stars5.x = random(windowX);
   }
  
// platform
 //---------------------------------------------------------- 
  fill(255);
  
  PlatY += 1;
  
  rect(PlatX, PlatY, PlatW, PlatH);
  
  if(PlatY >= (windowY + PlatH))
  {
   PlatY = (windowY + PlatH);
   PlatY += 0;
  }

  if(ballX >= PlatX && ballX <= (PlatX + PlatW))
  {
    if(ballY >= (PlatY - h/2) && ballY <= PlatY - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
 //-------------------------------------------------------- 
  
  fill(255);
  
  PlatY3 += 1;
  
  rect(PlatX3, PlatY3, PlatW, PlatH);
  
  if(PlatY3 >= (windowY + PlatH))
  {
    PlatY3 = 0;
    PlatX3 = random(windowX - PlatW);
  }

  if(ballX >= PlatX3 && ballX <= (PlatX3 + PlatW))
  {
    if(ballY >= (PlatY3 - h/2) && ballY <= PlatY3 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY3 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //------------------------------------------------------
    
  fill(255);
  
  PlatY5 += 1;
  
  rect(PlatX5, PlatY5, PlatW, PlatH);
  
  if(PlatY5 >= (windowY + PlatH))
  {
     PlatY5 = (windowY + PlatH);
     PlatY5 += 0;
  }

  if(ballX >= PlatX5 && ballX <= (PlatX5 + PlatW))
  {
    if(ballY >= (PlatY5 - h/2) && ballY <= PlatY5 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY5 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  fill(255);
  
  PlatY6 += 1;
  
  rect(PlatX6, PlatY6, PlatW, PlatH);
  
  if(PlatY6 >= (windowY + PlatH))
  {
    PlatY6 = 0;
    PlatX6 = random(windowX - PlatW);
  }

  if(ballX >= PlatX6 && ballX <= (PlatX6 + PlatW))
  {
    if(ballY >= (PlatY6 - h/2) && ballY <= PlatY6 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY6 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  fill(255);
  
  PlatY8 += 1;
  
  rect(PlatX8, PlatY8, PlatW, PlatH);
  
  if(PlatY8 >= (windowY + PlatH))
  {
     PlatY8 = 0;
     PlatX8 = random(windowX - PlatW);
  }

  if(ballX >= PlatX8 && ballX <= (PlatX8 + PlatW))
  {
    if(ballY >= (PlatY8 - h/2) && ballY <= PlatY8 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY8 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
    }// end GameModeHard
   //-------------------------------------------------------
//-------------------------------------------------------
//-------------------------------------------------------
    if(GameModeExtream == true)//GameModeExtream Starts
  {
    // loose 6
    background(#1700B4);
  fill(255);
  text("distance: " + (int)distance, 50, 50);
  
  Moon.render();
  Moon.y += .5;
  if(Moon.y >= 100)
  {
    Moon.y += 0;
  }
  
    Stars.render();
     Stars.y += .5;
    if(Stars.y >= windowY)
   {
     Stars.y = 0;
     Stars.x = random(windowX);
   }
   
   Stars2.render();
    Stars2.y += .5;
    if(Stars2.y >= windowY)
   {
     Stars2.y = 0;
     Stars2.x = random(windowX);
   }
   
   Stars3.render();
    Stars3.y += .5;
    if(Stars3.y >= windowY)
   {
     Stars3.y = 0;
     Stars3.x = random(windowX);
   }
   
   Stars4.render();
    Stars4.y += .5;
    if(Stars4.y >= windowY)
   {
     Stars4.y = 0;
     Stars4.x = random(windowX);
   }
   
   Stars5.render();
    Stars5.y += .5;
    if(Stars5.y >= windowY)
   {
     Stars5.y = 0;
     Stars5.x = random(windowX);
   }
// platform
 //---------------------------------------------------------- 
  
  fill(255);
  
  PlatY3 += 1;
  
  rect(PlatX3, PlatY3, PlatW, PlatH);
  
  if(PlatY3 >= (windowY + PlatH))
  {
    PlatY3 = 0;
    PlatX3 = random(windowX - PlatW);
  }

  if(ballX >= PlatX3 && ballX <= (PlatX3 + PlatW))
  {
    if(ballY >= (PlatY3 - h/2) && ballY <= PlatY3 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY3 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //------------------------------------------------------
  
  fill(255);
  
  PlatY6 += 1;
  
  rect(PlatX6, PlatY6, PlatW, PlatH);
  
  if(PlatY6 >= (windowY + PlatH))
  {
     PlatY5 = (windowY + PlatH);
     PlatY6 += 0;
  }

  if(ballX >= PlatX6 && ballX <= (PlatX6 + PlatW))
  {
    if(ballY >= (PlatY6 - h/2) && ballY <= PlatY6 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY6 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  fill(255);
  
  PlatY8 += 1;
  
  rect(PlatX8, PlatY8, PlatW, PlatH);
  
  if(PlatY8 >= (windowY + PlatH))
  {
     PlatY8 = 0;
     PlatX8 = random(windowX - PlatW);
  }

  if(ballX >= PlatX8 && ballX <= (PlatX8 + PlatW))
  {
    if(ballY >= (PlatY8 - h/2) && ballY <= PlatY8 - PlatH)
    {
      if(speedY >= 0)
      {
        ballY = PlatY8 - h/2;
        speedY = speedY * - 0.9;
      }
    }
  }
  //---------------------------------------------------
  
  }// end GameModeExtream
 
  }//GameStart
  
  if (GameOver == true)
  {
    background(0);
    GameStart = false;
    
    distance += 0;
    
    fill(255);
    textSize(40);
    text("Total Distance: " + (int) distance, 50, 100);
    
    fill(255, 0, 0);
    ellipse(width/2, height/2, 200, 200);
    fill(255);
    textSize(50);
    text("Retry", width/2 - 70, height/2 + 15);
    
    if(mouseX >= width/2 - 100 && mouseX <= width/2 + 100)
    {
      if(mouseY >= height/2 - 100 && mouseY <= height/2 + 100)
        {
          fill(0, 255, 0);
          ellipse(width/2, height/2, 200, 200);
            
            if(mousePressed)
            {
              GameStart = true;
              ground = 650;
              dificultyTimer = 0;
              GameOver = false;
               
               //--------------------------------------------------Setup
PlatX = random(windowX - PlatW);
PlatY = 0;
PlatX2 = random(windowX - PlatW);
PlatY2 = 100;
PlatX3 = random(windowX - PlatW);
PlatY3 = 200;
PlatX4 = random(windowX - PlatW);
PlatY4 = 300;
PlatX5 = random(windowX - PlatW);
PlatY5 = 400;
PlatX6 = random(windowX - PlatW);
PlatY6 = 500;
PlatX7 = random(windowX - PlatW);
PlatY7 = 600;
PlatX8 = random(windowX - PlatW);
PlatY8 = 700;
//--------------------------------------------------------------  
  Grass.x = 150;
  Grass.y = windowY - 75;
  Grass.s = .5;
  
  Grass2.x = width/2 + 150;
  Grass2.y = windowY - 75;
  Grass2.s = .5;
 //--------------------------------------------------------- Clouds 
  Clouds.x = random(windowX);
  Clouds.y = 0;
  Clouds.s = 0.1;
  
  Clouds2.x = random(windowX);
  Clouds2.y = 150;
  Clouds2.s = 0.1;
  
  Clouds3.x = random(windowX);
  Clouds3.y = 300;
  Clouds3.s = 0.1;
  
  Clouds4.x = random(windowX);
  Clouds4.y = 450;
  Clouds4.s = 0.1;
  
  Clouds5.x = random(windowX);
  Clouds5.y = 600;
  Clouds5.s = 0.1;
 //---------------------------------------------------------end clouds
 //---------------------------------------------------------start stars
  Stars.x = random(windowX);
  Stars.y = 0;
  Stars.s = 0.2;
  
  Stars2.x = random(windowX);
  Stars2.y = 150;
  Stars2.s = 0.2;
  
  Stars3.x = random(windowX);
  Stars3.y = 300;
  Stars3.s = 0.2;
  
  Stars4.x = random(windowX);
  Stars4.y = 450;
  Stars4.s = 0.2;
  
  Stars5.x = random(windowX);
  Stars5.y = 600;
  Stars5.s = 0.2;

//----------------------------------------------------------end Stars
  Moon.x = 100;
  Moon.y = -50;
  Moon.s = 0.5;
               //--------------------------------------------------end setup
            }
        }
    }
    
  }
  
  
//charecter basics
fill(255);
  ellipse(ballX, ballY, h, h);
  triangle(ballX + 45, ballY - 25, ballX + 10, ballY - 50, ballX + 30, ballY - 70);
  triangle(ballX - 45, ballY - 25, ballX - 10, ballY - 50, ballX - 30, ballY - 70);
  fill(0);
  ellipse(ballX - 23, ballY - 20, 18, 10);
  ellipse(ballX + 23, ballY - 20, 18, 10);
  ellipse(ballX - 25, ballY + 20, 2, 2);
  ellipse(ballX - 29, ballY + 17, 2, 2);
  ellipse(ballX - 29, ballY + 23, 2, 2);
  ellipse(ballX + 25, ballY + 20, 2, 2);
  ellipse(ballX + 29, ballY + 17, 2, 2);
  ellipse(ballX + 29, ballY + 23, 2, 2);
  
//gravity
  speedY = speedY + 0.5;
  
  ballY = ballY + speedY;
  
  ballX = ballX + speedX;
  
  if (ballY > height - h/2)
  {
    ballY = height - h/2;
    speedY = speedY * - 0.9;
  }
  
  else if (ballY <= 0)
  {
    speedY = -speedY;
  }
  
    if (ballX > width - h/2)
  {
    ballX = width - h/2;
    speedX = speedX * -0.9;
  }
  
    else if(ballX <= 0 + h/2)
  {
    speedX = -speedX;
  }
  
  if(keyPressed)
  {
    
    if(keyCode == RIGHT)
    {
      speedX = speedX + .25;
    }
    
    if(keyCode == LEFT)
    {
      speedX = speedX - .25;
    }
    
    if(keyCode == DOWN) 
    {
      speedY = speedY + 1;
    }  
  }
}


void keyReleased()
{
  if(keyCode == UP)
  {
    speedY = speedY - 5;
  }
}




//sprite object---------------------
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
   
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}




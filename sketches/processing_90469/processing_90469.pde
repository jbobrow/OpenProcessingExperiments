
//HW 7
//(c) Sunny Li 2013

float x, y, bX, bY;
float d, px, py;

int count;
int startTime, endTime, gameTime;
int gamePhase;

void setup()
{
   size(400, 400);
   smooth();
   noStroke();
   textSize(14);
   textAlign(CENTER);
   fill(255);
   count = 0;
   startTime = 0;
   endTime = 0;
   gamePhase = 0; 
   gameTime = 11000;
}

void draw()
{
  background(66, 146, 158);
  if (gamePhase == 0)
  {
    Instructions();
  }
  else if (gamePhase == 1)
  {
    playGame();
  }
  else
  {
    score();
  }
}

void Instructions()
{
  background(66, 146, 158);
  text("Use arrow keys to move.", width/2, 80);
  text("Eat as much bait as possible before time runs out.", width/2, 100);
  text("Press any key to start.", width/2, 300);
}

void showScore()
{
  textSize(20);
  text(count, width/2, 50);
}

void playGame()
{
// Aesthetics
  fill(118, 120, 119);
  ellipse(50, 400, 80, 80);
  ellipse(200, 400, 150, 120);
  ellipse(300, 420, 100, 100);
  pushStyle();
  fill(132, 196, 200);
  rect(0, 0, width, 100);
  popStyle();
  
  showScore();
  drawFish(x+100, y+250);
  drawBait(bX, bY);
  fallingBait();
  time();
  moveFish();
}

void keyPressed( )
{
   if (gamePhase == 0)
   {
      gamePhase = 1;
      startTime = millis( );
   }
   
//Fish movement

   if (gamePhase == 1) {
     
   if (keyCode == RIGHT) {
        x = x + 20;
      }
   if (keyCode == LEFT) {
        x = x - 20;
      }
    }
    
   
}


void drawFish(float x, float y)
{
  fill(249, 217, 214);
  ellipse(x, y, 100, 75);
  triangle(x-70, y-40, x-70, y+40, x-45, y);
  fill(66, 146, 158);
  triangle(x+25, y, x+50, y-20, x+50, y+20);
  fill(118, 120, 119);
  ellipse(x+25, y-15, 5, 5);
  
  px = x+50;
  py = y;
  hit();
}

// Makes sure fish wraps

void moveFish()
{
  if (x >= width)
  {
    x = -150;
  }
  else if (x <= -150)
  {
    x = width;
  }
}

void drawBait(float bX, float bY)
{
  fill(244, 243, 238);
  ellipse(bX, bY, 10, 10);
}

void fallingBait()
{
  bY = bY + 3;
  if (bY > height)
  {
    bX = random(50, 350);
    bY = 0;
  }
}

void hit()
{
  d = dist( bX, bY, px ,py);
  if (d <= 15) {
    count++;
    bX = random(50, 350);
    bY = 0;
    fill(212, 214, 209);
    rect(0, 0, width, height);
  }
}

void time()
{
  text(+ ( gameTime/1000 - ((millis( )))/1000), width/2, 380);
  if (gameTime/1000 - ((millis( )))/1000 < 0) {
    gamePhase = 2;
  }
}    

void score()
{
  textSize(20);
  text("Score: "+count, width/2, 100);
  
}

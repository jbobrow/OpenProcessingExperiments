
//Mitsuko Verdery 
//Copyright 2012
//Hw#7 Game

int count;
int startTime, endTime, targetDisplayTime, targetStartTime, 
totalTargetTime, gameTime;
int gamePhase;
color targetColor;
float x, y, diam;
PImage p1, p2;

void setup() 
{
 size (500, 400);
 textSize( 24);
 textAlign( CENTER);
 fill(255);
 count = 0;
 startTime = 0;
 endTime = 0;
 gamePhase = 0;
 targetDisplayTime = 1000;
 gameTime = 10000;
 diam = 100;

  p1 = loadImage( "rooster.jpg");
  p2 = loadImage( "elephant.jpg");
  
}

void draw () {
  background ( 255, 255, 255 ); 
  
  if ( gamePhase == 0)
  {
    showInstructions ();
  }
  else if ( gamePhase == 1)
  {
    playGame ();
   
  }
  else 
  {
    score (); 
  }  
}

void score()
{
  fill(5, 5, 5);
  text("GAME OVER", width/2, 50);
  text("Click to Play Again", width/2, 300);
  text("You hit" + count + "elephants.", width/2, 100);
  if ( count < 3)
  {
    text("Better Luck Next Time.", width/2, 150);
  }
  else if ( count <6 )
  {
    text("Not bad...", width/2, 150);
  }
  else 
  {
    text("Horray, Good Job!", width/2, 150);
  }
  gamePhase = 3;
  noLoop();
}


void checkTime()
{
  fill( 5, 5, 5);
  text( "Time Remaining: " + ( gameTime/1000 - ((millis( ) - startTime))/1000), width/2, 50 );
  if ( (millis( )-startTime) > gameTime )
  {
     gamePhase = 2;
  } 
}

void showScore()
{
  fill(5, 5, 5);
  text ( "Hits" + count, width/2, height*.9);
}

void drawElephant()
{
  totalTargetTime = millis() - targetStartTime;
  if ( totalTargetTime > targetDisplayTime )
  {
    x= random(50, width-50);
    y= random(50, width-50);
    targetStartTime= millis();
  }
  image( p2, x, y, 60, 60);
}


void drawrooster()
{
  image(p1, mouseX, mouseY, 90, 90);
}

void checkHit()
{
  
  float d = dist( x, y, mouseX, mouseY);
  if ( d < diam/2)
     {
       count++;
       fill( 5, 5, 5);
       rect( 0, 0, width, height );
       targetStartTime = 0;
     } 
}

void playGame()
{
  if (millis () < 100000)
  {
  drawElephant();
  drawrooster();
  checkHit();
  checkTime();
  showScore();
  checkTime();
  }
  else gamePhase =3;
}


void showInstructions()
{
  fill(5, 5, 5);
  text("Hit as many elephants as possible!", width/2, 150);
  text("Press any key to start.", width/2, 50);
}

void keyPressed()
{
  if ( gamePhase == 0 )
  {
    println(1);
    gamePhase = 1 ;
    startTime = millis();
  }
}

void mouseClicked()
{
  if ( gamePhase == 3 )
  {
    gamePhase = 0;
    loop();
}
}

                
                

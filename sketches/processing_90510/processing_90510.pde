
//Jennifer Kang
//jmkang@andrew.cmu.edu
//©jennifer kang 

int count;
int startTime, endTime, targetDisplayTime, targetStartTime, totalTargetTime, targetDispTime, gameTime;
int gamePhase;
color targetColor;
float x, y, diam;



void setup ( )
{
  size (400,400);
  textSize(20);
  textAlign (CENTER);
  fill (119, 65, 124);
  smooth ( );
  count=0;
  startTime=0;
  endTime=0;
  gamePhase=0;
  targetDisplayTime=900;  // miliseconds - change this to alter difficulty 
  targetDispTime=900;
  gameTime=15000;    // miliseconds - change this to alter difficulty
}

void draw ( )
{
  background (240, 239, 223);
  if (gamePhase == 0)
  {
    showInstructions ( );
  }
  else if (gamePhase == 1)
  { 
    playGame ( );
  }
  else
  {
    score ( );
  }
}


void score ( )
{
  fill (68, 38, 72);
  text("Game Over :)", 80, 240);
  text ("Score: " + count, 60, 280);
  if (count < 8)
  {
    text ("Try again...", 69, 320);
    PImage b;
    b = loadImage ("luigi.png");
    image (b, 200, 200, width/2, height/2);
  }
  else if ( count < 16 )
  {
    text ("Better...", 60, 320);
    PImage b;
    b = loadImage ("luigi2.png");
    image (b, 200, 200, width/2, height/2);
  }
  else
  {
    text ("Good Job!", 60, 320);
    PImage b;
    b = loadImage ("luigi3.png");
    image (b, 200, 200, width/2, height/2);
  }  
}



void checkTime ( )
{
  fill (161, 101, 164);
  text ("Time Remaining:" + (gameTime/1000-((millis( )-startTime))/1000), 120, 320);
  if ( (millis( )-startTime) > gameTime )
  {
    gamePhase = 2;
  }
}



void showScore ( )
{
  fill ( 196, 141, 187 );
  text ("Score: " + count, 120, 350);
}


void checkHit ( )
{
  float d = dist (x, y, mouseX, mouseY);
  if ( d < diam/2 )
  {
    count++;
   targetStartTime=0;
  }
}


void drawLines ( )
{
   fill (120, 66, 125);
   ellipse (mouseX, mouseY, width/15, height/15); 

}


void drawTarget ( )
{
  totalTargetTime = millis ( ) - targetStartTime;
  if ( totalTargetTime > targetDispTime )
  {
  // targetColor=color(random(255), random(255), random(255)); 
  x=random (30, width-20);
  y=random (30, height-20);
  diam = random (20,70);
  targetStartTime=second ( );
  }
  // fill (targetColor);
  fill (255, 176, 64);
  noStroke ( );
  ellipse (x, y, diam, diam);
}


void playGame ( )
{
  drawTarget ( );
  drawLines ( );
  checkHit ( );
  showScore ( );
  checkTime ( );
}


void showInstructions ( )
{
  text ("Click as many ellipses as you can", 200, 180);
  text ("Press space bar to play", 200, 220);
  noStroke ( );
  ellipse (200,260, 45, 45);
}


void keyPressed ( )
{
  if (gamePhase == 0)
  {
    gamePhase = 1;
    startTime = millis ( );
  }
}
  
 



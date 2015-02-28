
PFont font; //this creates a font variable we can use to plug in a font
int score=0; //this is the score variable
int timer=10; //this is the countdown timer
float playerX=0; //this is the horizontal position of the player
float playerY=0; //this is the vertical position of the player
float moveLeft=0;
float moveRight=0;
float moveUp=0;
float moveDown=0;
float health=2;
float i=0;
float k=0;
float wall1xgive=20;
float wall1ygive=200;
float wall1X=1200;
float wall1Y=500;
float scoreX=600;
int give = 50; //this is how forgiving the game is with the player's player position
int timeLast = 0; //this is the variable where we store the last known second
PImage img;


void setup() 
{
  img = loadImage("BackGround.png");
  noStroke();
  frameRate(60);
  smooth();
  size(1200, 600); //this sets the size of the sketch
  smooth(); //this makes all 2D primitives smooth
  timeLast=second(); //this syncronizes the timeLast with the current second
  playerX=0; 
  playerY=550; 
  font = loadFont("Serif.plain-48.vlw"); //this plugs a serif font into our font variable
  textFont(font, 32); //this designates our font as the font any text will use
}
 
void draw() 
{ 
  if (timer>0) 
  { 
    game(); 
  }
}
 
void game() 
{ //this is a method that holds much of the game
  background(img);
  fill(0,255,0);
  rect(1120,0,80,600);
  if(score==1)
  {
    scoreX=1120;
  }
  ellipse(scoreX,300,5,900);
  if (second()!=timeLast) 
  { //this sees if a second has passed
    timeLast=second(); //if a second has passed then we update the timeLast variable
    timer-=1; //this makes the timer countdown by one
  }
  wall1X=wall1X-20;
  if(wall1X<0)
  {
    wall1X=1200;
    wall1Y=-100+random(800);
  }
  if(health==1)
  {
    i++;
    fill(255,0,0,255-i*5);
    rect(0,0,1200,600);
  }
  if(score==1)
  {
    k++;
    fill(0,255,0,255-k*5);
    rect(0,0,1200,600);
  }
  if(health==0)
  {
    timer=0;
  }
  fill(random(255),random(255),random(255));
  rect(0,0,1200,60);
  fill(0);
  scale(1.3);
  text("Run to the finish!", 250, 32); //this draws the score text and the score variable
  text("Timer: "+timer, 550, 32); //this draws the timer text and the timer variable
  scale(1/1.3);
  fill(60,60,255);
  ellipse(playerX,playerY, give, give); //this draws the player.
  if(moveRight==1)
  {
    playerX=playerX+10;
  }
  else if(moveLeft==1)
  {
    playerX=playerX-10;
  }
  if(moveUp==1)
  {
    playerY=playerY-10;
  }
  else if(moveDown==1)
  {
    playerY=playerY+10;
  }
  else if(keyPressed=false)
  {
    playerX=playerX;
  }
  fill(255,0,0);
  ellipse(wall1X,wall1Y,wall1xgive,wall1ygive);
  if (playerX<wall1X+give-10 && playerX>wall1X-give+10) 
  {
    if (playerY<wall1Y+125 && playerY>wall1Y-125) 
    { //this sees if the player is close to the enemy vertically
      health=health-1; //this increases the score by 1
      wall1X=1200; //this places the enemy in a new position horizontally
      wall1Y=random(600); //this places the enemy in a new position vertically
    }
  }
  if(playerX==scoreX)
  {
    score++;
  }
  if(timer==0)
  {
    fill(255,0,0);
    rect(0,0,1200,600);
  }
  if(score==2)
  {
    fill(0,255,0);
    rect(0,0,1200,600);
    timer=0;
  }
}

void keyPressed() 
{ 
  if (key == 'a')
    {
      moveLeft=1;
      moveRight=0;
    }
    if (key == 'd')
    {
      moveRight=1;
      moveLeft=0;
    }
    if (key == 'w')
    {
      moveUp=1;
      moveDown=0;
    }
    if (key == 's')
    {
      moveUp=0;
      moveDown=1;
    }
    if (key == 'b')
    {
      score++;
    }
}
void keyReleased() 
{
  if (key == 'a') 
  {
    moveLeft=0;
  } 
  if (key == 'd')
  {
    moveRight=0;
  }
  if (key == 'w') 
  {
    moveUp=0;
  } 
  if (key == 's')
  {
    moveDown=0;
  }
}





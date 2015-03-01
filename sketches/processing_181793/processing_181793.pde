
/* @pjs preload="BAd GUY.jpg, hero sprite.jpg, prize.jpg"; 
 */

float heroX;
float heroY;
float speed;
float villianX;
float villianY;
boolean LoseScreen;
boolean WinScreen;
boolean TitleScreen;
PImage villian ;

void setup () {
  size (500, 500);
  speed = 6 ;
  villianX= width/2;
  villianY=height/2;
  heroX = width/ 4;
  heroY = height / 4 ;
  TitleScreen = true;
  villian = loadImage ("BAd GUY.jpg");
  rectMode(CENTER);
  imageMode (CENTER);
  WinScreen=false;
} 

void draw () {
  if (TitleScreen) { 
    drawTitle();
  } else if (LoseScreen) {
    drawLoseScreen();
  }else if (WinScreen) {
      drawWinScreen (); }else{
    drawGame();
  }
}
void drawWinScreen(){
  background (100, 100, 225);
}

void drawLoseScreen (){
  background (200, 0, 0);
}
void drawGame () {
  background (193,245,229);
  drawHero (heroX, heroY);
  moveVillian ();
  drawVillian (villianX, villianY);
  drawGoal (400, 400);
if (heroHitVillian()) {
  LoseScreen = true;
} else if (heroHitGoal()) {
  WinScreen = true;
  
   }
}

boolean heroHitGoal ()
{
float heroBubble = 30;
float goalBubble =15;
noFill();
stroke(236, 72, 45);
ellipse(heroX, heroY, heroBubble, heroBubble);
ellipse ( 400, 400, goalBubble, goalBubble);
if( dist( heroX, heroY, 400, 400) < heroBubble + goalBubble) {
  return true ;
}
return false; 
}
boolean heroHitVillian ()
{
float heroBubble = 30;
float villianBubble =15;
noFill();
stroke(236, 72, 45);
ellipse(heroX, heroY, heroBubble, heroBubble);
ellipse ( villianX, villianY, villianBubble, villianBubble);
if( dist( heroX, heroY, villianX, villianY) < heroBubble + villianBubble) {
  return true ;
}
return false; 
}

void drawTitle () {
  background (75,240, 189);
  stroke (0);
  fill(0);
  textSize(33);
  text ("The Ugly Sprite Game!", 80, 100);
  text ("Press Space Bar To Play", 70, 200);
  textSize (40);
  text ("Get the Gold Dot! ", 90, 300);
}
void moveVillianToward (float targetX, float targetY, float howFar) {
  float w = targetX-villianX;  
  float h = targetY- villianY;
  float distance = sqrt (w*w + h*h);
  float b = howFar/ distance * h;
  float a = howFar/distance * w;
  villianX= villianX + a;
  villianY = villianY + b;
}

void moveVillian () {
  moveVillianToward((400 + heroX)/2 + random (-40, 40), (400 + heroY)/2 + random (-40, 40), .5);
}

void keyPressed () { 
  if (WinScreen && key ==' ') {
    WinScreen = false;
    setup();
  }
  if (LoseScreen && key ==' ') {
    LoseScreen = false;
    setup();
  }
  if (TitleScreen ) TitleScreen =false;
  // pressD move right 
  if (key == 'd') {
    heroX = heroX + speed;
  }
  // pressA move left 
  if (key == 'a') {
    heroX = heroX - speed;
  }
  // pressS move down
  if (key == 's' ) {
    heroY = heroY + speed;
  }
  // pressW move up 
  if (key == 'w' ) { 
    heroY = heroY - speed;
  }
} 

void drawHero (float x, float y) {

  stroke(0);
  fill(225);
  ellipse (x-6, y-15, 4, 15);
  ellipse (x+6, y-15, 4, 15);
  ellipse (x, y, 20, 20);
  fill (0);
  ellipse (x, y+2, 3, 3);
}
void drawVillian(float x, float y) {   
  //( float x, float y) {
  //fill (255,0,0);

  image(villian, x, y, 70, 70);

  //triangle (x, y, x-12, y-12, x+12, y-12);
}

void drawGoal (float x, float y) {
  fill (202, 205, 51);
  ellipse (x, y, 20, 20);
}




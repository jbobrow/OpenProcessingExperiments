
float heroX;
float heroY; 
float villianX;
float villianY;
float speed;
boolean TitleScreen; 
boolean LoseScreen; 
boolean WinScreen; 
boolean InstructionScreen;
PImage andy;
PImage fermat; 

void setup () { 
  size(500,500); 
  speed = 5;
  villianX = width/2;
  villianY = height/2;
  heroX = width/4;
  heroY = height/4;
  TitleScreen = true;
  LoseScreen = false; 
  WinScreen = false; 
  andy = loadImage("AndrewWiles.jpg");
  fermat = loadImage("fermat.png"); 
 imageMode(CENTER); 
 rectMode(CENTER);
 textAlign(CENTER, CENTER); 
}

void draw() {
  if (TitleScreen) {
    drawTitle();
  } else if (LoseScreen) {
    drawLoseScreen(); 
  } else if (WinScreen) {
    drawWinScreen(); 
  } else {
    drawGame(); 
  }
}

void drawWinScreen() {
  background(54, 255, 169); 
  textSize(100);
  fill(0);  
  text("You Win!", 250, 200); 
  textSize(28); 
  text("press space to restart", 250, 400); 
}

void drawLoseScreen() {
  background(200, 0, 0); 
  textSize(100);
  fill(0);  
  text("You Lose!", 250, 200); 
  textSize(28); 
  text("press space to restart", 250, 400);
}

void drawTitle() {
  background(255); 
  stroke(0);
  fill(0);  
  textSize(40); 
  text("Andrew Wiles Game", 250, 100); 
  image(andy, 250, 250); 
  textSize(20); 
  text("Press any key to play", 250, 400);   
}

  
void drawGame () {
  background(195, 247, 240); 
  moveVillian(); 
  drawVillian(villianX, villianY);
  drawGoal(350, 400); 
  drawHero(heroX, heroY);
  if (heroHitVillian()) {
    LoseScreen = true; 
  } else if (heroHitGoal()) {
    WinScreen = true; 
  }
}


boolean heroHitGoal() {
  float heroBubbleH = 60; 
  float heroBubbleW = 50; 
  float goalBubbleH = 25; 
  float goalBubbleW = 100;
  noFill(); 
  noStroke(); 
  rect(heroX, heroY, heroBubbleW, heroBubbleH); 
  rect(350, 400, goalBubbleW, goalBubbleH); 
  if (abs(heroX - 350) < heroBubbleW/2 + goalBubbleW/2
     && abs(heroY - 400) < heroBubbleH/2 + goalBubbleH/2) {
    return true; 
  }
  return false; 
}

boolean heroHitVillian() {
  float heroBubbleH = 60; 
  float heroBubbleW = 50; 
  float villianBubbleH = 25; 
  float villianBubbleW = 50;
  noFill(); 
  noStroke(); 
  rect(heroX, heroY, heroBubbleW, heroBubbleH); 
  rect(villianX, villianY, villianBubbleW, villianBubbleH); 
  if (abs(heroX - villianX) < heroBubbleW/2 + villianBubbleW/2
     && abs(heroY - villianY) < heroBubbleH/2 + villianBubbleH/2) {
    return true; 
  }
  return false; 
}

void moveVillianToward(float targetX, float targetY, float howFar) {
  float w = targetX - villianX; 
  float h = targetY - villianY; 
  float distance = sqrt(w*w + h*h); 
  float a = howFar / distance * w; 
  float b = howFar / distance * h; 
  villianX = villianX + a;
  villianY = villianY + b; 
  
}


void moveVillian() {
  moveVillianToward(heroX, heroY, .80);  
}

void keyPressed() {
  
 if (TitleScreen) TitleScreen=false;  

 
 if (WinScreen && key==' ') {
   WinScreen = false; 
   setup();
 }
 
 if (LoseScreen && key==' ') {
   LoseScreen = false; 
   setup(); 
 }
 
 //Press D, move right
 if (key == 'd') {
   heroX = heroX + speed;
 }
 
 //Press A, move left
 if (key == 'a') {
   heroX = heroX - speed; 
 }
 
 //Press S, move down
 if (key == 's') {
   heroY = heroY + speed; 
 }

 //Press W, move up
 if (key == 'w') {
   heroY = heroY - speed;
 }
}


void drawHero(float x, float y) {
  image(andy, x, y, 50, 60);   
}

void drawVillian(float x, float y) {
  fill(255, 0, 0); 
  textSize(30); 
  text("LIFE", x, y); 

}

void drawGoal(float x, float y) {
  //fill(202, 205, 51); 
  //ellipse(x, y, 20, 20); 
  image(fermat, x,y); 
   
}



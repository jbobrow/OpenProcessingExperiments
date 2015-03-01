
float heroX;
float heroY;
float villainX;
float villainY;
float speed;
float goalX;
float goalY;
boolean TitleScreen;
boolean WinScreen;
boolean LoseScreen;
PImage bunny;



void setup() {
  size(500, 500);
  villainX= width/ 4;
  villainY= height/4;
  heroX = width/2;
  heroY = height/2;
  goalX=400;
  goalY=400;
  speed = 5;
  TitleScreen= true;
  WinScreen= false;
  LoseScreen= false;
  bunny= loadImage("bunnypicture.jpg");
  rectMode(ENTER);
  imageMode(CENTER);
  textAlign(CENTER);
  
}


void draw() {
  if (TitleScreen) {
    drawTitle();
  }else if (LoseScreen) {
    drawLoseScreen();
  }else if (WinScreen) {
    drawWinScreen();
  } else {
    drawGame();
  }
}
void drawWinScreen() {
  background(100,100,255);
  textSize(20);
  text("YOU WON!", 200, 300);
}

void drawLoseScreen() {
  background(200,0,0);
  textSize(30);
  text("YOU LOST!", 200, 300);
}


void drawTitle() {
  background (255);
  stroke(0);
  fill(0);
  textSize(20);
  text( "easter bunny game!!!", 220, 200);
  textSize(15);
  fill(255,0, 0);
  text ("get to the bunny without the villian getting you!", 220, 300);
  textSize (10);
  text( "press any key to play", 220, 100);
}
void drawGame() {
  background(178, 252, 251);
  moveVillain();
  drawVillain(villainX, villainY);
  drawGoal(goalX, goalY);
  drawHero(heroX, heroY);
  if (heroHitVillain()) {
    LoseScreen=true;
  }
  if (heroHitGoal()) {
    WinScreen=true;
  }
}



boolean heroHitVillain() {
  float heroBubble = 15;
  float villainBubble =  15;
if (dist(heroX, heroY, villainX, villainY) < heroBubble + villainBubble) {
  return true;
}
return false; 
  
}

boolean heroHitGoal() {
  float heroBubble = 20;
  float goalBubble =  20;
if (dist(heroX, heroY, goalX, goalY) < heroBubble + goalBubble) {
  return true;
}
return false; 
  
}

void moveVillainToward(float targetX, float targetY, float howFar) {
  float w= targetX- villainX;
  float h= targetY- villainY; 
  float distance= sqrt(w*w+h*h);
  float b = howFar / distance * h;
  float a = howFar / distance * w;
  villainX= villainX + a;
  villainY = villainY + b;
}

void drawGoal (float x, float y) {
  //fill(202, 205, 51);
  //ellipse(x,y,20,20);
  image(bunny, x, y, 70, 70);
}

void moveVillain() {
  moveVillainToward(heroX, heroY, 1.5);
}
//moveVillainToward((400+heroX)/ 2+ random(-50, 50), (400+heroY)/2+random(-50, 50), 1);


void keyPressed() {
    if (TitleScreen) TitleScreen=false;
  if(WinScreen && key==' ') {
    WinScreen=false;
    setup();
  }
    if(LoseScreen && key==' ') {
    LoseScreen=false;
    setup();
  }
  //Press D, move right
  if (key == 'd') {
    heroX = heroX + speed;
  }
  //Press S, move down
  if (key == 's') {
    heroY=heroY + speed;
  }
  //press A, move left
  if (key == 'a') {
    heroX=heroX - speed;
  }
  //press W, move up  
  if (key == 'w') {
    heroY= heroY- speed;
  }
}




void drawHero(float x, float y) {
  //first ear
  ellipse(x-8, y+15, 4, 15);
  //second ear
  ellipse(x+8, y+15, 4, 15);
  //head
  ellipse(x, y, 20, 20);
  //nose
  stroke(0);
  fill(0);
  ellipse(x, y, 3, 3);
}

void drawVillain (float x, float v) {
  triangle(x, v, x-15, v-15, x+15, v-15);
}




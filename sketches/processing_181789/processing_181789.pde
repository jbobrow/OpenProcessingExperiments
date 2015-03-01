
float heroX;
float heroY;
float villainX;
float villainY;
float speed;
boolean TitleScreen;
boolean LoseScreen;
boolean WinScreen;
PImage dog;
PImage goal;
float goalX;
float goalY;

void setup () {
  size(500, 500);
  villainX=350;
  villainY=350;
  heroX= width/2;
  heroY= height/2;
  speed = 5;
  TitleScreen=true;
  WinScreen=false;
  LoseScreen=false;
  dog = loadImage ("dogpic2.jpg");
  goal= loadImage("goalpic.jpg");
  rectMode(CENTER);
  imageMode(CENTER);
  goalX= random(0,width);
  goalY= random(0,height); 
}


void draw() {
  if (TitleScreen) {
    drawTitle();
  } else if (LoseScreen) 
  {
    drawLoseScreen();
  } else if (WinScreen) {
    drawWinScreen();
  } else {
    drawGame();
  }
}

void drawWinScreen() {
  background(100, 100, 255);
  textSize(60);
  fill(222, 226,32);
  text("You Won!", 200, 100);
}


void drawLoseScreen() {
  background(200, 0, 0);
  textSize(60);
  fill(122, 126, 232);
  text("You Lose!", 200, 100);
}

void drawTitle() {
  background(255);
  stroke(0);
  fill(188, 133, 233);
  textSize(48);
  text("Shape Game!", 100, 100);
  textSize(20);
  text("Press Any Key to Play", 100, 200);
}

void drawGame() {
  background(152, 247, 224);
  drawHero(heroX, heroY);
  moveVillain();
  drawVillain(villainX, villainY);
  drawGoal(goalX,goalY);
  if (heroHitVillain()) {
    LoseScreen=true;
  } else if (heroHitGoal()) {
    WinScreen=true;
  }
}

Boolean heroHitVillain() {
  float heroBubble = 50;
  float villainBubble = 10;
  noFill();
  stroke(236, 72, 45);
  ellipse(heroX, heroY, heroBubble, heroBubble);
  ellipse(villainX, villainY, villainBubble, villainBubble);
  if (dist(heroX, heroY, villainX, villainY) < heroBubble + villainBubble) {
    return true;
  }
  return false;
}


Boolean heroHitGoal() {
  float heroBubble = 50;
  float goalBubble = 30;
  noFill();
  stroke(236, 72, 45);
  ellipse(heroX, heroY, heroBubble, heroBubble);
  ellipse(goalX, goalY, goalBubble, goalBubble);
  if (dist(heroX, heroY, goalX, goalY) < heroBubble + goalBubble) {
    return true;
  }
  return false;
}

void moveVillainToward(float targetX, float targetY, float howFar) {
  float w = targetX- villainX;
  float h = targetY- villainY;
  float distance = sqrt(w*w +h*h);
  float b = howFar / distance * h;
  float a = howFar /distance * w;
  villainX = villainX + a;
  villainY = villainY + b;
}


void moveVillain() {
  moveVillainToward(heroX,heroY,1);
  //((400+heroX)/2+random(-100, 100), (400+heroY)/2+random(-100, 100), 1);
}

void keyPressed() {

  if (TitleScreen) TitleScreen=false;
  if (WinScreen && key==' ') {
    WinScreen=false;
    setup();
  }


  if (LoseScreen && key==' ') {
    LoseScreen=false;
    setup();
  }

  //press D move right
  if (key == 'd') {
    heroX = heroX + speed;
  }



  //press S move down
  if (key == 's') {
    heroY= heroY + speed;
  }



  // press A move left
  if (key == 'a') {
    heroX= heroX - speed;
  }



  //press W move up
  if (key == 'w') {
    heroY= heroY - speed;
  }
}


void drawHero(float x, float y) {
  //stroke(0);
  //fill(224,178,245);
  //head
  //ellipse(x, y, 20, 20);
  //first ear
  //ellipse(x-8, y+5, 4, 15);
  //second ear
  // ellipse(x+8, y+5, 4, 15);
  image(dog, x, y, 60, 30);
}


void drawVillain(float x, float y) {
  fill(224, 178, 245);
  ellipse(x, y, 30, 30);
}

void drawGoal (float x, float y) {

  image(goal,x,y,40,40);
}




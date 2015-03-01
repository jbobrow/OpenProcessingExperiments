
float heroX;
float heroY;
float villainX;
float villainY;
float speed;
boolean TitleScreen;
boolean LoseScreen;
boolean WinScreen;
PImage bear;

void setup() {
  size(500,500);
  heroX=width/4;
  heroY=height/4;
  villainX=width/2;
  villainY=height/2;
  speed = 5;
  TitleScreen=true;
  WinScreen=false;
  LoseScreen=false;
  bear=loadImage("bear.jpg");
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER);
}

void draw() {
  if (TitleScreen) {
    drawTitle();
  }else if (LoseScreen) {
    drawLoseScreen();
  }else if (WinScreen) {
    drawinScreen();
  }else {
  drawGame();
  }
}

void drawinScreen() {
  background(100,100,255);
}
void drawLoseScreen() {
  background (200,0,0);
}

void drawTitle() {
  background (232, 234, 130);
  stroke(0);
  fill(0);
  textSize(40);
  text("The Grrreat Delivery!",250,100);
  textSize(20);
  text("Press any Key to Play", 250, 200);
  textSize(10);
  text("Terry the Bee needs your help to deliver pizza!",250, 150);
  textSize(5);
}
  
void drawGame() {
   background(200,255,200);
  moveVillain();
  drawVillain(villainX,villainY);
  drawGoal(400,400);
  drawHero(heroX, heroY);
  if(heroHitVillain()) {
    LoseScreen=true;
  }else if (heroHitGoal()) {
    WinScreen=true;
  }
}

boolean heroHitVillain() {
 float heroBubble=15;
 float villainBubble=15;
 noFill();
 stroke (3);
 stroke(236, 272, 45);
 ellipse(heroX, heroY, heroBubble, heroBubble);
 ellipse(villainX, villainY, villainBubble, villainBubble);
 if (dist(heroX, heroY, villainX, villainY)< heroBubble+villainBubble) {
   return true;
  }
  return false;
}


boolean heroHitGoal() {
 float heroBubble=15;
 float goalBubble=15;
 noFill();
 stroke (3);
 stroke(236, 272, 45);
 ellipse(heroX, heroY, heroBubble, heroBubble);
 ellipse(400, 400, goalBubble, goalBubble);
 if (dist(heroX, heroY, 400, 400)< heroBubble+goalBubble) {
   return true;
  }
  return false;
}

void moveVillainToward(float targetX,float targetY,float howFar) {
  float w=targetX - villainX;
  float h=targetY - villainY;
  float distance= sqrt(w*w+h*h);
  float b=5/distance*h;
  float a=howFar/distance*w;
  villainX = villainX +a;
  villainY = villainY +b;
}

void keyPressed() {
  if(TitleScreen) TitleScreen=false;
  if(WinScreen && key==' ') {
    WinScreen=false;
    setup();
  }
  if (LoseScreen && key==' ') {
    LoseScreen=false;
    setup();
  }
  if(key==CODED && keyCode==RIGHT) heroX = heroX+speed;
  if(key==CODED && keyCode==LEFT) heroX= heroX-speed;
  if(key==CODED && keyCode==UP) heroY= heroY-speed;
  if(key==CODED && keyCode==DOWN)heroY= heroY+speed;
}

void moveVillain() {
  moveVillainToward((400+heroX)/2+random(-50,50), (400+heroY)/2+random(-50,50),.7);
}

void drawHero(float x, float y) {
  stroke(0);
  fill(255);
  //wing one
  ellipse(x-3, y-10, 7, 15);
  fill(252,293,54);
   //bod
  ellipse(x, y, 30, 15);
  //wing two
  fill(255);
  ellipse(x+3, y-10, 7, 15);
 
  //nose
  fill(0);
  ellipse(x, y+2, 3, 3);
}

void drawVillain(float x, float y) {
  fill(255, 0, 0);
  triangle(x, y, x-12, y-12, x+12, y-12);
}
  
  
void drawGoal(float x, float y) {
  //fill(202,205,51);
  //ellipse(x, y, 10, 10);
  image(bear,x,y,40,30);
}



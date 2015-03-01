
//Agustey Mongia
//copyright notice

float x=random(200), y=random(200), sz=75;
float bouncex=random(200), bouncey=random(200), bouncesz=75;
float dx1=13, dy1=9;
float easing=0.05;
float x1 = 0;
float xnew, ynew;

int collisionInitiatedFrameCount = 0;

PImage pic1;
PImage pic2;
PImage goal;

int score, startTime, currentTime, lapsedTime, maxTime;

void setup()
{
  size(500, 500);
  imageMode(CENTER);
  textAlign(CENTER);
  pic1 = loadImage("Brazuca.jpg");
  pic2 = loadImage("Cleats.jpg");
  goal = loadImage("brazuca2.jpg");
  textSize(30);
  textAlign(CENTER);
  score = 0;
  startTime = millis();
  maxTime = 30;
};

void draw()
{
  prepScreen();
  moveBouncer();
  moveWrapper();
  checkForCollision();
  showStats();
};

void mouseMoved()
{
  float dx=mouseX-x;
  float dy=mouseY-y;
  float xnew = x+(dx*easing);
  float ynew = y+(dy*easing);
  x=xnew;
  y=ynew;
};

void showStats()
{
  fill(0, 255, 0);
  text("Score: " + score, 250, 50);
  currentTime = millis();
  lapsedTime = int((currentTime-startTime)/1000);
  text("Time Left: " + (maxTime - lapsedTime), width/2, height-50);
  if ((maxTime - lapsedTime) <= 0)
  {
    noLoop();
    text("GAME OVER", width/2, height/2);
  };    
};

void prepScreen()
{
  background(0);
};


void moveBouncer()
{
  image(pic1, bouncex, bouncey, bouncesz, bouncesz);
  bouncex += dx1;
  bouncey += dy1;
  if (bouncex + bouncesz > width || bouncex < 0)
  {
    dx1=-dx1;
  };
  if (bouncey + bouncesz > height || bouncey < 0)
  {
    dy1=-dy1;
  };
};

void moveWrapper()
{
  image(pic2, x, y, sz, sz);
  noFill();
  strokeWeight(10);
  
  if (xnew > width)
  {
    xnew = random(width);
  };
  if (ynew > height);
  {
    ynew = random(0);
  };
};

void checkForCollision()
{
  float d=dist(bouncex, bouncey, x, y);
  if (d<50)
  {
    if (collisionInitiatedFrameCount == 0 || (frameCount - collisionInitiatedFrameCount > 20)){
     collisionInitiatedFrameCount = frameCount; 
     image(goal, width/2, height/2, width, height);
     score+=1;
    }
  };
};




float jrX, jrY;  //position of jr
float jrdX, jrdY;

float dotX, dotY;  //position of dot
float dotdX, dotdY;

int mouth;  //open and close mouth
int open1, open2;
int close1, close2;

int nom;  //number of dots eaten
int time;
int timeLeft;  //time left

PFont f1;

void setup()
{
  size(400, 400);
  
  jrX = width*.5;
  jrY = height*.5;
  
  jrdX = 5;
  jrdY = 5;
  
  dotdX = 1.5;
  dotdY = 2;
  
  time = 30;
  
  f1 = loadFont("f1.vlw");
  textFont(f1);
}

void draw()
{
  background(0);
  
  jr();
  moveJr();
  
  dots();
  moveDots();
  
  checkCollision();
  countDown();
  showStats();
  
  gameOver();
}

void jr()
{
  noStroke();
  fill(255, 255, 0);
  if(mouth % 5 == 1 || mouth % 5 == 2)
  {
    arc(jrX, jrY, width*.08, width*.08, radians(close1), radians(close2), PIE);
  }
  else
  {
    arc(jrX, jrY, width*.08, width*.08, radians(open1), radians(open2), PIE);
  }
}

void moveJr()
{
  mouth ++;
  //draw jr facing right, left, up, or down
  if(keyCode == RIGHT)
  {
    jrX += jrdX;
    
    open1 = 30;  //angles for jr's open mouth
    open2 = 330;
    
    close1 = 5;  //angles for jr's closed mouth
    close2 = 355;
  }
  else if(keyCode == LEFT)
  {
    jrX -= jrdX;
    
    open1 = -150;
    open2 = 150;
    
    close1 = -175;
    close2 = 175;
  }
  else if(keyCode == UP)
  {
    jrY -= jrdY;
    
    open1 = -60;
    open2 = 240;
    
    close1 = -85;
    close2 = 265;
  }
  else if(keyCode == DOWN)
  {
    jrY += jrdY;
    
    open1 = -240;
    open2 = 60;
    
    close1 = -265;
    close2 = 85;
  }
  
  //wrap jr on the screen
  if(jrX < 0)
  {
    jrX = width;
  }
  if(jrX > width)
  {
    jrX = 0;
  }
  
  if(jrY < 0)
  {
    jrY = height;
  }
  if(jrY > height)
  {
    jrY = 0;
  }
}

void dots()
{
  fill(255);
  noStroke();
  ellipse(dotX, dotY, width*.04, width*.04);
}

void moveDots()
{
  dotX += dotdX;
  if(dotX > width || dotX < 0)
  {
    dotdX = -dotdX;
  }
  
  dotY += dotdY;
  if(dotY > height || dotY < 0)
  {
    dotdY = -dotdY;
  }
}

void checkCollision()
{
  float d = dist(jrX, jrY, dotX, dotY);
  if(d < 15)
  {
    fill(255, 255, 0);
    rect(0, 0, width, height);
    
    fill(0);
    textFont(f1, 20);
    textAlign(CENTER);
    text("NOM!!!", width*.5, height*.5);
    nom++;
  }
}

void countDown()
{
  timeLeft = time-(millis()/1000);
}

void showStats()
{
  textFont(f1, 15);
  fill(255, 255, 255);
  textAlign(LEFT);
  text("Get as many 'noms' as possible in the given time!", width*.05, height*.93);
  text("Noms: " + nom, width*.05, height*.85);
  text("Time Left: " + timeLeft, width*.05, height*.89);
}

void gameOver()
{
  if(timeLeft <= 0)
  {
    fill(0);
    rect(0, 0, width, height);
    
    fill(255, 255, 0);
    textFont(f1, 30);
    textAlign(CENTER);
    text("GAME OVER", width*.5, height*.5);
    
    textFont(f1, 20);
    text("Noms: " + nom, width*.5, height*.7);
    
    noLoop();
  }
}





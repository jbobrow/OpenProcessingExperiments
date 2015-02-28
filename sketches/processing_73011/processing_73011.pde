
// Homework 7
// Hyunjook
// Hyunjook 2012 copyright

float ax, ay, aSize, axSpeed, aySpeed;
float bx, by, bSize, bxSpeed, bySpeed;

int count;
int gamePhase;

PImage a;
PImage b;
PImage bg;
PImage end;

void setup(){
  size(600,600);
  smooth();
  textSize(10);
  textAlign(CENTER);
  imageMode(CENTER);
  
  count = 0;
  gamePhase = 0;
  
  bg = loadImage("hellokittybackground.jpg");
  end = loadImage("heart.png");
  a = loadImage("hello_kitty2.png");
  
  ax = random(width);
  ay = random(height);
  aSize = 150;
  
  b = loadImage("hello_kitty.png");
  
  bx = random(width);
  by = random(height);
  bSize = 120;
  
  axSpeed = 6;
  aySpeed = 6;
  
  bxSpeed = 6;
  bySpeed = 6;
}

void draw(){
  background(234,76,142);
  if (gamePhase == 0)
  {
    instructions();
  }
  else if (gamePhase == 1)
  {
    gameStart();
  }
}

void gameStart(){
  BackImg();
  moveKitty();
  drawKitty();
  moveKitty2();
  drawKitty2();
  Collision();
  Score();
  endGame();
}

void BackImg()
{
  image(bg, 300, 300, width, height);
}

void instructions()
{
  textAlign(CENTER);
  textSize(20);
  text("Move red Hello kitty to send mails to blue Hello Kitty friend!", width/2,height/2-30);
  text("Press any key to start!", width/2, height/2);
} 

void keyPressed()
{
  if (gamePhase == 0);
  {
    gamePhase = 1;
  }
}

void drawKitty(){
  smooth();
  image(a, ax, ay, aSize, aSize);
}

void moveKitty(){
  ax = ax + axSpeed;
  ay = ay + aySpeed;
  if (ax+(aSize/2) > width)
  {
    axSpeed = -axSpeed;
  }
  else if (ax-(aSize/2) < 0)
  {
    axSpeed = -axSpeed;
  }
  
  ay = ay + aySpeed;
  if (ay+(aSize/2) > height)
  {
    aySpeed = -aySpeed;
  }
  else if (ay-(aSize/2) < 0)
  {
    aySpeed = -aySpeed;
  }
}

void drawKitty2()
{
  image (b, bx, by, bSize, bSize);
}
  
void moveKitty2()
{
  bx += bxSpeed;
  if (bx > width + bSize/2)
  {
    bx = bSize/2;
  }
  else if (bx < bSize/2)
  {
    bx = width - bSize/2;
  }
  
  by += bySpeed;
  if (by > height + bSize/2)
  {
    by = bSize/2;
  }
  else if (by < bSize/2)
  {
    by = height - bSize/2;
  }
  
  if (bx <= 0 || bx >= width || by <= 0 || by >= height)
  {
    count = 0;
  }
}
  
void mouseDragged()
{
  if (mouseX > pmouseX)
  {
    bxSpeed+=0.5;
  }
  else if (mouseX < pmouseX)
  {
    bxSpeed-=0.5;
  }
  if (mouseY > pmouseY)
  {
    bySpeed+=0.5;
  }
  else if (mouseY < pmouseY)
  {
    bySpeed-=0.5;
  }
}

void Collision()
{
  float d = dist(ax, ay, bx, by);
  if (d <= bSize/2)
  {
    count++;
    background(234,76,142);
    bx = random(40, width-40);
    by = random(40, height-40);
    bxSpeed = random(-5, 5);
    bySpeed = random(-5, 5);
  }
}

void Score()
{
  fill(0);
  text("Number of letters sent: " + count, 150, 50);
  text("Time: " + millis()/1000, 150, 30);
}

void endGame()
{
  if (count == 10)
  {
    background(234,76,142);
    textSize(20);
    textAlign(CENTER);
    text("You sent ten letters! Good job!", width/2, height/2+180);
    image(end, 300, 300, width/2, height/2);
    noLoop();
  }
}
  


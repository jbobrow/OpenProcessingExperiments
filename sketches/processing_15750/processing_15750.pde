
/*ESCAPE FROM DANGER
 By XiaoLin Li
 started on 10/29/10
 */

//test
int test1,test2;

//time
int m,startTime,timeLimit,timeRemaining,secondsRemaining;


//key controls
boolean wPressed, aPressed, sPressed, dPressed;
boolean upPressed, leftPressed, downPressed, rightPressed;

//star
int starx,stary,starx2,stary2,starx3,stary3,starx4,stary4;
boolean star1,star2,star3,star4;

//coordinate
int x,y,p,q;

//cordinate of arrow
float arrowx, arrowy,arrowx2,arrowy2;

//other stuff
int speed;
int shake,screenNumber;
PImage cat,mouse,arrow,star,win,lose;


//font
PFont font;

void setup()
{
  size(600,600);
  smooth();
  noStroke();
  rectMode(CENTER);
  imageMode(CENTER);
  font = loadFont("ShowcardGothic-Reg-48.vlw");
  x = 9*width/10;
  y = width/10;
  cat = loadImage("cat.gif");
  mouse = loadImage("mouse.gif");
  arrow = loadImage("arrow.gif");
  star = loadImage("star.gif");
  win = loadImage("win.gif");
  lose = loadImage("lose.gif");
  starx = starx2 = stary = stary3 = 25;
  stary2= starx3 = starx4 = stary4 = 575;
  arrowy2 = 150;
  arrowx2 = 200;
  arrowy = 250;
  screenNumber = 0;
  speed = 3;
  star1 = star2 = star3 = star4 = true;
  test1 = x;
  test2 = y;
  p = 200;
  q = 400;
}
void draw()
{
  if (screenNumber == 0)
  {
    title();
  }
  else if (screenNumber == 1)
  {
    movePlayers();
    game();
  }
  else if (screenNumber == 4)
  {
    youWin();
  }
  else if(screenNumber ==5)
  {
    youLose();
  }
}



void game()
{
  background(255);
  fill(100,100,100);
  image(cat,p,q);
  image(mouse,x,y);
  image(arrow,arrowx,arrowy);
  image(arrow,arrowx2,arrowy2);
  arrowx -= 3;
  arrowx2 -=3;
  if (arrowx < 20)
  {
    arrowx = width;
  }
  if (arrowx2 <20)
  {
    arrowx2 = width;
  }
  if (star1 == true) image(star,starx,stary);
  if (star2 == true) image(star,starx2,stary2);
  if (star3 == true) image(star,starx3,stary3);
  if (star4 == true) image(star,starx4,stary4);
  if(dist(x,y,starx,stary) < 40)
  {
    star1 =false;
  }
  if(dist(x,y,starx2,stary2) < 40)
  {
    star2 =false;
  }
  if(dist(x,y,starx3,stary3) < 40)
  {
    star3 =false;
  }
  if(dist(x,y,starx4,stary4) < 40)
  {
    star4 =false;
  }
  if(star1==false&&star2==false&&star3==false&&star4==false)screenNumber = 4;

if(abs(arrowx - x)< 43 && abs(arrowy - y) < 20) screenNumber = 5;
if(abs(arrowx2 - x)< 43 && abs(arrowy2 - y) < 20) screenNumber = 5;
if(dist(x,y,p,q)<53) screenNumber = 5;

m = millis();
timeLimit = startTime+40000;
timeRemaining = timeLimit - m;
secondsRemaining = timeRemaining/1000;
text(secondsRemaining,280,50);

if(secondsRemaining <= 0)
{
  screenNumber = 5;
}
}


void youWin()
{
  image(win,300,300);
  if(mousePressed) 
  {
   screenNumber = 1;
  star1 = star2 = star3 = star4 = true;
  x = (int)random(200,400);
  y = (int)random(100,400);
  p = 200;
  q = 400;
  startTime = millis();
  }
}

void youLose()
{
  image(lose,300,300);
  if(mousePressed) 
  {
   screenNumber = 1;
  star1 = star2 = star3 = star4 = true;
  x = (int)random(200,400);
  y = (int)random(100,400);
  p = 200;
  q = 400;
  startTime = millis();
  }
}



void title()
{
  background(0);
  textSize(30);
  fill(250,0,0);
  text("ESCAPE", 40,40);
  text("FROM",150,150);
  text("DANGER", 350,350);
  fill(23,227,184);
  text("click to PLAY", 100,500);
  fill(250,200,0);
  ellipse(150,350,100,100);
  fill(0);
  ellipse(130,340,20,20);
  ellipse(170,340,20,20);
  rect(150,365,shake+5,shake);

  shake = (int)random(7,35);
  if (mousePressed) {screenNumber = 1; startTime = millis();}
}


void movePlayers()
{
  if (wPressed) y -= speed;
  if (aPressed) x -= speed;
  if (sPressed) y += speed;
  if (dPressed) x += speed;
  if (rightPressed) p += 0.6*speed;
  if (leftPressed)  p -= 0.6*speed;
  if (upPressed)    q -= 0.6*speed;
  if (downPressed)  q += 0.6*speed;
  if(x>width) x-=5;
  if(x<0) x +=5;
  if(y>height) y-=5;
  if(y<0) y+=5;
  if(p>width) p-=2;
  if(p<0) p+=2;
  if(q>width) q-=2;
  if(q<0) q+=2;
  if(dist(p,q,starx,stary)<100)
  {
    p+=2;
    q+=2;
  }
  if(dist(p,q,starx4,stary4)<100)
  {
    p-=2;
    q-=2;
  }
  if(dist(p,q,starx2,stary2)<100)
  {
    p+=2;
    q-=2;
  }
  if(dist(p,q,starx3,stary3)<100)
  {
    p-=2;
    q+=2;
  }
}

void keyPressed()
{
  if (key == 'w') wPressed = true;
  if (key == 'a') aPressed = true;
  if (key == 's') sPressed = true;
  if (key == 'd') dPressed = true;
  if (keyCode == RIGHT) rightPressed = true;
  if (keyCode == LEFT)  leftPressed = true;
  if (keyCode == UP)    upPressed = true;
  if (keyCode == DOWN)  downPressed = true;
}


void keyReleased()
{
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
  if (keyCode == RIGHT) rightPressed = false;
  if (keyCode == LEFT)  leftPressed = false;
  if (keyCode == UP)    upPressed = false;
  if (keyCode == DOWN)  downPressed = false;
}




PFont font;
int score=0;
int timer=15;
int give = 100;
int timeLast = 0;
float enemyX=0;
float enemyQ=0;
float enemyW=0;
float enemyY=0;

int numFrames=6;
int frame=0;
PImage[] images= new PImage[numFrames];


PImage a;
PImage b;
PImage c;
float i=0;
float posX, posY;
float speedX, speedY;
float posY2, speedY2;
float posY3, speedY3, speedY4;
int radius;
//int x= mouseX;
//int y=mouseY; 
float ix=width-mouseX;
float iy=height-mouseY;




void setup() {



  timeLast=second();
  a= loadImage("Cloudy_Day.jpg");
  b=loadImage("plane.png");
  c=loadImage("lightning.png");
  size (600, 500);
  noStroke();
  frameRate(30);
  enemyX=random(500);
  enemyQ=random(300,500);
  enemyW=0;
  enemyY=random(400);
  posX=520;
  posY=0;
  speedX=10;
  speedY=10;
  posY2=0;
  speedY2=5;
  posY3=0;
  speedY3=30;
  speedY4=2;


  images[0] =loadImage("tornado.png");
  images[1] =loadImage("tornado1.png");
  images[2] =loadImage("tornado2.png");
  images[3] =loadImage("tornado3.png");
  images[4] =loadImage("tornado4.png");
  images[5] =loadImage("tornado5.png");
  noCursor();
}


void draw() {


  background(a);
  rain();


text("SCORE: "+score, 320, 20);
  posY -=1;
  if (posY>700)
  {
    posY=random(200);
  }
  if (posY2>1500)
  {
    posY2=random(150);
  }
  if (posY3>1600)
  {
    posY3=50;
  }
  if (enemyX>600)
  {
    enemyX=0;
    score-=1;
  }


  if (numFrames<=frame)
  {
    frame=0;
  }  

  if (timer>0) 
  { 
    game();
  }
  
}


void game()
{
  image(images[frame], mouseX-100, mouseY-100);
  image(c,enemyQ,enemyW,give,give);
  if (second()!=timeLast) 
  { 
    timeLast=second(); 
    timer-=1;
  }
  fill(200, 10, 10);
  text("SCORE: "+score, 320, 20); 
  text("TIMER: "+timer, 520, 20);

  if (enemyX<=-50) {
    speedY4=speedY4+1;
  }
  enemyX+=speedY4;
  image (b, enemyX, enemyY, give, give);


 
}


void rain()
{
  fill(25, 200, 255);
  ellipse(random(posX), random(posY), 10, 30);
  posY+=speedY;
  fill(25, 200, 255);
  ellipse(posX, posY, 10, 30);
  posY2+=speedY2;
  ellipse(posX/10, posY2/2, 10, 30);
  posY3+=speedY3;
  ellipse(posX/2, posY3/2, 5, 20);
}


void mousePressed ()
{
  if (mouseX<enemyX+give && mouseX>enemyX-give) { 
    if (mouseY<enemyY+give && mouseY>enemyY-give) { 
      score+=1;
      enemyX+=speedY4;
      enemyX=-100; 
      enemyY=random(400);
    }
  }
  if (mouseX<enemyQ+give && mouseX>enemyQ-give) { 
    if (mouseY<enemyW+give && mouseY>enemyW-give) { 
      score-=1;
   enemyQ=random (300,500);
   enemyW=0;
    }
  }
  frame++;
}



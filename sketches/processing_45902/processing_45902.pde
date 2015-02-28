
PImage figure, bad, good, life, other1, other,bg;
float x, y, bx, by, gx, gy, o1x, o1y, ox, oy;
boolean leftpress = false, rightpress = false;
boolean stop = true;

int screenDisplay;
int score;
int lifes = 3;

void setup()
{

  size(400, 400);
  smooth();
  figure = loadImage("BannedStory_image_figure.png");
  bad = loadImage("BannedStory_image_bad.png");
  good = loadImage("BannedStory_image_good.png");
  life = loadImage("BannedStory_image_life.png");
  other1 = loadImage("BannedStory_image_other1.png");
  other = loadImage("BannedStory_image_other.png");
  bg = loadImage("map.jpg");
  
  
  
  y = 350;
  x = 0;
  
  bx = random(50, 250);
  by = 2;
  
  gx = random(250, 800);
  gy = 2;
  
  o1x = random(-600,600);
  o1y = 3;
  
  ox = random(-800,800);
  oy = 4;


  screenDisplay = 1;
}

void draw()
{
  background(0);
  
  if (screenDisplay == 1)
  {
    intro();
    score = 0;
  }

  else if (screenDisplay == 2)
  {
    play();
    scores();
    checklifes();
    Move();
    

    image(figure, x, y);
    fill(132, 182, 242);
    noStroke();
    if (x>415) x = -15;
    if (x<-15) x = 415;
  }

  else if (screenDisplay == 3)
  {
    end();
  }

}



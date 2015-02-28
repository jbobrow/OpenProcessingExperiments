
int threshold;
int prevMillis = 0;

PImage writing;
PImage sleeponkitty;
PImage heartmask;
PImage LGM;
PImage lovers;
PImage pidou;
PImage pinkdog;
PImage rothko;
PImage rubbish;
PImage wallstreet;


void setup()
{
  size(600, 400);
  writing = loadImage("letter.jpg");
  sleeponkitty = loadImage("sleeponkitty.jpg");
  heartmask = loadImage("nohellbelowus.png");
  LGM = loadImage("LGM.jpg");
  lovers = loadImage("lovers.jpg");
  pidou = loadImage("pidou.jpg");
  pinkdog = loadImage("pinkdog.jpg");
  rothko = loadImage("rothko.jpg");
  rubbish = loadImage("rubbish.jpg");
  wallstreet = loadImage("wallstreet.jpg");  


  smooth();
  imageMode(CENTER);
  noStroke();
  noFill();
}

void draw()
{ 
  float disHeart = dist(width/2, height/2, mouseX, mouseY);

  if (disHeart >= 75)
  { 
    threshold = 0;

    if (millis() - prevMillis >= threshold)
    {
      prevMillis += threshold; 

      float num = int(random(1, 9));

      if (num == 1)
      {
        image(sleeponkitty, width/2, height/2);
        heartmask.mask(sleeponkitty);
        image(heartmask, width/2, height/2);
      }
      if (num == 2)
      {
        image(writing, width/2, height/2); 
        heartmask.mask(writing);
        image(heartmask, width/2, height/2);
      }
      if (num == 3)
      {
        image(LGM, width/2, height/2); 
        heartmask.mask(LGM);
        image(heartmask, width/2, height/2);
      }
      if (num == 4)
      {
        image(lovers, width/2, height/2); 
        heartmask.mask(lovers);
        image(heartmask, width/2, height/2);
      }
      if (num == 5)
      {
        image(pidou, width/2, height/2); 
        heartmask.mask(pidou);
        image(heartmask, width/2, height/2);
      }
      if (num == 6)
      {
        image(pinkdog, width/2, height/2); 
        heartmask.mask(pinkdog);
        image(heartmask, width/2, height/2);
      }
      if (num == 7)
      {
        image(rothko, width/2, height/2); 
        heartmask.mask(rothko);
        image(heartmask, width/2, height/2);
      }
      if (num == 8)
      {
        image(rubbish, width/2, height/2); 
        heartmask.mask(rubbish);
        image(heartmask, width/2, height/2);
      }
      if (num == 9)
      {
        image(wallstreet, width/2, height/2); 
        heartmask.mask(wallstreet);
        image(heartmask, width/2, height/2);
      }
    }
  }
}



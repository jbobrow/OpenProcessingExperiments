

int timer = 0;
int headX = 50;  
SpriteObject pictures[] = new SpriteObject[5];
int bodyX = 45;
int headX2 = 460;
int bodyX2 = 455;


void setup()
{
  size(500, 500);
  background(0, 150, 0);
  pictures[0] =  new SpriteObject("Pie.png");
  pictures[1] =  new SpriteObject("Bear.png");
  pictures[2] = new SpriteObject("Flowers1.png");
  pictures[3] = new SpriteObject("Flowers2.png");
  pictures[4] = new SpriteObject("Flowers3.png");
}

void draw()
{
  timer++;
  background(0, 150, 0);
  showFlowers();
  sky();
  fillTrees();
  sideWalk();
  personOne();
  personTwo();
  showBear();
}

class SpriteObject
{
  float x = 250.0;
  float y = 250.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;

  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
  void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }

    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

void sky()
{
  if (timer < 850)
  {
    fill(#030CFF);
    rect(0, 0, 600, 75);
  }

  if (timer > 850 && timer < 1250)
  {
    fill(#181FB9);
    rect(0, 0, 600, 75);
  }

  if (timer > 1250)
  {
    fill(#141762);
    rect(0, 0, 600, 75);
  }
}

void fillTrees()
{
  for (int i = 10; i <= 1000; i+=50)
  {
    fill(100, 255, 5);
    ellipse(i, 50, 40, 40);
  }

  for (int i = 0; i <= 1000; i +=50)
  {
    fill(#4D1A1A);
    rect(i, 70, 20, 50);
  }

  for (int i = 30; i <= 1000; i+=50)
  {
    fill(100, 255, 5);
    ellipse(i, 65, 40, 40);
  }

  for (int i = 20; i <= 1000; i +=50)
  {
    fill(#4D1A1A);
    rect(i, 85, 20, 50);
  }

  for (int i = 25; i <= 1000; i+=50)
  {
    fill(100, 255, 5);
    ellipse(i, 45, 40, 40);
  }

  for (int i = 15; i <= 1000; i +=50)
  {
    fill(#4D1A1A);
    rect(i, 65, 20, 50);
  }
}

void sideWalk()
{
  fill(#C1C1C1);
  for (int i = 0; i < 500; i +=50)
  {
    rect(i, 400, 200, 60);
  }
}

void personOne()
{
  fill(255);
  if (timer <= 300)
  {
    headX += 1;
    bodyX += 1;
  }
  if (timer > 350 && timer < 450)
  {
    textSize(20);
    fill(0);
    text("It's such a nice day today", 250, 250);
  }

  if (timer > 450 && timer < 650)
  {
    textSize(20);
    fill(0);    
    text("I sure could go for a piece of pie", 150, 250);
  }

  if (timer > 650 && timer < 850)
  {
    headX ++;
    bodyX ++;
  }

  if (timer > 850 && timer < 1050)
  {
    headX = 25;
    bodyX = 20;
  }
  if (timer > 900 && timer < 1000)
  {
    textSize(20);
    fill(0);
    text("I think I smell some pie up ahead, i need to hurry up", 0, 250);
  }

  if (timer > 1050 && timer < 1250)
  {
    headX += 3;
    bodyX += 3;
  }

  if (timer > 1250 && timer < 1400)
  {
    headX = 25;
    bodyX = 20;
  }
  if (timer > 1350 && timer < 1450)
  {
    textSize(18);
    fill(0);
    text("Hmmmm, the smell is getting stronger, but still no pie.", 0, 250);
  }

  if (timer > 1400 && timer < 1600)
  {
    headX +=3;
    bodyX +=3;
  }

  if (timer > 1600 && timer < 2000)
  {
    headX = 25;
    bodyX = 20;
  }

  if (timer > 1650 && timer < 1750)
  {
    textSize(20);
    fill(0);
    text("HEY!!!! Finally some pie!!", 0, 250);
  }

  if (timer > 1600)
  {
    showPie();
  }

  if (timer > 1800 && timer < 1900)
  {
    textSize(20);
    fill(0);
    text("This is your wife's pie?", 0, 250);
  }

  if (timer > 2000 && timer < 2100)
  {
    headX ++;
    bodyX ++;
  }

  if (timer > 2050 && timer < 2150)
  {
    textSize(20);
    fill(0);
    text("Well maybe we can share it, it looks so delicious!", 0, 250);
  }

  if (timer > 2500)
  {
    textSize(20);
    fill(0);
    text("Ahhh run away", 0, 300);
    headX -=3;
    bodyX -=3;
  }

  fill(255); 
  ellipse(headX, 350, 50, 50);
  fill(0, 0, 255);
  rect(bodyX, 375, 10, 60);
}

void personTwo()
{
  if (timer > 1700)
  {
    fill(255);
    ellipse(headX2, 350, 50, 50);
    fill(255, 0, 0);
    rect(bodyX2, 375, 10, 60);
  }

  if (timer > 1700 && timer < 1800 )
  {
    fill(255);
    text("Yay I found my wifes pie!!", 250, 300);
  }

  if (timer > 1900 && timer < 2000)
  {
    fill(255);
    text("Yeah, some wild bear stole it, we should be careful", 0, 300);
  }

  if (timer > 2000 && timer < 2200)
  {
    headX2--;
    bodyX2--;
  }
  if (timer > 2150 && timer < 2250)
  {
    fill(255);
    text("Yeah, I can share.", 150, 300);
  }
  if (timer > 2500)
  {
    fill(255);
    text("Ahhh run away", 150, 300);
    headX2+=3;
    bodyX2+=3;
  }
}

void showPie()
{
  pictures[0].x = width/2;
  pictures[0].y = height/3;
  pictures[0].w = 100;
  pictures[0].h = 100;
  pictures[0].render();
}

void showBear()
{
  if (timer >2500)
  {
    pictures[1].x = width/5;
    pictures[1].y = height/3;
    pictures[1].w = 150;
    pictures[1].h = 150;
    pictures[1].render();
  }
}

void showFlowers()
{
  if (timer > 0 && timer < 850)
  {
    for (int i = 0; i < 800; i+=50)
    {
      pictures[2].x = i;
      pictures[2].y = 200;
      pictures[2].w = 80;
      pictures[2].h = 80;
      pictures[2].render();
    }
    for (int i = 0; i < 800; i+=50)
    {
      pictures[2].x = i;
      pictures[2].y = 250;
      pictures[2].w = 80;
      pictures[2].h = 80;
      pictures[2].render();
    }
    for (int i = 0; i < 800; i+=50)
    {
      pictures[2].x = i;
      pictures[2].y = 300;
      pictures[2].w = 80;
      pictures[2].h = 80;
      pictures[2].render();
    }
  }

  if (timer > 850 && timer < 1250)
  {
    for (int i = 0; i < 800; i+=50)
    {
      pictures[3].x = i;
      pictures[3].y = 200;
      pictures[3].w = 80;
      pictures[3].h = 80;
      pictures[3].render();
    }
    for (int i = 0; i < 800; i+=50)
    {
      pictures[3].x = i;
      pictures[3].y = 250;
      pictures[3].w = 80;
      pictures[3].h = 80;
      pictures[3].render();
    }
    for (int i = 0; i < 800; i+=50)
    {
      pictures[3].x = i;
      pictures[3].y = 300;
      pictures[3].w = 80;
      pictures[3].h = 80;
      pictures[3].render();
    }
  }


  if (timer > 1250 && timer < 1600)
  {
    for (int i = 0; i < 800; i+=50)
    {
      pictures[4].x = i;
      pictures[4].y = 200;
      pictures[4].w = 80;
      pictures[4].h = 80;
      pictures[4].render();
    }
    for (int i = 0; i < 800; i+=50)
    {
      pictures[4].x = i;
      pictures[4].y = 250;
      pictures[4].w = 80;
      pictures[4].h = 80;
      pictures[4].render();
    }
    for (int i = 0; i < 800; i+=50)
    {
      pictures[4].x = i;
      pictures[4].y = 300;
      pictures[4].w = 80;
      pictures[4].h = 80;
      pictures[4].render();
    }
  }
}




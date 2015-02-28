
PImage myImage;
PImage myImage2;
Star myStar, myStar2, myStar3, myStar4, myStar5, myStar6, myStar7;
RedHeart [] myHeart = new RedHeart [10];

void setup()
{
  size (400,400);
  myImage = loadImage ("minnie.jpg");
  myImage2 = loadImage ("heart.png");
  myStar = new Star(50, 100);
  myStar2 = new Star(30, 325);
  myStar3 = new Star(150, 125);
  myStar4 = new Star(350, 50);
  myStar5 = new Star(300, 200);
  myStar6 = new Star(275, 285);
  myStar7 = new Star(375, 380);
  for (int i = 0; i < myHeart.length; i ++)
  {
    myHeart[i] = new RedHeart (myImage2, int (random(60,175)), int(random(125,200)),
    50, 50,int (random(1,3)));
  }
    
}

void draw()
{
  background (255);
  image (myImage, 50,150,250,250);
  myStar.display();
  myStar2.display();
  myStar3.display();
  myStar4.display();
  myStar5.display();
  myStar6.display();
  myStar7.display();
  for (int i = 0; i < myHeart.length; i ++)
  { 
    myHeart[i].display();
    myHeart[i].rise();
  }
}

class Star
{
  int xpos;
  int ypos;
  
  Star(int tempx, int tempy)
  {
    xpos = tempx;
    ypos = tempy; 
  }
  
  void display()
  {
    noStroke();
    fill (random (180,255), random(150, 255), 255);
    ellipse (xpos, ypos, 20,20); 
  }
}

class RedHeart
{
  PImage myHeart;
  int x, y, w, h;
  int speed;
  
  RedHeart(PImage tempheart, int tempx, int tempy, int tempw, int temph, int tempspeed)
  {
    myHeart = tempheart;
    x = tempx;
    y = tempy;
    w = tempw;
    h = temph;
    speed = tempspeed;
  }
  
  void display ()
  {
    image (myHeart, x, y, w, h);
  }
  
  void rise ()
  {
    y = y - speed;
  }
}
    




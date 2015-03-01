
boolean title=true;
PImage p_forward;
PImage p_backward;
PImage p_blast;
PImage p_basic;
PImage shot;
PImage enemy1;
PImage enemy2;
PImage enemy3;
PImage frieza;
PImage background;
PImage menu;
PImage win;
PImage lose;

float enemy1X;
float enemy1Y;
float enemy2X;
float enemy2Y;
float enemy3X;
float enemy3Y;
float friezaX;
float friezaY;
float shot;
float shotX;
float shotY;
float shot_speed;

int shotFired;
int score=0;
int miss=3;

void setup()
{
  size (500,500);
  frameRate(10);
  p_forward=loadImage("bardock_forward.png");
  p_backward=loadImage("bardock_backward.png");
  shot=loadImage("bardock_shot.png");
  p_basic=loadImage("bardock_basic.png");
  p_blast=loadImage("bardock_blast.png");
  enemy1=loadImage("frieza_soldier1.jpg");
  enemy2=loadImage("frieza_soldier2.jpg");
  enemy3=loadImage("frieza_soldier3.jpg");
  frieza=loadImage("frieza_sprite.png");
  background=loadImage("background.jpg");
  menu=loadImage("menu.png");
  win=loadImage("win.jpg");
  lose=loadImage("lose.png");
  
  shot_speed=50;
  enemy1X = width+100;
  enemy1Y = random(height);
  enemy2X = width+100;
  enemy2Y = random(height);
  enemy3X = width+100;
  enemy3Y = random(height); 

}

void draw()
{
  if(title==true)
  {
    image(menu, 0, 0, width, height);
    textSize(24);
    fill(#21E2EA);
    text("Press A/a to Change the Future!!!", 90, 250);
    if (key == 'a' || key == 'A')
    {
    noCursor();
    imageMode(CORNER);
    image(background, 0, 0, width, height);
    imageMode(CENTER);
    image (enemy1, enemy1X, enemy1Y, 35, 50);
    image (enemy2, enemy2X, enemy2Y, 35, 50);
    image (enemy3, enemy3X, enemy3Y, 35, 50);

    
    
    enemy1X = enemy1X-15;
    enemy2X = enemy2X-15;    
    enemy3X = enemy3X-15;
    
    if(enemy1X<0)
    {
      enemy1X=width+100;
      enemy1Y=random(height);
      miss--;
    }
        if(enemy2X<0)
    {
      enemy2X=width+100;
      enemy2Y=random(height);
      miss--;
    }
        if(enemy3X<0)
    {
      enemy3X=width+100;
      enemy3Y=random(height);
      miss--;
    }
    if(shotFired<1)
    {
      shotX=mouseX+30;
      shotY=mouseY;
    }
    else
    {
      shotX=shotX+shot_speed;
    }

    if((shotX>=enemy1X-50&&shotX<=enemy1X+50&&shotY>=enemy1Y-50&&shotY<=enemy1Y+50)) 
    {
      score++;
      enemy1X = width+50;
      enemy1Y = random(height);
    }
    if((shotX>=enemy2X-50&&shotX<=enemy2X+50&&shotY>=enemy2Y-50&&shotY<=enemy2Y+50))
   {
     score++;
      enemy2X = width+50;
      enemy2Y = random(height);    
   }
    if((shotX>=enemy3X-50&&shotX<=enemy3X+50&&shotY>=enemy3Y-50&&shotY<=enemy3Y+50))
    {
      score++;
      enemy3X = width+50;
      enemy3Y = random(height);
    }
    image (p_forward, mouseX+5, mouseY);
    image(shot, shotX, shotY, 25, 25);
    textSize(18);
    fill(#61DB0B);
    text("score: "+score, 10, 30);
  }
  if(score>100)
  {
    image(win, 250, 250, width, height);
    fill(#172C09);
    textSize(24);
    text("YOU'VE CHANGED THE FUTURE!!", 100, 400);
    noLoop();
    }
    /*freizaX = width+200;
    friezaY = random(height);
    image (frieza, friezaX, friezaY, 35, 45);
    freizaX = 450;
    freizaY = 250;
    (shotX>=friezaX-50&&shotX<=frieza1+50&&shotY>=friezaY-50&&shotY<=friezaY+50))
  }*/
    if(miss==0)
    {
    image(lose, 250, 250, width, height);
    fill(#2C0606);
    text("GAME OVER", 300, 150);
    noLoop();
    }
}
}
    

  



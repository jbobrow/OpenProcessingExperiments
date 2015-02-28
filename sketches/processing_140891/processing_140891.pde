
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/139075*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float x = 80;
float y = 80;
float x2 = 80;
float y2 = 80;
float w = 80;
float h = 80;
float mouseDist = 0;
float r = 100;
float timer = 30;  
float speedX = 1;
float speedY = 1;
float speedX2 = 1;
float speedY2 = 1;

int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;

int ground = 15;

PImage pic;
PImage winpic;
PImage losepic;
PImage HUD;
 
void setup() 
{
  size(600, 600);
  textSize(20);
  ellipseMode(CORNER);
  pic = requestImage("playful_background.jpg");
  winpic = requestImage("happy-colorful-background.jpg");
  losepic = requestImage("a-sad-darkness-black.jpg");
  HUD = requestImage("HUD.png");
 
}
 
void draw() 
{ 
  if (gamestate == PLAY_STATE)
  {
    mouseDist = dist(x, y, mouseX, mouseY); 
    image(pic, 0, 0, width, height);
    image(HUD, 0,0, 200, 110);
    timer = timer - (1.0 / 30.0);
    fill(0, 0, 255);
    ellipse(x, y, w, h);
    
    fill(0);  
    text("Hit ground: " + ground, 30, 40);
    text("Timer: " + (int)timer, 30, 60);
    
    if (timer < 20)
    {
      fill(255,0,0);
      speedY2 = speedY2 + 0.5;
      ellipse(x2, y2, w, h);
      if ((x2 > width - w) || (x2 <= 0)) 
      {
        speedX2 = -speedX2;   
      }
      
      if (y2 > height - h) 
      {
        y2 = height - h;
        speedY2 = speedY2 * -0.9;
        ground = ground - 1;
      }
      else if (y2 <= 0) 
      {
        speedY2 = -speedY2;
      }
    }
    
    speedY = speedY + 0.5;
 
    x = x + speedX;
    y = y + speedY;
    x2 = x2 + speedX2;
    y2 = y2 + speedY2;
  
 
    if ((x > width - w) || (x <= 0)) 
    {
      speedX = -speedX;   
    }
 
    if (y > height - h) 
    {
      y = height - h;
      speedY = speedY * -0.9;
      ground = ground - 1;
    }
    else if (y <= 0) 
    {
      speedY = -speedY;
    }
    if (timer < 0)
    {
      if (ground >= 0)
      {
        gamestate = WIN_STATE;
      }
      else
      {
        gamestate = LOSE_STATE;
      }
    }
  }
  if (gamestate == LOSE_STATE)
  {
    fill(255);  
    image(losepic, 0, 0, width, height);
    text("Game Over....", width/2, width/2, width, 100);
  }
   if (gamestate == WIN_STATE)
 {
   fill(0);  
   image(winpic, 0, 0, width, height);
   text("YOU WIN!!", 250, height/2, width, 100);
 }  
}
 
void mousePressed() 
{ 
  if (mouseDist < r)
  {
  speedX = speedX  + .05;     
  speedY = -20;
  }
  if (timer < 20)
  {
   speedX2 = speedX2  + .05;
   speedY2 = -20;
  }
}




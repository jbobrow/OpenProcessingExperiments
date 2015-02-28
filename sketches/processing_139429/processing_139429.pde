
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/134437*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* @pjs preload="owlmage.png, watermelon.png, boom.jpg"; */

//resubmission with edits

float timer = 0.0;
int gamestate = 0;
int PLAY_STATE = 0;
int WIN_STATE = 1;
int LOSE_STATE = 2;
int clickcount = 10;
float gametimer = 0;
float melonx = 0;
float melony = 0;
float melonsize = 50;
 
PImage owlmage;
PImage watermelon;
PImage boom;


class Owl
{
  //redraft of x
float x = random(10, width- 10);
float y = 200;
float radius = 20;
float owlSpeed = random(2,7);
}

class Hero
{
  float x = 250;
  float y = 600;
  float w = 50;
  float h = 50;
  float speed = 5;
}

boolean isLeftDown = false;
boolean isRightDown = false;
boolean isUpDown =  false;

Owl[] owls = new Owl[10];
Hero slice = new Hero();


void setup()
{
  size(500,650);
  textSize(30);
  frameRate(30);
  println(timer); 
  for (int i = 0; i < owls.length; i +=1)
    {
      owls[i] = new Owl();
    }
    owlmage = requestImage("owlmage.png");
    watermelon = requestImage("watermelon.png");
    boom = requestImage("boom.jpg");
  
}


void draw()
{
  println(timer);
  timer = timer + (1.0 / 12.0);
  if (gamestate == LOSE_STATE)
  {
      if (timer < 5)
      {
      background(255, 0, 0);
      textAlign(CENTER);
      text("OWLMAGEDDON", 0, 0, width, 100);
      text("click the mouse to restart", 0,300, width, 100);
      text("give it a second....", 0, 400, width, 100);
      }
      else if (timer >5)
      {
        gamestate = PLAY_STATE;
      }
      
      
  }
  if (gamestate == WIN_STATE)
  {
    if( timer < 25)
    {
      background(#CD9999);
      textAlign(CENTER);
      text("OWL BE BACK!!!", 0, 0, width, 100);
      text("double click to restart, holmes.", 0, 600, width, 100);
    }
      else if (timer >5)
      {
        gamestate = PLAY_STATE;
      }
  }
  if (gamestate == PLAY_STATE)
  {
    println(timer); 
  background(#3232CD);
  //removed improper lead [timer]
    
     timer = timer + (1.0 / 30.0);
    //redefined background image to fit dimensions
  image(boom, width, height);
  
  if (isRightDown == true)
    {
        slice.x -= slice.speed;
    }
    
  if (isLeftDown == true)
    {
        slice.x += slice.speed;
    }
  
  image(watermelon,slice.x, slice.y, slice.w, slice.h);
  
   for (int i = 0; i < owls.length; i +=1)
  {
  owls[i].y += owls[i].owlSpeed;
  if (rectRectIntersect(slice.x, slice.y, slice.x+slice.w, slice.y+slice.h,
  owls[i].x, owls[i].y, owls[i].x+owls[i].radius, owls[i].y+ owls[i].radius))
    {
      gamestate = LOSE_STATE;
    }
    else if (timer >= 20)
      {
        gamestate = WIN_STATE;
      }
  image(owlmage, owls[i].x,owls[i].y, owls[i].radius, owls[i].radius);
}
  
  
 
  
  
}
//this is the end of the gamestate area
}


 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = false;
    }
    if (keyCode == RIGHT)
    {
      isRightDown = false;
    }
    if (keyCode == UP)
    {
      isUpDown = false;
    }
  }
}
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      isLeftDown = true;
    }
    if (keyCode == RIGHT)
    {
      isRightDown= true;
    }
    if (keyCode == UP)
    {
      isUpDown = true;
    }
  }
}




void mouseClicked()
  {
setup();
}


boolean rectRectIntersect(float left, float top, float right, float bottom,
float otherLeft, float otherTop, float otherRight, float otherBottom)
{return !(left>otherRight ||right < otherLeft || top > otherBottom || bottom < otherTop);}




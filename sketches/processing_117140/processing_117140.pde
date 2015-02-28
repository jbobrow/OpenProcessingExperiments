
PImage pic;
float timer = 11;
PFont font;
PFont font2;
int gameState = 0;

int win = 0;
int lose = 1;


class sprite
{
  PImage image;
  PVector position;
  int frameRow;
  int frameColumn;
  float frameTimer;
  PVector velocity;
  float speed;
  
   PImage image2;
  PVector position2;
  int frameRow2;
  int frameColumn2;
  float frameTimer2;
  PVector velocity2;
  float speed2;
}
 
sprite mage;
float left = 0;
float right = 0;
float down = 0;
float up = 0;
float up3 = 30;
float down3 = 30;
float left3 = 590;
float right3 = 590;

sprite rogue;
float left2 = 0;
float right2 = 0;
float down2 = 0;
float up2 = 0;
float up4 = 30;
float down4 = 30;
float left4 = 420;
float right4 = 420;
  
void setup()
{
  size(1000,600);
  font = loadFont("Ifinkufreeky-16.vlw");
  font2 = loadFont("Ifinkufreeky-28.vlw");
  
  mage = new sprite();
  mage.image = loadImage("blumpy sprite.png");
  mage.position = new PVector(590, 30);
  mage.velocity = new PVector(0, 0);
  mage.frameRow = 0; 
  mage.frameColumn = 0; 
  mage.frameTimer = 0; 
  mage.speed = 4; 
  
  rogue = new sprite();
  rogue.image2 = loadImage("blempy sprite.png");
  rogue.position2 = new PVector(420, 30);
  rogue.velocity2 = new PVector(0, 0);
  rogue.frameRow2 = 0; 
  rogue.frameColumn2 = 0; 
  rogue.frameTimer2 = 0; 
  rogue.speed2 = 6; 
  
   pic = loadImage("maze.png");
}
 
void draw()
{
  image(pic,width/2,height/2,1000,600);
    
  timer -= 0.0167;
  //println(timer);
  
  if (timer < 0)
  {
    timer = 0;
    
    gameState = lose;
  }
  
  fill(0,200);
  textFont(font,16);
  text("TIME: " + (int)timer, 470, 20);
   
   if (timer < 11 && timer > 9)
  {
    textFont(font2,28);
    textMode(CENTER);
    text("Reach the End!", 410, 300);
  }
  

  mage.velocity.x = mage.speed * (left + right);
  mage.velocity.y = mage.speed * (up + down);
  mage.position.add(mage.velocity);
  
  rogue.velocity2.x = rogue.speed2 * (left2 + right2);
  rogue.velocity2.y = rogue.speed2 * (up2 + down2);
  rogue.position2.add(rogue.velocity2);
   
  mage.frameTimer += 0.1;
  if (mage.frameTimer >= 3) 
  {
    mage.frameTimer = 1;
  }
  mage.frameColumn = (int)mage.frameTimer;
   
  if (mage.velocity.x == 0 && mage.velocity.y == 0)
  {
    mage.frameColumn = 0; 
  }
   
  if (left != 0)
  {
    mage.frameRow = 1; 
  }
  if (right != 0)
  {
    mage.frameRow = 2;
  }
  if (up != 0)
  {
    mage.frameRow = 3; 
  }
  if (down != 0)
  {
    mage.frameRow = 0; 
  }
 
  pushMatrix();
  translate(mage.position.x, mage.position.y);
  imageMode(CENTER);
   
  
  PImage frameImage = getSubImage(mage.image, mage.frameRow, mage.frameColumn, 32, 32);
   
  
  image(frameImage, 0, 0);
   
  popMatrix();
  
  rogue.frameTimer2 += 0.1; 
  if (rogue.frameTimer2 >= 3) 
  {
    rogue.frameTimer2 = 1; 
  }
  rogue.frameColumn2 = (int)rogue.frameTimer2;
   
  if (rogue.velocity2.x == 0 && rogue.velocity2.y == 0)
  {
    rogue.frameColumn2 = 0; 
  }
   
  if (left2 != 0)
  {
    rogue.frameRow2 = 1;
  }
  if (right2 != 0)
  {
    rogue.frameRow2 = 2; 
  }
  if (up2 != 0)
  {
    rogue.frameRow2 = 3;
  }
  if (down2 != 0)
  {
    rogue.frameRow2 = 0; 
  }
 
  pushMatrix();
  translate(rogue.position2.x, rogue.position2.y);
  imageMode(CENTER);
   
 
  PImage frameImage2 = getSubImage2(rogue.image2, rogue.frameRow2, rogue.frameColumn2, 32, 32);
   
  
  image(frameImage2, 0, 0);
   
  popMatrix();
  
  /*if (gameState == lose)
  {
    fill(0);
    rect(0,0,1000,600);
    
    fill(255,0,0);
    textFont(font2, 100);
    text("NOPE",400, 300);
  }*/
}
 

PImage getSubImage(PImage image, int row, int column, int frameWidth, int frameHeight)
{
  return image.get(column * frameWidth, row * frameHeight, frameWidth, frameHeight);
}
PImage getSubImage2(PImage image2, int row2, int column2, int frameWidth2, int frameHeight2)
{
  return image2.get(column2 * frameWidth2, row2 * frameHeight2, frameWidth2, frameHeight2);
}
 
void keyPressed()
{
  if (keyCode == RIGHT)
  {
    right = 1;
    right3 += 13;
    left3 += 13;
    if (right3 > 1000)
    {
      right = 0;
      right3 = 1000;
    }
    if (right3 < 1000)
    {
      right = 1;
    }
  }
  if (keyCode == LEFT)
  {
    left = -1;
    right3 -= 13;
    left3 -= 13;
    if (left3 > 580)
    {
      left = -1;
    }
    if (left3 < 580)
    {
      left = 0;
      left3 = 580;
    }
    
  }
  if (keyCode == UP)
  {
    up = -1;
    up3 -= 12;
    down3 -= 12;
    if (up3 > 10)
    {
      up = -1;
    }
     if (up3 < 10)
    {
      up = 0;
      up3 = 10;
    }
  }
  if (keyCode == DOWN)
  {
    down = 1;
    down3 += 12;
    up3 += 12;
    if (down3 > 600)
    {
       down = 0;
      down3 = 600;
    }
    if (down3 < 600)
    {
      down = 1;
    }
  }
   println(left3);
   println(up3);
   println(down3);
   println(right3);
   //println(left4);
   //println(up4);
   //println(down4);
   //println(right4);
    if (key == 'w')
    {
       up2 = -1;
       up4 -= 12;
       down4 -= 12;
       if (up4 > 20)
       {
        up2 = -1;
       }
        if (up4 < 20)
       {
         up2 = 0;
         up4 = 20;
      }
    }
    if (key == 'a')
    {
      left2 = -1;
      right4 -= 13;
      left4 -= 13;
      if (left4 > 195)
      {
        left2 = -1;
      }
      if (left4 < 195)
      {
        left2 = 0;
        left4 = 190;
      }
    }
    if (key == 'd')
    {
       right2 = 1;
       right4 += 13;
       left4 += 13;
    if (right4 > 430)
    {
      right2 = 0;
      right4 = 430;
    }
    if (right4 < 430)
    {
      right2 = 1;
    }
    }
    if (key == 's')
    {
       down2 = 1;
       down4 += 12;
       up4 += 12;
       if (down4 > 375)
       {
        down2 = 0;
        down4 = 375;
       }
       if (down4 < 375)
       {
       down2 = 1;
       }
    } 
    
}
 
void keyReleased()
{
  if (keyCode == RIGHT)
  {
    right = 0;
  }
  if (keyCode == LEFT)
  {
    left = 0;
  }
  if (keyCode == UP)
  {
    up = 0;
  }
  if (keyCode == DOWN) 
  {
    down = 0;
  }
    if (key == 'w')
    {
       up2 = 0;
    }
    if (key == 'a')
    {
       left2 = 0;
    }
    if (key == 'd')
    {
       right2 = 0;
    }
    if (key == 's')
    {
       down2 = 0;
    }
  }
  
  void wall()
  {
    if ((right > 445 && left < 545))
    {
      right = 0;
      left = 0;
    }
  }



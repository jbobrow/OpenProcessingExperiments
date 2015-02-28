
SpriteObject blumpy;
SpriteObject blempy;
SpriteObject[] rock = new SpriteObject[50];
PImage pic;
float fall = 0;
float speed = 5.0;
//float speed2 = 8.0;
float right = 0;
//float right2 = 0;
float left = 0;
//float left2 = 0;
float timer = 11;
//float rTimer = 0;
float rx, rx1, rx2, rx3, rx4, rx5 = 0;
float ry, ry1, ry2, ry3, ry4, ry5 = 0;
int gameState;
PFont font;
PFont font2;
int win = 2;
int lose = 1;
boolean impact;

void setup()
{
  size(600, 500);
   pic = loadImage("temple.png");
  font = loadFont("Ifinkufreeky-16.vlw");
  font2 = loadFont("Ifinkufreeky-28.vlw");
  
  blumpy = new SpriteObject("blumpy.png");
  blumpy.x = 400;
  blumpy.y = 450;
  
  blempy = new SpriteObject("blempy.png");
  blempy.x = 200;
  blempy.y = 450;
  
    for ( int i = 0; i < 50; i+= 1)
 {
 
  rock[i] = new SpriteObject("Rock.png");
  rock[i].x = random(1850);
  rock[i].y = random (-100,100);
 
 }
}

void draw()
{ 
 
  image(pic,width/2,height/2,width,height);
  
    blumpy.x += (right - left) * speed;
  
  timer -= 0.0167;
  
  if (timer < 0)
  {
    timer = 0;
    
    gameState = win;
  }
  
  fill(255,0,0,200);
  textFont(font,16);
  text("TIME: " + (int)timer, 280, 20);
  
  if (timer < 11 && timer > 9.5)
  {
    textFont(font2,28);
    textMode(CENTER);
    text("Survive!",250 , 250);
  }
  
  if (gameState == win)
  {
    fill(0);
    rect(0,0,1000,600);
    
    fill(0,255,255);
    textFont(font2, 100);
    text("YEP",400, 300);
  }
  
  //blempy.x += (right - left) * speed;
  //blumpy.x += (right - left) * speed;
  //blempy.x += (right2 - left2) * speed2;
  
  /*fill(#3B1A00);
  rect(100,fall+300,200,10);
  rect(280,fall+20,50,10);
  rect(500,fall+100,20,10);
  rect(500,fall+300,100,10);
  rect(0,fall+350,80,10);
  rect(0,fall+150,80,10);
  rect(550,fall+500,20,10);
  rect(600,fall+400,85,10);
  rect(200,fall+100,60,10);
  rect(550,fall+200,90,10);
  rect(460,fall-100,200,10);
  rect(350,fall-150,50,10);
  rect(350,fall-100,20,10);
  rect(500,fall-30,100,10);
  rect(360,fall-205,80,10);
  rect(0,fall-180,80,10);
  rect(550,fall-200,20,10);
  rect(600,fall-250,85,10);
  rect(200,fall-100,60,10);
  rect(550,fall-200,90,10);
  rect(380,fall+100,150,10);
  fall += 6;
  if ( fall >= 700)
  {
    fall = 0;
  }*/
  
  /*rTimer += 0.0167;
  
  if (rTimer > 2)
  {
    rx = random(width);
    rx1 = random(width);
    rx2 = random(width);
    rx3 = random(width);
    rx4 = random(width);
    rx5 = random(width);
    ry = random(height);
    ry1 = random(height);
    ry2 = random(height);
    ry3 = random(height);
    ry4 = random(height);
    ry5 = random(height);
    rTimer = 0;
  }
  fill(#3B1A00);
  rect(rx,ry+fall,100,10);
  rect(rx1,ry+fall,100,10);
   rect(rx2,ry+fall,100,10);
  rect(rx3,ry+fall,100,10);
   rect(rx4,ry+fall,100,10);
  rect(rx5,ry+fall,100,10);
  
  
  /*for(int x = 0; x < 600; x ++) //too random
  {

    rect(random(x,255),random(fall-500),10,10);

  }*/
  
  for ( int i = 0; i < 50; i+= 1)
    {
     rock[i].y += 1;
     rock[i].render();
     
      if(rock[i].isOverlapping(blempy))
    {
      impact = true;
    }
     if(rock[i].isOverlapping(blumpy))
    {
      impact = true;
    }
     
    }

      if (impact)
    {
      fill(0);
      rect(0,0,1000,600);
      
      fill(255,0,0);
      textFont(font2, 100);
      text("NOPE",300, 300);
    }
 
  impact = false;
  
  
  blempy.x = mouseX;
  //blempy.y = mouseY;
  blempy.render();
  blumpy.render();
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
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
  
  boolean isOverlapping(SpriteObject other)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
      
    float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);  
      
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }
 
  boolean isOverlapping(float otherLeft, float otherTop, float otherRight, float otherBottom)
  {
    float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
      
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
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
  boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) 
{
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);

}


void keyPressed()
{
  /*if (key == 'a') //When I use this key code instead the other, the characters keep decreasing in the x value
  {
    left2 = 1;
  }
  if (key == 'd');
  {
    right2 = 1;
  }*/
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 1;
    }
    if (keyCode == RIGHT)
    {
      right = 1;
    }
  }/*
   if (key == 'a')
  {
    left = 1;
  }
  if (key == 'd');
  {
    right = 1;
  }*/
}


void keyReleased()
{
  /*if (key == 'a')
  {
    left2 = 0;
  }
  if (key == 'd')
  {
    right2 = 0;
  }*/
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      left = 0;
    }
    if (keyCode == RIGHT)
    {
      right = 0;
    }
  }
  /*if (key == 'a')
  {
    left = 0;
  }
  if (key == 'd')
  {
    right = 0;
  }*/
}




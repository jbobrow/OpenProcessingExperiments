
SpriteObject cartman;
SpriteObject  cartmanfront;
SpriteObject  cartmanright;
SpriteObject  cartmanleft;
SpriteObject[]  pies = new SpriteObject[15];
SpriteObject[] spinachs = new SpriteObject[7];
PImage town;
int Pscore = 0;
int Sscore = 0;
int gameState = 0;
float timer = 0;

void setup()
{
  size(1191,670);
  
  cartmanfront = new SpriteObject("cartmanfront.fw.png");
  cartmanright = new SpriteObject("cartmanright.fw.png");
  cartmanleft = new SpriteObject("cartmanleft.fw.png");
  
  cartman = new SpriteObject("cartmanfront.fw.png");
  cartman.x = width/2;
  cartman.y = 600;
 cartman.s = .2;
 
 for ( int i = 0; i < 15; i++)
 { 
   pies[i] = new SpriteObject("pie.fw.png");
  pies[i].x = random (width);
  pies[i].y =0;
  pies[i].speed = random(2, 4);
 }
 
 for ( int i = 0; i < 7; i++)
 { 
   spinachs[i] = new SpriteObject("spinach.fw.png");
  spinachs[i].x = random (width);
  spinachs[i].y =0;
  spinachs[i].speed = random(3, 5);
 }
 
 town = requestImage("southparktown.jpg");
 
}

void draw()
{
  
  
  background(0);
  
  image(town,595.5,335,width,height);
  
  if (Pscore >= 10)
  {
    gameState = 1;
  }
  if (Sscore == 3)
  {
    gameState = 2;
  }
  
  if (gameState == 0)
  {
    fill(255);
    textSize(40);
    text("PIES: " + Pscore + " EATEN", 100,50);
    text("SPINACHS: " + Sscore + " EATEN", 600,50);
     for (int i = 0; i < 15; i++)
     {
        if (pies[i].isOverlapping(cartman) && pies[i].destroyed == false)
      {
        Pscore += 1;
        pies[i].destroyed = true;
  
      }
        pies[i].render();
        pies[i].y += pies[i].speed;
        
        if (pies[i].y > height)
        {
          pies[i].y = -50;
          pies[i].x = random(width);
        }
     }
     
      for (int i = 0; i < 7; i++)
     {
        if (spinachs[i].isOverlapping(cartman) && spinachs[i].destroyed == false)
      {
        Sscore += 1;
        spinachs[i].destroyed = true;
  
      }
        spinachs[i].render();
        spinachs[i].y += spinachs[i].speed;
        
        if (spinachs[i].y > height)
        {
          spinachs[i].y = -50;
          spinachs[i].x = random(width);
        }
     }
   
    cartman.render();
  }
  if (gameState == 1)
  {
     fill(255);
    textSize(40);
   text("YOU WON!!", 100,50); 
  }
  if (gameState == 2)
  {
     fill(255);
    textSize(40);
   text("YOU LOSE!!", 100,50); 
  }
  
  
}

 
 
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      cartman.img = cartmanleft.img;
      cartman.x -= 7;
    
    }
    if (keyCode == RIGHT)
    {
      cartman.img = cartmanright.img;
      cartman.x += 7;
    }
  }
}

void keyReleased()
{
  cartman.img = cartmanfront.img;
}


class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  float speed;
  PImage img;
  boolean loaded = false;
  boolean destroyed = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
   
   boolean isMouseOverlapping()
   {
     if (mouseX > (this.x - (this.w * 0.5 * this.s)) 
     && mouseX < (this.x + (this.w * 0.5 * this.s))
     && mouseY > (this.y - (this.h * 0.5 * this.s)) 
     && mouseX < (this.y + (this.h * 0.5 * this.s)))
     {
       return true;
     }
     
     else 
     {
       return false;  
     }
   }
   
   boolean isOverlapping(SpriteObject other)
   {
     float left = this.x - ( this.w * 0.5 * this.s);
     float right = this.x + ( this.w * 0.5 * this.s);
     float top = this.y - ( this.h * 0.5 * this.s);
     float bottom = this.y + ( this.h * 0.5 * this.s);
     
    
        float otherLeft = other.x - (other.w * 0.5 * other.s);
    float otherRight = other.x + (other.w * 0.5 * other.s);
    float otherTop = other.y - (other.h * 0.5 * other.s);
    float otherBottom = other.y + (other.h * 0.5 * other.s);   
     
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
     
    if (loaded && destroyed == false)
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




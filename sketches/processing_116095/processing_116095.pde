
SpriteObject alone;
SpriteObject cereal;
SpriteObject creepy;
SpriteObject gusta;
SpriteObject see;
SpriteObject sincere;
SpriteObject wario;
SpriteObject poker;
SpriteObject ship;
SpriteObject galaxy;

float x = 0;
float speed = 3.0;
float left = 0;
float right = 0;
float  up = 0;
float down = 0;

boolean Invert = false;


void setup()
{  
 size(600,600);
 


 ship = new SpriteObject("ship.png");
 ship.x = 300;
 ship.y = 550;
 ship.s = .8;
 
  alone = new SpriteObject("alone.png");
  alone.y = 0;
  alone.x = 10;
  alone.s = 0.25;
 
  cereal = new SpriteObject("cereal.png");
  cereal.y = 0;
  cereal.x = 50;
  cereal.s = 0.25;
   
  creepy = new SpriteObject("creepy.png");
  creepy.y = 0;
  creepy.x = 350;
  creepy.s = 0.25;

  gusta = new SpriteObject("gusta.png");
  gusta.y = 0;
  gusta.x = 175;
  gusta.s = 0.25;
  
  see = new SpriteObject("see.png");
  see.y = 0;
  see.x = 400;
  see.s = 0.25;

  sincere = new SpriteObject("sincere.png");
  sincere.y = 0;
  sincere.x = 450;
  sincere.s = 0.25;
  
  wario = new SpriteObject("wario.png");
  wario.y = 0;
  wario.x = 525;
  wario.s = 0.25;

  poker = new SpriteObject("poker.png");
  poker.y = 0;
  poker.x = 580;
  poker.s = 0.25;

  galaxy = new SpriteObject("galaxy.png");
  


}

void draw()
{
  
    background(0);
  textSize(30);
  fill(255);
  text ("TROLL BLASTER", 190, 30);

  if (ship.isOverlappingMouse() == false)
  {
    tint(255);
    ship.render();
   
  }
  

  ship.x += (right - left) * speed;
  ship.y += (down - up) * speed;

  if (cereal.isOverlapping(ship) == true)
  {
    tint(255, 0, 0);
    }
    else
    {
      tint(255);
    }
      
    cereal.render();
    cereal.y += 0.3;

    if (creepy.isOverlapping(ship) == true)
      {
        tint(255,0,0);
      }
      else
      {
        tint(255);
      }
       
      creepy.render();
      creepy.y += 0.8;
     
        if (alone.isOverlapping(ship) == true)
      {
        tint(255,0,0);
      }
      else
      {
        tint(255);
      }
       
      alone.render();
      alone.y += 0.6;
  
     if (gusta.isOverlapping(ship) == true)
      {
        tint(255,0,0);
      }
      else
      {
        tint(255);
      }
       
      gusta.render();
      gusta.y += 0.4;
      
      if (see.isOverlapping(ship) == true)
      {
        tint(255,0,0);
      }
      else
      {
        tint(255);
      }
       
      see.render();
      see.y += 0.5;
      
      if (sincere.isOverlapping(ship) == true)
      {
        tint(255,0,0);
      }
      else
      {
        tint(255);
      }
       
      sincere.render();
      sincere.y += 0.3;
      
      if (wario.isOverlapping(ship) == true)
      {
        tint(255,0,0);
        filter(INVERT);

      }
      else
      {
        tint(255);
      }
       
      wario.render();
      wario.y += 1.0;
      
      if (poker.isOverlapping(ship) == true)
      {
        tint(255,0,0);
      }
      else
      {
        tint(255);
      }
       
      poker.render();
      poker.y += 1.2;
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
       
        boolean isOverlappingMouse()
        
        {
    if (mouseX > (this.x - (this.w * 0.5 * this.s)) 
      && mouseX < (this.x + (this.w * 0.5 * this.s))
      && mouseY > (this.y - (this.h * 0.5 * this.s))
      && mouseY < (this.y + (this.h * 0.5 * this.s)))
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

void keyReleased()
{
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
    if (keyCode == UP)
    {
      up = 0;
    }
    if (keyCode == DOWN)
    {
      down = 0;
    }
     
  }
}
 
void keyPressed()
{
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
    if (keyCode == UP)
    {
      up = 1;
    }
    if (keyCode == DOWN)
    {
      down = 1;
    }      
  }
}





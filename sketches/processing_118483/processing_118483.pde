
/* @pjs preload= "PacR_Closed.png, PacR_Open.png, PacL_Closed.png, PacL_Open.png, PacD_Closed.png, PacD_Open.png, PacU_Closed.png,
PacU_Open.png, InkyR.png, InkyL.png, InkyU.png, InkyD.png, PinkyR.png, PinkyL.png, PinkyU.png, PinkyD.png, BlinkyR.png, BlinkyL.png,
BlinkyU.png, BlinkyD.png, Background.png, Ghost.png"; */

Hero pacman = new Hero();
Ghost_1 Inky = new Ghost_1();
Ghost_2 Pinky = new Ghost_2();
Ghost_3 Blinky = new Ghost_3();
Ghost_4 Clyde = new Ghost_4();
PImage b = requestImage("Background.png");
boolean blinking = false;
float blinkTimer = 300;
float weakTimer;

void setup()
{  
  size(700,700);
}

void draw()
{
  
  imageMode(CENTER);
  image(b,width/2,height/2);
  
  if (pacman.dead == false)
  {
  pacman.render();
  pacman.update();
  }

  Inky.render();
  Inky.update();
  Pinky.render();
  Pinky.update();
  Blinky.render();
  Blinky.update();
 

 blinkTimer -= 1;
 
 if (blinkTimer == 0)
 {
   blinkTimer = 300;
   if (blinking == false)
   {
     blinking = true;
   }
   else
   {
     blinking = false;
   }
 }


}


class Ghost_1 
{
  PVector location = new PVector(random(15,685),random(16,684));
  PVector velocity = new PVector(5,0);
  PImage InkyU = requestImage("InkyU.png");
  PImage InkyD = requestImage("InkyD.png");
  PImage InkyL = requestImage("InkyL.png");
  PImage InkyR = requestImage("InkyR.png"); 
  PImage Weak = requestImage("Ghost.png");
  PImage img = InkyD;
  boolean dead = false;
  float s = 1.4;
  float left;
  float right;
  float up;
  float down;
  

  
  void render()
  {
    if (dead == false)
    {
      pushMatrix();
      imageMode(CENTER);
      translate(location.x, location.y);
      scale(this.s);
      image(img, 0, 0);
      popMatrix();
    }
    
   
  }
  
  void update()
  {
    location.add(velocity);
    left = location.x - (5 * this.s);
    right = location.x + (5 * this.s);
    up = location.y - (16 * this.s);
    down = location.y + (16 * this.s);
  
    // Collision with pacman object
    if (pacman.dead == false && this.dead == false)
    {
      if (location.x > pacman.left && location.x < pacman.right && location.y > pacman.up && location.y < pacman.down)
      {
        if (blinking == true)
        {
          dead = true;
        }
        else
        {
          pacman.dead = true;
        }
      }
    }
    
   
    
    // Hit Right reaction
    if (location.x + (15 * this.s)  >= width && velocity.x > 0) 
    {
      velocity.x = 0;
      velocity.y = 5;
    }
    // Hit Left reaction
    if (location.x - (15 * this.s) <= 0 && velocity.x < 0)
    {
      velocity.x = 0;
      velocity.y = -5;
    }
    // Hit Down reaction
    if (location.y + (16 * this.s) >= height && velocity.y >0)
    {
      velocity.y = 0;
      velocity.x = -5;
    } 
    // Hit Up reaction
    if (location.y - (16 * this.s) <= 0 && velocity.y < 0)
    {
      velocity.y = 0;
      velocity.x = 5;
    }
    // CHange Sprite when velocity Changes
    if (blinking == false)
    {
      if (velocity.y > 0)
      {
        img = InkyD;
      }
      if (velocity.y < 0)
      {
        img = InkyU;
      }
      if (velocity.x > 0)
      {
        img = InkyR;
      }
      if (velocity.x < 0)
      {
        img = InkyL;
      }
    }
    if (blinking == true)
    {
      img = Weak;
    }
  }
}


class Ghost_2 
{
  PVector location = new PVector(random(15,685),random(16,684));
  PVector velocity = new PVector(4,3);
  PImage  PinkyR = requestImage("PinkyR.png");
  PImage  PinkyL = requestImage("PinkyL.png");
  PImage  PinkyU = requestImage("PinkyU.png");
  PImage  PinkyD = requestImage("PinkyD.png");
  PImage Weak = requestImage("Ghost.png");
  PImage img = PinkyD;
  boolean dead = false;
  float s = 1.4;
  float left;
  float right;
  float up;
  float down;
 
  

  
  void render()
  {
    if (dead == false)
      {
        pushMatrix();
        imageMode(CENTER);
        translate(location.x, location.y);
        scale(this.s);
        image(img, 0, 0);
        popMatrix();
      }
  }
  
  void update()
  {
    location.add(velocity);
    left = location.x - (15 * this.s);
    right = location.x + (15 * this.s);
    up = location.y - (16 * this.s);
    down = location.y + (16 * this.s);
  
    // Collision with pacman object
  if (pacman.dead == false && this.dead == false)
  {
    if (location.x > pacman.left && location.x < pacman.right && location.y > pacman.up && location.y < pacman.down)
     {
       if (blinking == true)
       {
        dead = true;
       }
       else
       {
        pacman.dead = true;
     
       }
     }
  }
   
    
    // Hit Left or Right
    if (location.x + (14 * this.s)  >= width && velocity.x > 0 || location.x - (14 * this.s) <= 0 && velocity.x < 0)
    {
      velocity.x = velocity.x * -1;
    }
    // Hit Up or Down
    if (location.y + (16 * this.s) >= height && velocity.y >0 || location.y - (16 * this.s) <= 0 && velocity.y < 0)
    {
      velocity.y = velocity.y * -1;
    } 
    // CHange Sprite when velocity Changes
    if (blinking == false)
    {
      if (velocity.y > 0)
      {
        img = PinkyD;
      }
      if (velocity.y < 0)
      {
        img = PinkyU;
      }
      if (velocity.x > 0)
      {
        img = PinkyR;
      }
      if (velocity.x < 0)
      {
        img = PinkyL;
      }
    }
    if (blinking == true)
    {
      img = Weak;
    }
  }
}


class Ghost_3 
{
  PVector location = new PVector(random(15,685),random(16,684));
  PVector velocity = new PVector(-4,0);
  PImage BlinkyR = requestImage("BlinkyR.png");
  PImage BlinkyL = requestImage("BlinkyL.png");
  PImage BlinkyU = requestImage("BlinkyU.png");
  PImage BlinkyD = requestImage("BlinkyD.png");
  PImage Weak = requestImage("Ghost.png");
  PImage img = BlinkyD;
  float left;
  float right;
  float up;
  float down;
  float s = 1.4;
  float timer1 = random(240,300);
  float timer2 = 15;
  boolean dead = false;
  boolean open = true;


  
  void render()
  {
    if (dead == false)
    {
      pushMatrix();
      imageMode(CENTER);
      translate(location.x, location.y);
      scale(this.s);
      image(img, 0, 0);
      popMatrix();
    }
  
  }
  void update()
  { 
  
    location.add(velocity);
    // determines objects colision boundary
    left = location.x - (15 * this.s);
    right = location.x + (15 * this.s);
    up = location.y - (16 * this.s);
    down = location.y + (16 * this.s);
    timer2 -= 1;
    
    if (timer2 == 0)
    {
      timer2 = 15;
      if ( open == true)
        {
          open = false;
        }
       else 
       {
         open = true;
       }
    }
  
    // determines when it warps and where
    if (timer1 > 0)
    {
      timer1 -= 1;
    }
    if (timer1 <= 0)
    {
      location.x = random(14,686);
      location.y = random(16,684);
      timer1 = random(250,300);
    }
    
    // determines collision with pacman object
   if (pacman.dead == false & this.dead == false)
   {
    if (location.x > pacman.left && location.x < pacman.right && location.y > pacman.up && location.y < pacman.down)
    {
      if ( blinking == true)
      {
       dead = true;
      }
      else
      {
        pacman.dead = true;
        pacTimer = 120;
      }
    }
   }
    
    // Hit Left or Right
    if (location.x + (14 * this.s)  >= width && velocity.x > 0 || location.x - (14 * this.s) <= 0 && velocity.x < 0)
    {
      velocity.x = velocity.x * -1;
    }
    // Hit Up or Down
    if (location.y + (16 * this.s) >= height && velocity.y >0 || location.y - (16 * this.s) <= 0 && velocity.y < 0)
    {
      velocity.y = velocity.y * -1;
    } 
    
    // CHange Sprite when velocity Changes
    if (blinking == false)
    {
      if (velocity.y > 0)
      {
        img = BlinkyD;
      }
      if (velocity.y < 0)
      {
        img = BlinkyU;
      }
      if (velocity.x > 0)
      {
        img = BlinkyR;
      }
      if (velocity.x < 0)
      {
        img = BlinkyL;
      }
    }
    if (blinking == true)
    {
      img = Weak;
    }
  }
}



class Ghost_4
{
  PVector location = new PVector(350,350);
  PVector velocity = new PVector(0,5);
  PImage img = requestImage("Ghost.png");
  float s = 1.0;
  boolean dead = false;

  
  void render()
  {
    if (dead == false)
    {
      pushMatrix();
      imageMode(CENTER);
      translate(location.x, location.y);
      scale(this.s);
      image(img, 0, 0);
      popMatrix();
    }
  }
  void update()
  {
    location.add(velocity);
    
    
    // Hit Left or Right
    if (location.x + (14 * this.s)  >= width && velocity.x > 0 || location.x - (14 * this.s) <= 0 && velocity.x < 0)
    {
      velocity.x = velocity.x * -1;
    }
    // Hit Up or Down
    if (location.y + (16 * this.s) >= height && velocity.y >0 || location.y - (16 * this.s) <= 0 && velocity.y < 0)
    {
      velocity.y = velocity.y * -1;
    } 
    // CHange Sprite when velocity Changes
    if (blinking == false)
    {
      if (velocity.y > 0)
      {
        img = img;
      }
      if (velocity.y < 0)
      {
        img = img;
      }
      if (velocity.x > 0)
      {
        img = img;
      }
      if (velocity.x < 0)
      {
        img = img;
      }
    }
    if (blinking == true)
    {
      img = Weak;
    }
  }
}



class Hero
{
  PVector location = new PVector(450,450);
  PVector velocity = new PVector(0,5);
  PImage PacRC = requestImage("PacR_Closed.png");
  PImage PacRO = requestImage("PacR_Open.png");
  PImage PacLC = requestImage("PacL_Closed.png");
  PImage PacLO = requestImage("PacL_Open.png");
  PImage PacUC = requestImage("PacU_Closed.png");
  PImage PacUO = requestImage("PacU_Open.png");
  PImage PacDC = requestImage("PacD_Closed.png");
  PImage PacDO = requestImage("PacD_Open.png");
  PImage Pacman = PacRC;
  float s = 1.3;
  int dirTimer = 180;
  float dir;
  float left;
  float right;
  float up;
  float down;
  float timer2 = 5;
  boolean open = true;
  boolean dead = false;
  
  void render()
  {
   
   
      pushMatrix();
      imageMode(CENTER);
      translate(location.x, location.y);
      scale(this.s);
      image(Pacman, 0, 0);
      popMatrix();
    
  }
  void update()
  {
  
    location.add(velocity);
    dirTimer -= 1;
    left = location.x - (15 * this.s);
    right = location.x + (15 * this.s);
    up = location.y - (15 * this.s);
    down = location.y + (15 * this.s);
    timer2 -= 1;
    
    if (timer2 == 0)
    {
      timer2 = 5;
      if ( open == true)
        {
          open = false;
        }
       else 
       {
         open = true;
       }
    }
    
    // randomly changer direciton after a randomly determined amount of time
    if (dirTimer <= 0)
    {
      dirTimer = 180;
      if (velocity.y == 0)
      {
        velocity.y = velocity.x * -1;
        velocity.x = 0;
      }  
      else 
      { 
        velocity.x = velocity.y * -1;
        velocity.y = 0;    
      }  
    }
    
    // Hit Left or Right
    if (location.x + (14 * this.s)  >= width && velocity.x > 0 || location.x - (14 * this.s) <= 0 && velocity.x < 0)
    {
      velocity.x = velocity.x * -1;
    }
    // Hit Up or Down
    if (location.y + (14 * this.s) >= height && velocity.y >0 || location.y - (14 * this.s) <= 0 && velocity.y < 0)
    {
      velocity.y = velocity.y * -1;
    } 
    // CHange Sprite when velocity Changes
    if (velocity.y > 0)
    {
      if (open == true)
      {
        Pacman = PacDO;
      }
      else
      {
        Pacman = PacDC;
      }
    }
    if (velocity.y < 0)
    {
      if (open == true)
      {
        Pacman = PacUO;
      }
      else
      {
        Pacman = PacUC;
      }
    }
    if (velocity.x > 0)
    {
      if (open == true)
      {
        Pacman = PacRO;
      }
      else
      { 
        Pacman = PacRC;
      }
    }
    if (velocity.x < 0)
    {
      if (open == true)
      {
        Pacman = PacLO;
      }
      else
      {
        Pacman = PacLC;
      }
    }   
    }
   
}



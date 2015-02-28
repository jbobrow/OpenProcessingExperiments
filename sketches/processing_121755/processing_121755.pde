
Shape[] shapes = new Shape[12];
BulletObject[] bullet = new BulletObject[10]; 
//SpriteObject[] sprite = new SpriteObject[10];
SpriteObject sprite; 

PFont times; 
PFont arial; 


int currentBullet = 0; 
PImage Spaceship;
PImage AlienSpaceship;
PImage Boom; 

int bulletNumber = 0;
int squareNumber = 0; 
float s = 1; 
float r =0;
float shipX =250; 
float shipY=400;
float perjectile = 0; 
float x=295; 
float y=380; 
float wide=10;
float counter = 0;
int mousePresses = 0; 

class Shape
{
 float x = 0; 
 float y = 0; 
 float w = 0; 
}


void setup()
{
   
  size(500, 500); 
  
  Boom = requestImage ("Boom.png"); 
  AlienSpaceship = requestImage ("AlienSpaceship.png"); 
  //Spaceship = requestImage("Spaceship.png");
  //shapes[0] = new Shape("AlienSpaceship.png");
  /*shapes[1] = new Shape("AlienSpaceship.png");
  shapes[2] = new Shape("AlienSpaceship.png");
  shapes[3] = new Shape("AlienSpaceship.png");
  shapes[4] = new Shape("AlienSpaceship.png");
  shapes[5] = new Shape("AlienSpaceship.png");
  shapes[6] = new Shape("AlienSpaceship.png");
  shapes[7] = new Shape("AlienSpaceship.png");
  shapes[8] = new Shape("AlienSpaceship.png");
  shapes[9] = new Shape("AlienSpaceship.png");
  shapes[10] = new Shape("AlienSpaceship.png");
  shapes[11] = new Shape("AlienSpaceship.png"); */
  
  sprite = new SpriteObject("Spaceship.png");
  sprite.x =width / 2;
  sprite.y = 400;
  sprite.w = width;
  sprite.h = height;
  sprite.s = 0.25;
  sprite.speed = 4;
  
  
  
  
   for (int i = 0; i < 10; i++)
  {
    
    bullet[i] = new BulletObject("Laser.png");
    bullet[i].s = 0.1;
    bullet[i].x = 1100;
    bullet[i].y = 1100;
    bullet[i].rotation = 90;    
    
    
}
  
  for (int i = 0; i < 12; i++)
  {
    fill(#FFFFFF);
   shapes[i] = new Shape();  

  }

  shapes[0].x = random(300); 
  shapes[0].y = 10; 
  shapes[0].w = 5;  
  
  shapes[1].x = random(300);
  shapes[1].y = 15; 
  shapes[1].w = 10; 
  
  shapes[2].x = random(200); 
  shapes[2].y = 10; 
  shapes[2].w = 10;
  
  shapes[3].x = random(250); 
  shapes[3].y = 9; 
  shapes[3].w = 9;
  
  shapes[4].x = random(270); 
  shapes[4].y = 25; 
  shapes[4].w = 14;
  
  shapes[5].x = random(240); 
  shapes[5].y = 16; 
  shapes[5].w = 10;
  
  shapes[6].x = random(270); 
  shapes[6].y = 8; 
  shapes[6].w = 8;
  
  shapes[7].x = random(300); 
  shapes[7].y = 13; 
  shapes[7].w = 3;
  
  shapes[8].x = random(350); 
  shapes[8].y = 18; 
  shapes[8].w = 8;
  
  shapes[9].x = random(400); 
  shapes[9].y = 20; 
  shapes[9].w = 13;
  
  shapes[10].x = random(450); 
  shapes[10].y = 11; 
  shapes[10].w = 8;
  
  shapes[11].x = random(480); 
  shapes[11].y = 25; 
  shapes[11].w = 15;
  
arial = createFont("Arial", 64);

}



void draw()
{
  background(0, 0);
  
  
  pushMatrix(); 
  fill(255, 0, 0);
  textFont(arial);
  translate (300, 50);
  scale(.4); 
  text("Your Score", 0, 0); 
  popMatrix();

  pushMatrix(); 
  fill(255, 0, 0);
  textFont(arial);
  translate (430, 50);
  scale(.4); 
  text(bulletNumber, 0, 0); 
  popMatrix(); 

  pushMatrix(); 
  fill(#2100FF);
  textFont(arial);
  translate (300, 90);
  scale(.3); 
  text("The Square's Score", 0, 0); 
  popMatrix(); 

  pushMatrix(); 
  fill(#2100FF);
  textFont(arial);
  translate (475, 90);
  scale(.3); 
  text(squareNumber, 0, 0); 
  popMatrix();
  
  
    for (int i = 0; i < 10; i++)
  {
    bullet[i].update();
    bullet[i].render();
     
     
    if (bullet[i].isOverlappingRect(shapes[i].x, shapes[i].y, shapes[i].w, shapes[i].w) == true)
        {
      //get(int(shapes[i].x), int(shapes[i].y));
       fill(0);  
       bulletNumber = bulletNumber +1; 
        }
     
  if (shapes[1].y > 500)
 {
  shapes[1].y = random(20);
 squareNumber = squareNumber + 1; 
 }
         
  if (shapes[2].y > 500)
 {
  shapes[2].y = random(30); 
  squareNumber = squareNumber + 1;
 }
    
  if (shapes[3].y > 500)
 {
  shapes[3].y = random(40); 
  squareNumber = squareNumber + 1;
 }
        
  if (shapes[4].y > 500)
 {
  shapes[4].y = random(50); 
  squareNumber = squareNumber + 1;
 }
    
  if (shapes[5].y > 500)
 {
  shapes[5].y = random(60); 
  squareNumber = squareNumber + 1;
 }
           
  if (shapes[6].y > 500)
 {
  shapes[6].y = random(70);
 squareNumber = squareNumber + 1; 
 }
  
  if (shapes[7].y > 500)
 {
  shapes[7].y = random(80);
 squareNumber = squareNumber + 1; 
 }
    
  if (shapes[8].y > 500)
 {
  shapes[8].y = random(90);
 squareNumber = squareNumber + 1; 
 }
         
  if (shapes[9].y > 500)
 {
  shapes[9].y = random(100);
 squareNumber = squareNumber + 1; 
 }

  if (shapes[10].y > 500)
 {
  shapes[10].y = random(110);
 squareNumber = squareNumber + 1; 
 }
       
  if (shapes[11].y > 500)
 {
  shapes[11].y = random(120);
 squareNumber = squareNumber + 1; 
 }
       
    
    if (shapes[i].y >500)
    {
    fill(#FFFFFF);
      
    }
   
   if (bulletNumber >= 25)
   {
     background(0); 
    pushMatrix(); 
    fill(#FA9600);
    textFont(arial);
    translate (125, 250);
    scale(.7); 
    text("YOU WIN!", 0, 0); 
    popMatrix();
   }
   
   else if (squareNumber >=25)
   {
    background(0); 
    pushMatrix(); 
    fill(#0FF500);
    textFont(arial);
    translate (125, 250);
    scale(.7); 
    text("YOU LOSE!", 0, 0); 
    popMatrix();
   }

  }
  for (int i = 0; i < 12; i += 1)
  {
     rect(shapes[i].x, shapes[i].y, shapes[i].w, shapes[i].w);
      
  }
  //image(Spaceship, shipX, shipY, Spaceship.width *0.2, Spaceship.height *0.2);


  shapes[0].y += 1; 
  shapes[1].y += 1;
  shapes[2].y += 1;
  shapes[3].y += 1;
  shapes[4].y += 1;
  shapes[5].y += 1;
  shapes[6].y += 1;
  shapes[7].y += 1;
  shapes[8].y += 1;
  shapes[9].y += 1;
  shapes[10].y += 1;
  shapes[11].y += 1;
  
 
 

 


 



 


  if (keyPressed == true)
  {
  
    if (keyCode == LEFT)
    {
    sprite.x -= 4; 
    }
    
    if (keyCode == RIGHT)
    {
    sprite.x += 4; 
    }
    
  }
    sprite.update();
    sprite.render();

} 


 
  

void keyReleased()
{  
  boolean button = true;    
  if (key == ' ')
  {
    
    bullet[currentBullet].x = sprite.x;
    bullet[currentBullet].y = sprite.y - 70;
    bullet[currentBullet].speed = 10;  
      
      
  }
  if (button = true)
  {
  bullet[currentBullet].directionX = 0; 
  bullet[currentBullet].directionY = -1; 
  }
  
  currentBullet+=1; 
  if (currentBullet >=10)
  {
  currentBullet = 0; 
  }
}






class BulletObject extends SpriteObject
{
  BulletObject(String filename)
  {
    super(filename);
  }
   
  void update()
  {
    this.y += directionY * speed;
    this.x += directionX * speed;
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
}




class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float speed;
  float directionX;
  float directionY;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
    
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
   
  boolean isMouseOverlapping()
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
    boolean isOverlappingRect(float otherLeft, float otherTop, float rwidth, float rheight)
  {
   float left = this.x - (this.w * 0.5 * this.s);
    float right = this.x + (this.w * 0.5 * this.s);
    float top = this.y - (this.h * 0.5 * this.s);
    float bottom = this.y + (this.h * 0.5 * this.s);
     
    float otherRight = otherLeft + rwidth;
    float otherBottom = otherTop + rheight;
    return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
  }

   void update()
  {
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX;
    }
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
    }
      
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
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);}



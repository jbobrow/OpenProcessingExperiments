
PImage burn;

SpriteObject rat;
SpriteObject deadrat;
SpriteObject snake;
SpriteObject snakeDead; 

Predator zapdos;
  
float x;
float y;
float timer;
   
void setup()
{
  size(600, 600);
   
 
  burn = loadImage("burn.png");

   
  zapdos = new Predator("zapdos.png"); 
   
  snake = new SpriteObject("snake.png");
  snakeDead = new SpriteObject("snakedead.png");
  snake.y = 300;
  snake.directionX = 20.0;
  snake.directionY = 0.6;
  snake.speed = 2;
  snake.s = .8;
     
  rat = new SpriteObject("rat.png");
  deadrat = new SpriteObject("deadrat.png");
  rat.y = 275;
  rat.directionX = 2;
  rat.directionY = 2;
  rat.speed = 3;  
     
    
}
   
void draw()
{  
  
 imageMode(CORNER);
 image (burn, 0, 0, width, height);

  
  snake.update();
  snake.render();

  rat.update();
  rat.render();
    
  zapdos.update();
  zapdos.render(); 
    
  if (zapdos.isOverlapping(rat) == true)
  {

  rat.s *= .99;
  rat.img = deadrat.img;
  zapdos.s += .007;
  
  
  }
   
  if (timer > 6 && timer <6.1)
  {
    
    snake.speed = 0;    
    snake.img = snakeDead.img;
    filter(INVERT);
    
  }
     
  timer += 0.0167;
    
}
   
   class Predator extends SpriteObject
   {
     
  float easing = 0.05;
   
  void update()
  {
    float targetY = rat.y;
    float dy = targetY - x;
    if (abs(dy) > 1) {
      y += dy * easing;
    }
   
    float targetX = rat.y;
    float dx = targetX - x;
   
    if (abs(dx) > 1)
    {
      x += dx * easing;
    }
  }
   
   
  Predator (String filename)
  {
    super(filename);
  }
} 
  
   
class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float directionX;
  float directionY;
  float speed;
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
    
     // top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY =  this.directionY * -1;
    }
    
     // bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY =  this.directionY * -1;
    }
    
    // right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX =  this.directionX * -1;
    }
       
    // left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX =  this.directionX * -1;
    }    
       
    // movement
    this.y += directionY * speed;
    this.x += directionX * speed;
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




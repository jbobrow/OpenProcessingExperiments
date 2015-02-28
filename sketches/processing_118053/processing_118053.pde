
/* @pjs preload= "Pac.png, Ghost.png"; */
Pacman pac = new Pacman("Pac.png");
Predator ghost = new Predator("Ghost.png");

void setup()
{
  size(500,500);
  
  
}

void draw()
{
  background(0);
  pac.render();
  pac.update();
  ghost.render();
  ghost.targetX = pac.x;
  ghost.targetY = pac.y;
  ghost.update();
}

class Predator extends Pacman
{
  float targetX;
  float targetY;
 Predator(String filename)
 {
   super(filename);
 }
 void update()
 {
   float dx = targetX - x;
   float dy = targetY - y;
     
    if(abs(dx) > 2)
    {
      x += dx * .1;
    }
     
    if(abs(dy) > 2)
    {
      y += dy * .1;
    }

 }
}

class Pacman
{
  float x = 0;
  float y = 0;
  float speed = 5;
  float s = 1.0;
  float directionX = 1;
  float directionY = 1;
  float w;
  float h;
  
  Pacman (String filename)
  {
    this.img = requestImage(filename);
  }
 void render ()
 {  
      
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0);
      popMatrix();

   
 }
 void update()
 {
    // If hitting Right
    if (this.x > width - (this.w * this.s * 0.5) && this.directionX > 0)
    {
      this.x = width - (this.w * this.s * 0.5);
      this.directionX = -this.directionX * random(2);
      speed += 3;
     
    }
     
    // Left
    if (this.x < (this.w * this.s * 0.5) && this.directionX <= 0)
    {
      this.x = (this.w * this.s * 0.5);
      this.directionX = -this.directionX * random(2);
      speed -= 3;
    }
     
    // Bottom
    if (this.y > height - (this.h * this.s * 0.5) && this.directionY > 0)
    {
      this.y = height - (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 1.0;
    }
     
    // Top
    if (this.y < (this.h * this.s * 0.5) && this.directionY <= 0)
    {
      this.y = (this.h * this.s * 0.5);
      this.directionY = -this.directionY;
      this.s = 1.5;
    }
     
    // Move the sprite
    this.y += directionY  * speed;
    this.x += directionX  * speed;
  }
 
}





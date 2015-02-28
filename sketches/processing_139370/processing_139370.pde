


PImage fence;

class Cat
{
  PImage cat;
  float x = 250;
  float y = 300; 
  float speed = 5;
  float x2 = mouseX;
  float y2 = mouseY;
  float dx = x2 - x;
  float easing = -.5;
  
 Cat()
 {
   cat = requestImage("pusheen.png");
 }
 
 void draw()
 {
   this.x += this.speed;
   if ( this.x > width - (this.cat.width/3) || this.x < (this.cat.width/3))
   {
     this.speed = -this.speed;
   }
   if (this.cat.width > 0)
   {
     pushMatrix();
     translate(this.x, this.y);
     if (this.speed > 0)
     {
       scale( -1,1);
     }
     imageMode(CENTER);
     image(this.cat, 0,0);
     imageMode(CORNER);
     popMatrix();
   }
   
   if (dist ( x2 - cat.width, y2 - cat.height/2, x2 - cat.width/3, 400 -30) < 60)
   {
     this.speed = - this.speed;
   }
   
   if ( abs( dx) < 1)
   {
     x -= dx * easing;
   }
 }
 boolean rectRectIntersect(float left, float top, float right, float bottom,
 float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop); }
}

Cat kitty = new Cat();



void setup()
{
  
  size ( 1200,500);
  fence = requestImage("fence.jpg");
}




void draw()
{
  image(fence,0,0,width,height);
  kitty.draw();
}



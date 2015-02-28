
/* @pjs preload="Teemo-Render.png, Zilean-Render.png, Chogath-Render.png, league.jpg, grave.png"; */
 
PImage img;
Sprite chogath;
Sprite teemo;
Sprite teemo2;
Sprite teemo3;
Sprite zilean;
PImage grave;
float a = random(1000);
float b = random(1000);
float c = random(1000);
float d = random(100,900);
float e = random(100,500);
 
void setup() {
  img = loadImage("league.jpg");
  grave = loadImage("grave.png");
  size(1000, 600);
  chogath = new Sprite(200, 300, 100, 100, 6, "Chogath-Render.png");
  teemo = new Sprite(a, 200, 50, 50, 10, "Teemo-Render.png");
  teemo2 = new Sprite(b, 300, 50, 50, 10, "Teemo-Render.png");
  teemo3 = new Sprite(c, 400, 50, 50, 10, "Teemo-Render.png");
  zilean = new Sprite(d,e,100,100,8, "Zilean-Render.png");
}
 
void draw() { 
  imageMode(CORNER);
  image(img, 0 ,0);
  
  zilean.speed *= 0.99;
  
  chogath.move();
  teemo.move2();
  teemo2.move2();
  teemo3.move2();
  zilean.move();
   
  boolean collided = teemo.collide(chogath);
  boolean collided2 = teemo2.collide(chogath);
  boolean collided3 = teemo3.collide(chogath);
   
  if (zilean.age > 50)
  {
    zilean.dead = true;
    image(grave, zilean.x-50, zilean.y-50,100,100);
  }
 
   
  if (collided) {

    chogath.w *= 1.5;
    chogath.h *= 1.5;
    teemo.dead = true;
     
  }
  
  if (collided2) {

    chogath.w *= 1.5;
    chogath.h *= 1.5;
    teemo2.dead = true;
     
  }
  
  if (collided3) {

    chogath.w *= 1.5;
    chogath.h *= 1.5;
    teemo3.dead = true;
     
  }
  
  if (chogath.w == 150){
    chogath.speed *= 0.99999;
  }
  
  if (chogath.w == 225){
    chogath.speed *= 0.995;
  }
  
  if (chogath.w == 337.5){
    chogath.speed *= 0.9;
  }
  
   
  chogath.draw();
  teemo.draw();
  teemo2.draw();
  teemo3.draw();
  zilean.draw();
}
 
class Sprite
{
  float x;
  float y;
  float speed;
  PImage img;
  float w;
  float h;
  boolean dead;
  float age;
   
  Sprite(float xx, float yy, float ww, float hh, float sspeed, String imageName)
  {
    x = xx;
    y = yy;
    speed = sspeed;
    img = loadImage(imageName);
    w = ww;
    h = hh;
    dead = false;
    age = 0;
  }
   
  void draw()
  {
    if (!dead)
    {
      imageMode(CENTER);
      image(img, x, y, w, h);
    }
  }
   
  void move()
  {
    if (!dead)
    {
      age += 0.167;
         
      if (x >= width || x <= 0)
      {
        speed = -speed;
      }
           
      x += speed;
    }
  }
  
  void move2(){
    if (!dead){
      age += 0.167;
      
      if (y >= height || y <= 0){
        speed = -speed;
      }
      
      y += speed;
    }
  }
   
  boolean collide(Sprite other)
  {
    if (!dead)
    {
      float d = dist(x, y, other.x, other.y);
      float maxWidth = max(w, other.w);
         
      if (d < maxWidth)
      {
        return true;
      }
    }
       
    return false;
  }
}



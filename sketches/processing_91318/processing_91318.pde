
// http://www.openprocessing.org/sketch/90490 <- setting up a class, bouncing off walls, & collisions

/* preload="prof.png" */
/* preload="ash.png" */
/* preload="rocket.png" */
/* preload="pikachu.png" */
/* preload="pokeball.png" */
/* preload="stadium.png" */
/* preload="oak.jpg" */

Sprite prof;
Sprite ash;
Sprite rocket;
Sprite pokeball;
Sprite pikachu;
Sprite oak;
PImage stadium;


void setup() {
  stadium = loadImage("stadium.png");
  size(600,600);

  ash = new Sprite(125,300,50,60,5,"ash.png");
  rocket = new Sprite(480,300,40,50,7,"rocket.png");
  pikachu = new Sprite(300,150,50,60,5,"pikachu.png");
  prof = new Sprite(300,300,70,60,random(10),"prof.png");
  pokeball = new Sprite(300,150,50,60,5,"pokeball.png");
  oak = new Sprite(-1000,-1000,0,0,0,"oak.jpg");
}

void draw() {
  imageMode(CORNER);
  image(stadium,0,0);
  ash.move();
  rocket.move();
  pokeball.up();
  pikachu.up();
  prof.mew();
  boolean collided = ash.collide(rocket); // ash runs into rocket she gets smaller
  if (rocket.age > 60)
  {
    rocket.ko = true;
  }
  if (collided && rocket.w < 2000) {
    rocket.w /= 1.01;
    rocket.h /= 1.01;
  } 
    boolean collision = pikachu.collide(ash); //pikachu runs into ash and shocks him
  if (collision){
    ash.img.filter(INVERT);
    pikachu.img.filter(INVERT);
    }
    boolean collides = pikachu.collide(rocket); //pikachu runs into rocket and gets caught
  if (collides){
     pikachu.w = 0;
     pikachu.h = 0;
  }
   boolean colliding = prof.collide(ash); //ash runs into oak and there is an epic battle
  if (colliding){
    background(0);
    ash.w = 0;
    ash.h = 0;
    ash.speed = 0;
    pikachu.w = 0;
    pikachu.h = 0;
    pikachu.speed = 0;
    pokeball.w = 0;
    pokeball.h = 0;
    pokeball.speed = 0;
    prof.w = 0;
    prof.h = 0;
    prof.speed = 0;
    oak.x = 300;
    oak.y = 300;
    oak.w = 600;
    oak.h = 600;
    
  }
  
  ash.draw();
  rocket.draw();
  pokeball.draw();
  pikachu.draw();
  prof.draw();
  oak.draw();
}


class Sprite //
{
  float x;
  float y;
  float speed;
  PImage img;
  float w;
  float h;
  boolean battle;
  boolean ko;
  float age;
  
   

  Sprite(float xx, float yy, float ww, float hh, float sspeed, String imageName)
  {
    x = xx;
    y = yy;
    speed = sspeed;
    img = loadImage(imageName);
    w = ww;
    h = hh;
    ko = false;
    age = 0;
  }
  
  void draw() // drawing sprites
  {
    if (!ko)
    {
      imageMode(CENTER);
      image(img, x, y, w, h);
    }
  
  }


void move(){
  if (!ko)
    {
      age += 0.167; 
         
      if (x >= width || x <= 0)  // bounce off wall HORIZONTALLY
      {
        speed = -speed;
      }
           
      x += speed;
    }

}

void mew(){
  if (!ko)
    {
      age += 0.167; 
         
      if ((x >= width || x <= 0) & (y >= height || y <= 0))  // bounce off wall HORIZONTALLY
      {
        speed = -speed;
      }
      y += speed;    
      x += speed;
    }

}
void up(){
  if (!ko)
    {
      age += 0.167; 
         
      if (y >= height || y <= 0)  // bounce off wall VERTICALLY
      {
        speed = -speed;
      }
           
      y += speed;
    }
  
}
 boolean collide(Sprite other) // collision tests
  {
    if (!ko)
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




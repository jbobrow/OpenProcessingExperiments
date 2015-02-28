
/* @pjs preload="Zoo Back.jpg, Bunny.jpg, Fat Rex.jpg,
Monkey.jpg, Monkey Bones.jpg, T Rex.jpg"; */

PImage background;
PImage img;
int monkeySize = int(random(50, 90));
int bunnySize = int(random(40, 80));
int rexSize = int(random(50, 90));
String monkeyPic = "Monkey.jpg";
String bunnyPic = "Bunny.jpg";
String rexPic = "T Rex.jpg";
Sprite monkey;
Sprite bunny;
Sprite rex;

void setup() {
  background = loadImage("Zoo Back.jpg");
  size(600, 450);
  monkey = new Sprite(200, 100, monkeySize, monkeySize, int(random(-4, 4)), int(random(-4, 4)));
  bunny = new Sprite(400, 300, bunnySize, bunnySize, int(random(-4, 4)), int(random(-4, 4)));
  rex = new Sprite(300, 200, rexSize, rexSize, int(random(-4, 4)), int(random(-4, 4)));
}

void draw() {
  imageMode(CORNER);
  image(background, 0, 0);
  
  monkey.move();
  bunny.move();
  rex.move();
  
  boolean collided = rex.collide(bunny);
  
  if (monkey.age > 60)
  {
    monkey.dead = true;
  }
  
  if (collided)
  {
    bunny.eaten = true;
    rex.fat = true;
  }
  
  monkey.draw("Monkey.jpg");
  bunny.draw("Bunny.jpg");
  rex.draw("T Rex.jpg");
}

class Sprite
{
  float x;
  float y;
  float speed;
  float yspeed;
  float w;
  float h;
  boolean dead;
  boolean eaten;
  boolean fat;
  float age;
  
  Sprite(float xx, float yy, float ww, float hh, float sspeed, float yyspeed) 
  {
    x = xx;
    y = yy;
    speed = sspeed;
    yspeed = yyspeed;
    w = ww;
    h = hh;
    dead = false;
    age = 0;
  }
  
  void draw(String imageName)
  {
    img = loadImage(imageName);
    if (dead) {
      img = loadImage("Monkey Bones.jpg");
    }
    if (fat) {
      img = loadImage("Fat Rex.jpg");
      speed = int(speed/2);
      yspeed = int(yspeed/2);
    }
    if (!eaten) {
      imageMode(CENTER);
      image(img, x, y, w, h);
    }
  }
  
  void move()
  {
    if (!dead && !eaten)
    {
      age += 0.167;
      
      if (x >= width || x <= 0 || y >= height || y <= 0)
      {
        speed = -speed;
        yspeed = -yspeed;
      }
      x += speed;
      y += speed;
    }
  }
  
  boolean collide(Sprite other)
  {
    if (!eaten)
    {
      float d = dist(x, y, other.x, other.y);
      float maxWidth = max(w, other.w);
      float maxHeight = max(h, other.h);
      
      if (d < maxWidth)
      {
        return true;
      }
    }
    
    return false;
  }
}




SpriteObject spaceship;
SpriteObject[] asteroid = new SpriteObject[30];
float timer = 0;
float timer2 = 0;
int GameState = 0;
int collision = 0;

void setup()
{

  size(500, 500);

  setMeteors(); 
  spaceship = new SpriteObject("Spaceship.png");
  spaceship.x = 250;
  spaceship.y = 450;
  spaceship.rotation = 180;
  spaceship.s = .3;
  
}

void draw()
{

  if (GameState == 0)
  {
    setMeteors();
    noTint();
    collision = 0;
    background(255);
    fill(0);
    textSize(32);
    text("Instructions", 150, 100);
    textSize(20);
    text("Use the UP, DOWN, LEFT, RIGHT arrow keys to move", 0, 150);
    text("Dodge the asteroids as they approach ", 0, 200);
    text("your spaceship!", 0, 250);
    text("Press 'S' to begin!", 100, 350);

    if (key == 'S' || key == 's')
    {
      GameState = 1;
    }
    timer = 0.0;
    timer2 = 0.0;
  }

  if (GameState == 1)
  {  

    timer += 0.0167;
    timer2 += 0.0167;
    background(0);

    if (timer < 7.0)
    {
      spaceship.render();
    
    }
    
    if (timer2 > 7.0)
    {
      fill(255);
      
      if (collision == 0)
      {
      text("Congradulations! You survived the asteroid field!", 0, 100);
      text("Press R to play again", 50, 150);
      }
      
      if (collision == 1)
      {
        text("I'm sorry, but you have died, try again.", 50, 100);
        text("Press R to play again", 50, 150);
      }
      
    if (key == 'R' || key == 'r')
    {
      GameState = 0;
    }
    }
    
    
    if (keyPressed == true)
    {
      if (keyCode == RIGHT)
      {
        spaceship.x += 10;
      }
      if (keyCode == LEFT)
      {
        spaceship.x -= 10;
      }
      if (keyCode == UP)
      {
        spaceship.y -= 10;
      }
      if (keyCode == DOWN)
      {
        spaceship.y += 10;
      }
    }

    for (int i = ceil(asteroid.length * 0); i < asteroid.length * .33; i++)
    {
      asteroid[i].render();
      asteroid[i].y += 2;
      asteroid[i].rotation += 5;
      if (asteroid[i].isOverlapping(spaceship))
      {
        tint(255, 0, 0);
        collision = 1;
      }
    } 

    for (int i = ceil(asteroid.length *.33); i < asteroid.length * .66; i++)
    {
      asteroid[i].render();
      asteroid[i].x += 2;
      asteroid[i].rotation += 5;
      if (asteroid[i].isOverlapping(spaceship))
      {
        tint(0, 255, 0);
        collision = 1;
      }
    } 

    for (int i = ceil(asteroid.length *.66); i < asteroid.length; i++)
    {
      asteroid[i].render();
      asteroid[i].x -= 2;
      asteroid[i].rotation += 5;
      if (asteroid[i].isOverlapping(spaceship))
      {
        tint(0, 0, 255);
        collision = 1;
      }
    }

  }
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

void setMeteors()
{  for (int i = ceil(asteroid.length * 0); i < asteroid.length * .33; i++)
  {
    asteroid[i] = new SpriteObject("asteroid.png");
    asteroid[i].x = random(500);
    asteroid[i].y = random(-300);
    asteroid[i].s = .1;
    
  }

  for (int i = ceil(asteroid.length *.33); i < asteroid.length * .66; i++)
  {
    asteroid[i] = new SpriteObject("asteroid.png");
    asteroid[i].x = random(-300);
    asteroid[i].y = random(500);
    asteroid[i].s = .1;
  }

  for (int i = ceil(asteroid.length * .66); i < asteroid.length; i++)
  {
    asteroid[i] = new SpriteObject("asteroid.png");
    asteroid[i].x = random(510, 810);
    asteroid[i].y = random(500);
    asteroid[i].s = .1;
  }
}




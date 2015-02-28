
PImage mansion;
class Predator 
{
  PVector target = new PVector(random(20, 40), random(20, 40));
  PImage luigi;
  PVector position = new PVector(600, 400);
  int dir = 1;
  float speed = .02;
  float _scale = 1;
  
  Predator()
  {
    this.luigi = requestImage("luigi.hunting.png");
  }
  void update() {
    imageMode(CENTER);
  }
  void draw(float targetx, float targety)
  {
    float toX = targetx - this.position.x;
    float toY = targety - this.position.y;
 
    this.position.x += (toX * this.speed);
    this.position.y += (toY * this.speed);
 
    image(luigi, this.position.x, this.position.y, 64*this._scale, 64*this._scale);
  }
}
class prey1 
{
  float size = 50;
  float life = -2;
  PImage ghost1;
  boolean alive = true;
  PImage coin;
  float coinSpot_x;
  float coinSpot_y;
  PVector position = new PVector(16, 16);
  PVector dir = new PVector(2, 2);
 
 
  prey1() 
  {
    this.ghost1 = requestImage("ghost.luigi1.jpg");
    this.coin = requestImage("coin.png");
  }
 
  void update() 
  {
    if (this.position.x >= width || this.position.x <= 0) 
    {
      this.dir.x *= -1;
    }
    if (this.position.y >= height || this.position.y <= 0) 
    {
      this.dir.y *= -1;
    }
    this.position.x += this.dir.x;
    this.position.y += this.dir.y;
  }
  void draw() 
  {
    if (this.life<10) 
    {
      life += 1/frameRate;
    }
    if (alive == true&&life>=10) 
    {
      alive = false;
      this.coinSpot_x = this.position.x;
      this.coinSpot_y = this.position.y;
    }
    if (alive == false&&life>=10) 
    {
      image(coin, this.coinSpot_x, this.coinSpot_y, this.size, this.size);
    }
    if (alive == true) 
    {
      if (this.dir.x>0) 
      {
        pushMatrix();
        translate(this.position.x, this.position.y);
        scale(-1, 1);
        imageMode(CENTER);
        image(this.ghost1, 0, 0, this.size, this.size);
        
        popMatrix();
      } 
      if (this.dir.x<0) 
      {
        image(ghost1, this.position.x, this.position.y, 128, 64);
      }
    }
  }
}
 
class prey2
{
  float size = 50;
  boolean alive = true;
  PImage ghost2;
  PVector position = new PVector(16, 16);
  int dir = 2;
 
  prey2() 
  {
    this.ghost2 = requestImage("ghost.luigi2.jpg");
  }
  
  void update() 
  {
    imageMode(CENTER);
    if (this.position.x < width && this.position.y > 0) 
    {
      this.position.x += this.dir;
    }
    if (this.position.x >= width) 
    {
      this.dir *= -1;
      this.position.x = width - 4;
    }
    if (this.position.x <= 0)
    {
      this.dir *= -1;
      this.position.x = 1;
    }
  }
 
  void draw()
  {
    if (this.alive == true) 
    {
      if (this.dir > 0) 
      {
        pushMatrix();
        translate(this.position.x, this.position.y, this.size, this.size);
        scale(-1, 1);
        imageMode(CENTER);
        image(this.ghost2, 0, 0, this.size, this.size);
        popMatrix();
      } 
      if (this.dir<0)
      {
        image(ghost2, this.position.x, this.position.y, 128, 64);
      }
    }
  }
}
 
prey2 Prey2 = new prey2();
prey1 prey1 = new prey1();
Predator predator = new Predator();
 
void setup() 
{
  size(640, 480);
  mansion = requestImage("mansion.jpg");
  Prey2.position.x = width/2;
  Prey2.position.y=64;
}
 
void draw() {
  if (mansion.width>0) 
  {
    imageMode(CORNER);
    image(mansion, 0, 0, 640, 480);
    prey1.update();
    prey1.draw();
    Prey2.update();
    Prey2.draw();
 
    float distToPrey2 = dist(predator.position.x, predator.position.y, Prey2.position.x, Prey2.position.y);
    float distToprey1 = dist(predator.position.x, predator.position.y, prey1.position.x, prey1.position.y);
    if (distToPrey2 < distToprey1)
    {
      predator.draw(Prey2.position.x, Prey2.position.y);
    }
    if (distToPrey2 > distToprey1)
    {
      predator.draw(prey1.position.x, prey1.position.y);
    }
    if (distToPrey2 < 32 && predator._scale < 1.5) {
      predator._scale += .5;
      Prey2.alive = false;
    }
    if (distToprey1 < 32 && predator._scale < 1.5) {
      predator._scale += .5;
      prey1.alive = false;
    }
  }
}




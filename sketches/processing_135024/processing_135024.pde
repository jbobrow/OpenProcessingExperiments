

float x = 40;
float speed = 2;

float pred1x = 200;
float pred1y = 100;
float pred1radius = 40;
float pred1speed = 3;

float pred2x = 250;
float pred2y = 200;
float pred2radius = 50;
float pred2speed = 3;

float easing = .025;

class pred1
{
  float size = 50;
  float speed = 3;
  PVector position = new PVector(200, 200);
  PImage pred1;
  
  pred1()
  {
    this.pred1 = requestImage("choochus_Hawk_Pouncing_Silhouette_Vector_Clipart.png");
  }
  
  void update()
  {
    float toX = targetX - this.position.x;
    float toy = targetY - this.position.y;
    
    {
      this.speed = 5;
    }
    
    PVector direction = new PVector(toX , toY);
    direction.normalize();
    this.position.x += direction.x * this.speed;
    this.position.y += direction.y * this.speed;
  }
      class prey
    {
      float size = 30;
      float speed = 3;
      PImage prey;
      
      prey()
      {
        this.prey = requestImage("vector_fox_by_wolfypuppy-d41b75p.png");
      }
    }
  void draw()
  {
        if (pred1.width > 0 && dist(x, y, this.position.x, this.position.y) > 20)
    {
      image(pred1, this.position.x, this.position.y, this.size, this.size);
    }
  }
}

pred1 mypredator = new pred1();


void setup()
{
  size (750,750);
  noStroke();
}
  




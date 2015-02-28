
float x = 200;
float y = 200;
float tx = 200;
float ty = 200;
float speed = 2;
PImage evil;

float diagonalspeed = 3;
float ydiagonal = 100;
float xdiagonal = 100;

class helix
{
  float size = 40;
  float helixspeed = 2;
  PVector position = new PVector(300, 300);
  PImage fossil;
  
  helix()
  {
    this.fossil = requestImage("Helix Fossil.png");
  }
  void update()
  {
    float toX = tx - this.position.x;
    float toY = ty - this.position.y;
   
    PVector direction = new PVector(toX , toY);
    direction.normalize();
    this.position.x += direction.x * this.helixspeed;
    this.position.y += direction.y * this.helixspeed;
  }
   
  void draw()
  {
    if (fossil.width > 0)
    {
      image(fossil,this.position.x, this.position.y, this.size, this.size);
    }
  }
}
 
helix savior = new helix();
helix birdjesus = new helix();
 
void setup()
{
    size(500, 500);
    noStroke();
    evil = requestImage("False Prophet.png");
     
    birdjesus.position.y = 0;
}
 
void draw()
{
  fill(0,0,0, 10);
  rect(0,0,width,height);
   
  x = x + speed;
  ydiagonal = ydiagonal + diagonalspeed;
  xdiagonal = xdiagonal + diagonalspeed;
   
  if (x > width)
  {
    speed = -speed;
  }
  if (x < 0)
  {
    speed = -speed;
  }
  if (xdiagonal > width)
  {
    diagonalspeed = -diagonalspeed;
  }
  if (xdiagonal < 0)
  {
    diagonalspeed = -diagonalspeed;
  }
  
  
   
  fill(255);
  float waveSpeed = random(0.1, 5);
  float waveHeight = random(2, 15);
  y = 33 + tan(x * waveSpeed) * waveHeight;
  if(evil.width > 0)
  {
    image(evil, x, y, 100, 100);
    image(evil, xdiagonal, ydiagonal, 50,50);
  }
  float distanceToX = dist(savior.position.x, savior.position.y, x, y);
   float distanceToXDiagonal = dist(savior.position.x, savior.position.y, xdiagonal,ydiagonal);
   if (distanceToX < distanceToXDiagonal)
   {
   tx = x;
   ty = y;
   }
   else
   {
   tx = xdiagonal;
   ty = ydiagonal;
   }
  savior.update();
  savior.draw();
   
  //birdjesus.update();
  //birdjesus.draw();
}




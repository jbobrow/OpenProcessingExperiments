
float ballX = 0;
float ballY = 0;
int speedX = int(random(4,10));
int speedY = int(random(1,4));
int hit = 0;
int miss = 0;
int paddle = 100;
int talleyx = 10;
ArrayList<Integer> hitcount;
ArrayList<Integer> misscount;

void setup()
{
  noCursor();
  size(600,400);
  hitcount = new ArrayList<Integer>();
  misscount = new ArrayList<Integer>();
}
void draw()
{
  paddle = 100;
  if (ballX < 0 || ballX > width)
  {
    speedX = -speedX;
  }
  if (ballY > height)
  {
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if (distance < paddle)
    {
      hitcount.add(1);
      
    }
    else
    {
      misscount.add(1);
    }
  }
  else
  {
    speedY += int(random(1,8));
  }
  shapes();
}
void shapes()
{
  ballX += speedX;
  ballY += speedY;
  background(0,130,40);
  fill(70,20,140);
  ellipse(ballX,ballY,50,50);
  fill(70,20,140);
  rect(mouseX - paddle,height - 10,2 * paddle,10);
  text("hit: " + hitcount.size(),10,10);
  text("misses: " + misscount.size(),10,20);
}
void mouseClicked()
{
  hitcount = new ArrayList<Integer>();
  misscount = new ArrayList<Integer>();
}

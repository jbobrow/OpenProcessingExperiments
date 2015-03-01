
Ball b;
ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>();

void setup()
{
  size(700,700);
  b = new Ball(200,200,5,1);
  for (int i = 0; i < 10; i++)
  {
    rectangles.add(new Rectangle(random(height), random(width)));
  }
  println(rectangles.size());
}

void draw()
{
  background(0);
  b.drawBall();
  for (int i = 0; i < rectangles.size(); i++)
  {
    Rectangle r = rectangles.get(i);
    r.update();
  }
}

class Ball
{
  float xpos;
  float ypos;
  float xvel;
  float yvel;
  float s;
  
  Ball(float x, float y, float xv, float yv)
  {
    xpos = x;
    ypos = y;
    xvel = xv;
    yvel = yv;
    s = 30;
  }
  void drawBall()
  {
    xpos += xvel;
    ypos += yvel;
    
    if ((xpos < 0) || (xpos > width))  xvel *= -1;
    if ((ypos < 0) || (ypos > height))  yvel *= -1;
    
    fill(#8CAEB2);
    noStroke();
    ellipse(xpos,ypos,s,s);
  }
}
  
class Rectangle
{
  float posx;
  float posy;
  float w;
  float h;
  color c;
  
  Rectangle(float x, float y)
  {
    posy = x;
    posx = y;
    w = random(200);
    h = random(200);
    c = color(random(255),random(255),random(255));
  }
  
  void update()
  { 
    fill(c);
    noStroke();
    rect(posx,posy,w,h);
  }
}

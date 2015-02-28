
//Jimmy C; Block 6; CP1

PImage shake;
int xx=100;
int yy=200;

void setup()
{
  size(500, 500);
  background (255);
  textAlign(CENTER);
  shake = loadImage ("http://coolestjc.webs.com/shakeweight.jpg");
}

void draw()
{
  background (255);
  
  fill(0);
  textSize(50);
  text ("Try Me", 250,100);
  textSize(15);
  text ("Click Left Mouse = Level 1 Exercise, Right = Level 2 Exercise",250,400);
  
  image (shake, xx, yy, 300, 100);
  if (mouseButton == LEFT)
  {
    xx=xx+int(random(-2, 2));
  }
  if (mouseButton == RIGHT)
  {
    xx=xx+int(random(-8, 8));
    yy=yy+int(random(-2, 2));
  }
}

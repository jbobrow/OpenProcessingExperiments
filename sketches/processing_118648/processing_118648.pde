
PFont times;
PFont comic;
float angle = 0;
float x = 0;
float speed = 1;
PImage sonic;

void setup()
{
  size(500,500);
  times = createFont("Blackoak Std", 64);
  comic = createFont("Comic Sans MS", 64);
  sonic = requestImage("sonic.gif");
}

void draw()
{
  if (sonic.width > 0)
  {
    image(sonic, 0, 0, width, height);
  }
  
  angle += 0.1;
  x += speed;
  fill(0);
  textSize(100);
  textFont(times);
  
  pushMatrix();
  translate(100, 100);
  rotate(angle);
  text("Wheel", 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(x, 400);
  scale(x / 200);
  textFont(comic);
  textAlign(CENTER);
  fill(255, 0, 0);
  text("HOT DOG", 0, 0, width, 200);
  textAlign(LEFT);
  popMatrix();
}




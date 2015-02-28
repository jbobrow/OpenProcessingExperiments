
int NUM_SPARKLES = 300;
//PImage sparkle;

Sparkle[] sparkles = new Sparkle[NUM_SPARKLES];

void setup()
{ size(500, 500);

for (int i = 0; i < NUM_SPARKLES; i++)
{
  sparkles[i] = new Sparkle();
  
  sparkles[i].x = random(0, width);
  sparkles[i].y = random(0, height);
  sparkles[i].direction = random(1, 360);
}
}

void draw()
{ noStroke();
  fill(255, 30);
rect(0, 0, width, height);

for (int i = 0; i < NUM_SPARKLES; i++)
{ sparkles[i].update();
}

}

class Sparkle
{ float x;
float y;
float r = random(256);
float g = random(256);
float b = random(256);
float speed = random(1, 5);
float direction = 45;
PImage sparkle;


Sparkle()
{
}

void update()
{
  float dX = tan(radians(direction))*speed;
  float dY = cos(radians(direction))*speed;
  
  x = x + dX;
  y = y+dY;
  
tint(r, g, b);
sparkle = loadImage("sparkle.png");
image(sparkle, x, y);
    
    if (x> width + sparkle.width/2)
  { x = -sparkle.width/2;
  }
  if (x < -sparkle.width/2)
  { x = width + sparkle.width/2;
  }
  
  if (y > height + sparkle.width/2)
  { y = -sparkle.width/2;
  }
  
  if (y < 0-sparkle.width/2)
  { y = sparkle.width/2 + height;
  }
  
  for (int i = 0; i < NUM_SPARKLES; i++)
{ Sparkle other = sparkles[i];
if (this != other)
{ if (dist(x, y, other.x, other.y) < sparkle.width/2)
direction = -direction;
{ 
}
}
}


}

}



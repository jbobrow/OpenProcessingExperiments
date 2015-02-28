
float[] numbers = new float[13];
SpriteObject[] images = new SpriteObject[13];
float timer = 0;
int index = 0;

void setup()
{
  size(500,500);
  
  for (int i = 0; i < 13; i += 1)
  {
    images[i] = new SpriteObject("cucoo" + i + ".png");
  }
  for (int i = 0; i < 13; i += 1)
  {
    images[i].x = width/2;
  }
  for (int i = 0; i < 13; i += 1)
  {
    images[i].y = height/2;
  }
  for (int i = 0; i < 13; i += 1)
  {
    images[i].w = width;
  }
  for (int i = 0; i < 13; i += 1)
  {
    images[i].h = height;
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    if(keyCode == RIGHT)
    {
      index += 1;
    }
  }
  if(key == CODED)
  {
    if(keyCode == LEFT)
    {
      index -= 1;
    }
  }
}

void draw()
{
  timer = timer + 0.0167;
  if(timer > 3)
  {
    index += 1;
    timer = 0;
  }
  if(index >= 13)
  {
    index = 0;
  }
  if(index < 0)
  {
    index = 12;
  }

  images[index].render();
  if(timer>=0 && timer <= 3)
  {
    drawSpirals();
  }
}

void drawSpirals()
{
  noStroke();
smooth();
float radius = 1.0;
for (int deg = 0; deg < 360*6; deg += 11) //mult by 6
{
  float angle = radians(deg);
  float x = 480 + (cos(angle) * radius);
  float y = -20 + (sin(angle) * radius);
  fill(#EDE316);
  ellipse(x,y,6,6); //originally 6,6
  radius = radius + 0.34; //add 0.34
}
float r = 1.0;
for (int deg = 0; deg < 360*6; deg += 11)
{
  float angle = radians(deg);
  float x = 20 + (cos(angle) * r);
  float y = -20 + (sin(angle) * r);
  fill(#EDE316);
  ellipse(x,y,6,6);
  r = r + 0.34;
}
float g = 1.0;
for (int deg = 0; deg < 360*6; deg += 11)
{
  float angle = radians(deg);
  float x = 480 + (cos(angle) * g);
  float y = 520 + (sin(angle) * g);
  fill(#EDE316);
  ellipse(x,y,6,6);
  g = g + 0.34;
}
float n = 1.0;
for (int deg = 0; deg < 360*6; deg += 11)
{
  float angle = radians(deg);
  float x = 20 + (cos(angle) * n);
  float y = 520 + (sin(angle) * n);
  fill(#EDE316);
  ellipse(x,y,6,6);
  n = n + 0.34;
}
float m = 1.0;
for (int deg = 0; deg < 360*6; deg += 11)
{
  float angle = radians(deg);
  float x = 250 + (cos(angle) * m);
  float y = 520 + (sin(angle) * m);
  fill(#EDE316);
  ellipse(x,y,6,6);
  m = m + 0.34;
}
float f = 1.0;
for (int deg = 0; deg < 360*6; deg += 11)
{
  float angle = radians(deg);
  float x = 250 + (cos(angle) * f);
  float y = -20 + (sin(angle) * f);
  fill(#EDE316);
  ellipse(x,y,6,6);
  f = f + 0.34;
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




ArrayList<Particle> list;
final float rand = 1;
final int cn = 1;
final float am = 0.5;
boolean[][] data;
PGraphics buf;
PImage image;
PVector light;

void setup()
{
  size(500, 500);
  frameRate(60);
  list = new ArrayList<Particle>();
  data = new boolean[width][height];
  for(int i = 0;i < 20000;i++)
    list.add(new Particle(random(width), random(height)));
  buf = createGraphics(width, height, JAVA2D);
  image = loadImage("img.png");
  light = new PVector(1, 1);
  light.normalize();
}

void draw()
{
  colorMode(RGB, 255);
  
  for(int c = 0; c < 100; c++)
  for(int i = 0; i < list.size(); i++)
  {
     list.get(i).draw();
     if(list.get(i).isDead)
     {
       list.remove(i);
       i--;
     }
  }

  
  if(mousePressed)
      data[mouseX][mouseY] = true;
      
  buf.beginDraw();
  buf.background(0);
  buf.loadPixels();
  for(int x = 0; x < width; x++)
    for(int y = 0; y < width; y++)
    {
      if(data[x][y])
        buf.pixels[x+y*width] = color(255);
    }
  buf.updatePixels();
    
  buf.filter(BLUR, 1);
  buf.filter(ERODE); 
  
  buf.blend(buf, 0, 0, width, height, 0, 0, width, height, ADD);
  
  buf.endDraw();
  
  background(30, 50, 100);
  blend(buf, 0, 0, width, height, 0, 0, width, height, ADD);
  stroke(255);
  text("Count:" + list.size(), 10, 10);
}

color getVal(float x, float y)
{
  return buf.get((int)x, (int)y);
}

private class Particle
{
  float x, y;
  boolean isDead;
  
  Particle(float x, float y)
  {
    this.x = x;
    this.y = y;
    isDead = false;
  }
  
  void draw()
  {
    //point(x, y);
    update();
  } 
  
  protected void update()
  {
    if(y > height)
      y = height;
    if(y < 0)
      y = 0;
      
    if(x > width)
      x = width;
    if(x < 0)
      x = 0;
      
    int c = 0;
    if(x > 0 && y > 0 && x < width-1 && y < height-1)
      for(int rx = -1; rx < 2;rx++)
        for(int ry = -1; ry < 2;ry++)
          if(data[(int)(x + rx)][(int)(y + ry)])
          {
            c++;
          }   
          
    if(c == cn)
    {
      data[(int)x][(int)y] = true;
      if(random(1) > am)
      isDead = true;
      return;
    }
    
    x += random(rand+rand) - rand;
    y += random(rand+rand) - rand;
  }
  
}


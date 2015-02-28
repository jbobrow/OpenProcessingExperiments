
//Brandon Kite
//May 2 2010
//Pixel Ants

class _point
{
  public int x;
  public int y;
  
  public _point(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}

class Ant
{
  ArrayList Path = new ArrayList();
  color[] colors = new color[8];
  int[] fitness = new int[8];
  public color col;
  public int x ,y ;
  int rand;
public Ant(int x, int y, color Col, int rand)
{
  this.x = x;
  this.y = y;
  this.rand = rand;
  col = Col;
}
  boolean CheckPath(int x, int y)
  {
    boolean clear = true;
    for (int i = 0; i < Path.size(); i++)
    {
      _point p = (_point)Path.get(i);
      if (p.x == x && p.y == y)
        clear = false;
    }
    return clear;
  }
  int indexToX(int index)
  {
    int x = 0;
    if (index == 0)
     x = -1;
    else if (index == 2)
     x = 1;
     return x;
  }
   int indexToY(int index)
  {
    int y = 0;
    if (index == 1)
     y = -1;
    else if (index == 3)
     y = 1;
     return y;
  }
  public void Traverse(PImage a)
  {
 
    if (x > 1 && y > 1)
    {
      colors[0] = a.pixels[y*a.width+x-1];

      colors[1] = a.pixels[(y-1)*a.width+x];
    
      if (x < width-1)
      {
        colors[2] = a.pixels[y*a.width+x+1];
      }
      if (y < height-1)
      {
        colors[3] = a.pixels[(y+1)*a.width+x];
      }
    }
    
    int index = -1;
    float HighFit = 999999999;
    float tempFit = 0;
    for(int i = 4; i >= 0; i--)
    {
      int r = (colors[i] >> 16)& 0xFF;
      int g = (colors[i] >> 8)& 0xFF;
      int b = colors[i]& 0xFF;
      int lum = (int)(r*0.3 + g*0.59 + b*0.11);
      
    tempFit = dist(lum,lum,lum,
                        (col >> 16)& 0xFF,(col>> 8)& 0xFF,col& 0xFF);
      loadPixels();
      int newX = (int)max(min(width-1,x + indexToX(i)),0);
      int newY = (int)max(min(height-1,y + indexToY(i)),0);
      
      if ((tempFit < HighFit) && (CheckPath(newX,newY)) && (pixels[newY*width+newX] != col))
      {
        index = i;
        HighFit = tempFit;
      }
    }
    if (index == -1)
    {
      while(!CheckPath(x + indexToX(index), y +indexToY(index)))
      {
        if (index == 3)
        {
          x = (int)random(width);
          y = (int)random(height);
          break;

        }
       index +=1;
       
      }
    }

    if (index == 0)
    {
      x -= 1;
    }
    else if (index == 1)
    {
      y -= 1;
    }
    else if (index == 2)
    {
      x += 1;
    }
    else if (index == 3)
    {
      y += 1;
    }
    if (x < 2 || x > a.width-2)
      x= (int)random(a.width-1);

    if (y < 2 || y > a.height-2)
      y = (int)random(a.height - 1);
   

    Path.add(new _point(x,y));

      if (Path.size() > 300 - rand)
      {
        Path.clear();
        x= (int)random(a.width-1);
        y = (int)random(a.height - 1);
      }
  }
}
PImage a; 
int ImageIndex = 0;
PGraphics pg;
Ant[] myAnts;

int multiples = 11;
int shades = 51;
boolean ShowOriginal = false;
void setup()
{
  myAnts = new Ant[multiples*shades];
   PFont font;

  font = loadFont("AngsanaUPC-48.vlw");
  size(640,480,P2D);
  smooth();
  
  a = loadImage("Penguins.jpg");
  a.resize(width,height);
  pg = createGraphics(width,height,P2D);
  //image(a,0,0);
  int counter = 0;
  int c = Integer.MAX_VALUE / shades;
  for(int i = 0; i < multiples; i++)
  {
    for(int k = 0; k < shades; k++)
    {
    myAnts[counter] = new Ant((int)random(width),(int)random(height),color(c * max(k,1) * 2), (int)random(200));
    counter ++;
    }

  }

}
void draw()
{
  background(0);
  
  pg.beginDraw();
  pg.loadPixels();
  for(int i = 0; i < multiples*shades; i++)
  {
    myAnts[i].Traverse(a);
    pg.pixels[myAnts[i].x + myAnts[i].y*pg.width] = myAnts[i].col;
  }
  pg.updatePixels();
  pg.endDraw();
  
  if (ShowOriginal)
    image(a,0,0);
  
  image(pg, 0, 0, width, height);
}

void keyPressed()
{

  if (key == 'i' || key == 'I')
  {
    ShowOriginal = !ShowOriginal;
  }
  if (key == 'n' || key == 'N')
  {
    ImageIndex += 1;
    if (ImageIndex > 6)
      ImageIndex = 0;
    pg = createGraphics(width,height,P2D);
    if (ImageIndex == 0)
      a = loadImage("Penguins.jpg");
    if (ImageIndex == 1)
      a = loadImage("wildlife_bald_eagle.jpg");
    if (ImageIndex == 2)
      a = loadImage("wildlife-1.jpg");
    if (ImageIndex == 3)
      a = loadImage("wildlife1000clem2005.jpg");
    if (ImageIndex == 4)
      a = loadImage("3013_1153024018_large.jpg");
    if (ImageIndex == 5)
      a = loadImage("3013_1153022555_large.jpg");
    if (ImageIndex == 6)
      a = loadImage("3013_1153022345_large.jpg");
    int img_width = a.width;
    int img_height = a.height;
    
    if (img_width >= img_height)
    {
      float _scale = width / img_width;
      img_width = width;
      img_height = (int)(_scale * img_height);
    }
    else if (img_width < img_height)
    {
      float _scale = height / img_height;
      img_width = (int)(_scale * img_width);
      img_height = height;
    }
      for(int i = 0; i < multiples*shades; i++)
      {
        myAnts[i].x = (int)random(img_width-1);
        myAnts[i].y = (int)random(img_height-1);
      }
    a.resize(img_width,img_height);
     //ImageIndex = 0;
  }
  
}


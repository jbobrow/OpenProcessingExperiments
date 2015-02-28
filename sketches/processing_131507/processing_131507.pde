
String cat = "nelly";
String cat2 = "snuggles";
String cat3 = "fartpigwigly";

String[] cats = {"nelly", "snuggles", "fartpigwigly"}; 
String[] morecats = new String[10];
float[][] grid = new float[3][4];

PImage[] myimages = new PImage[3];

int backgroundIndex = 0;
float timer = 0;

class SpriteObject
{
  PImage m_image;
  float  m_rotation;
  float m_x;
  float m_y;
  float m_w;
  float m_h;
  
  void draw()
  {
    if (m_image.width > 0)
    {
      
      tint(0,0,255);
      pushMatrix();
      translate(m_x, m_y);
      rotate(radians(m_rotation));
      imageMode(CENTER);
      image(m_image, 0, 0, m_w, m_h);
      popMatrix();
      noTint();
      imageMode(CORNER);
    }
  }
}

SpriteObject mysprite = new SpriteObject();

void setup()
{
  size(500, 500);
  frameRate(30);
  
  mysprite.m_image = requestImage("car.png");
  mysprite.m_x = 400;
  mysprite.m_y = 300;
  mysprite.m_rotation = 75;
  mysprite.m_w = 200;
  mysprite.m_h = 200;
  
  myimages[0] = requestImage("car.png");
  myimages[1] = requestImage( "smile.png");
  myimages[2] = requestImage( "palette.jpg");
  
  //println("cat 1: " + cat);
  //println("cat 2: " + cat2);
  //println("cat 3: " + cat3);
  grid[0][2] = 3.0;
  cats[1] = "bob grump google butt";
  
  for (int i = 0; i < cats.length; i = i + 1)
  {
    println("cat "+ (i+1) + ": " + cats[i]);
  }
  
  for (int i = 0; i < grid.length; i = i + 1)
  {
    for (int j = 0; j < grid[0].length; j = j + 1)
    {
      println(grid[i][j]);
    }
  }
}

void draw()
{
  background(255);
  timer = timer + 1.0 / 30.0;
  
  if (timer > 3)
  {
    backgroundIndex = backgroundIndex + 1;
    timer = 0;
  }
  
  if (backgroundIndex >= myimages.length)
  {
    backgroundIndex = 0;
  }
  
  if (myimages[backgroundIndex].width > 0)
  {
    drawLoadedImage(myimages[backgroundIndex], 0, 0, width, height);
  }
  
  for (int i = 0; i < myimages.length; i = i + 1)
  {
    drawLoadedImage(myimages[i], i * 100, 0, 100, 100);
  }
  
  mysprite.draw();
  
}

void drawLoadedImage(PImage aimage, float ax, float ay, float aw, float ah)
{
  if (aimage.width > 0)
  {
    image(aimage, ax, ay, aw, ah);
  }
}

void keyReleased()
{
  if (key == ' ')
  {
    backgroundIndex = backgroundIndex + 1;
  }
}




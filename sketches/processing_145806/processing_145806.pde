
//copyright Yoon-ji Kim 2014
//51-257 A
//HW 10

PImage img;
PFont font;

String text[];
String individualString[];
float x, y;
float dX, dY;
int fontHt;

void setup()
{
  size(600, 300, P3D);
  img = loadImage("installation.jpg");
  frameRate(20);
  
  text = loadStrings("saic.txt");
  for(int i=0; i < text.length; i++)
  {
    individualString = split(text[i], ' ');
    println(individualString);
    println("Array element["+i+"]");
  }
  
  fontHt = 15;
  font = createFont("basictitlefont.ttf", fontHt);
  textFont(font);
  
  x = 10;
  y = 50;
  dX = .5;
  dY = .5;
}

void draw()
{
  prepWindow();
  printString(text);
  moveString();
}

void prepWindow()
{
  image(img, -50, -70);
}

void moveString()
{
  for(int i = 0; i < individualString.length; i++)
  {
    x += dX;
    y += dY;
    if(y > height)
    {
      y = random(0, width-50);
      x = random(0, height-50);
    }
  }
}

void printString(String [] anyArray)
{
  textSize(20);
  for(int i = 0; i < anyArray.length; i++)
  {
    text(anyArray[i], 4*x/5, 4*y/5+i*15);
    fill(71, 206, 124);
  } 
}

void keyPressed()
{
    exit();
}



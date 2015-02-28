
Window[] window = new Window[3];
/*
long timeToWait = 0;
long lastTime;
*/

void setup()
{
  size(600,600,P2D);
  
  noStroke(); // Disable border on shapes
  background(4,0,89); // Set canvas background to dark blue
  
  for (int i=0; i<3; i++)
    window[i] = new Window();
  
  drawStars(600,500);
}

void draw()
{
  drawMoon();
  drawBackground();
}

void drawBackground()
{
  /* Draw grass rectangle and fill green */
  fill(0,145,19);  
  rect(0,500,600,100);
  
  /* Draw house and fill gray */
  fill(69);
  rect(360,400,150,130);
  
  drawWindows(true);
  
  /* Draw door and fill brown */
  fill(122,75,0);
  rect(385,480,30,50);
  fill(0);
  ellipse(410, 505, 4, 4);
  
  /* Draw roof and fill orange */
  fill(227,64,0);
  triangle(435,330,530,400,340,400);
}

/* Draw windows either with lights on or off */
void drawWindows(boolean lights)
{
  window[0].setPos(375,410,50);
  window[0].createWindow(10,10,10);
  
  window[1].setPos(445,410,50);
  window[1].createWindow(10,10,10);
  
  window[2].setPos(455,480,40);
  window[2].createWindow(10,10,10);
  
  if (lights)
  {
    window[0].lights();
    window[1].lights();
    window[2].lights();
  }
}

/* Draw stars randomly over sky */
void drawStars(float maxX, float maxY)
{
  noStroke();
  fill(255,255,0);
  
  for (int i=0; i<15; i++)
  {
    float randomX = random(10,maxX-10), randomY = random(10,maxY-50);
    ellipse(randomX,randomY,5,5);
  }
}

void drawMoon()
{
  fill(227,227,227,90); // Set moon fill with transparency
  ellipse(125,125,125,125); // Draw the moon
}

class Window /* Create a class for type Window */
{
  PShape rectangle;
  float posX;
  float posY;
  float size;
  
  void setPos(float X, float Y, float S)
  {
    posX = X;
    posY = Y; 
    size = S;
  }
  
  /* Create window bg */
  void createWindow(float r, float g, float b)
  {
    rectangle = createShape(RECT,posX, posY, size, size);
    rectangle.setFill(color(r,g,b));
    shape(rectangle);
    createBars();
  }
  
  /* Create black bars across window */
  void createBars()
  {
    strokeWeight(4);
    strokeCap(SQUARE);
    stroke(10,10,10);
    
    line(posX+(size/2),posY,posX+(size/2),posY+size);
    line(posX,posY+(size/2),posX+size,posY+(size/2));
    noStroke();
  }
  
  /*
  Set the lights on!
  */
  void lights()
  {    
    rectangle.setFill(color(255,240,33));
    shape(rectangle);
    createBars();
  }
}


int SIZE = 800;

double a = 1.4, b = 0.3;

float screenTop    = 5;
float screenLeft   = 5;
float screenBottom = SIZE-5;
float screenRight  = SIZE-5;

float henonTop    =  -.4;
float henonLeft   = -1.35;
float henonBottom =   .4;
float henonRight  =  1.3;

float lastHenonTop    = henonTop;
float lastHenonLeft   = henonLeft;
float lastHenonBottom = henonBottom;
float lastHenonRight  = henonRight;

int mouseTop, mouseLeft, mouseBottom, mouseRight;

double x = random(henonLeft, henonRight );
double y = random(henonTop,  henonBottom);
double nextX, nextY;

int looper = 0;

void setup()
{
  size(800,800);
  background(0);
  stroke(255);

  noLoop();
}

void draw()
{   
  for (int i=0; i<pow(10,looper); i++)
  {
    point(map((float)x, henonLeft, henonRight,  screenLeft, screenRight ),
          map((float)y, henonTop,  henonBottom, screenTop,  screenBottom));

    nextX = y + 1 - a*x*x;
    nextY = b * x;

    x = nextX;
    y = nextY;
  }
}

void mousePressed()
{
  cursor(CROSS);
  mouseLeft = mouseX;
  mouseTop = mouseY;
}

void mouseDragged()
{
  // someday show selection rectangle
}

void mouseReleased()
{
  cursor(ARROW);
  mouseRight = mouseX;
  mouseBottom = mouseY;
  
  if (mouseRight==mouseLeft || mouseTop==mouseBottom)
  {
    henonTop    =  -.4;
    henonLeft   = -1.35;
    henonBottom =   .4;
    henonRight  =  1.3;

    x = map(mouseX, screenLeft,screenRight,  henonLeft,henonRight);
    y = map(mouseY, screenTop, screenBottom, henonTop, henonBottom);
  }
  else
  {
    lastHenonTop    = henonTop;
    lastHenonLeft   = henonLeft;
    lastHenonBottom = henonBottom;
    lastHenonRight  = henonRight;

    henonTop    = map(mouseTop,    screenTop,screenBottom, lastHenonTop,lastHenonBottom);
    henonLeft   = map(mouseLeft,   screenLeft,screenRight, lastHenonLeft,lastHenonRight);
    henonBottom = map(mouseBottom, screenTop,screenBottom, lastHenonTop,lastHenonBottom);
    henonRight  = map(mouseRight,  screenLeft,screenRight, lastHenonLeft,lastHenonRight);
  }

  background(0);

}

void keyPressed()
{
  loop();

  switch(key)
  {
    case ' ':
      noLoop();
      redraw();
      break;
  
    case '1':
      looper = 0;
      break;
  
    case '2':
      looper = 1;
      break;
  
    case '3':
      looper = 2;
      break;
  
    case '4':
      looper = 3;
      break;
  
    case '5':
      looper = 4;
      break;
  
    case '6':
      looper = 5;
      break;
      
    case '7':
      looper = 6;
      break;
   }
}













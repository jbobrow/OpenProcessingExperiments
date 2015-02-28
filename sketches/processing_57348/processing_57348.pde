
int x, y;
int w, h;
int countClick;
color currentColor;
color idle;
color mouseOver;
color clicked;
PImage trollface;

boolean buttonClicked;


void setup()
{
  size(400, 400);
  x = 100;
  y = 100;
  w = 200;
  h = 200;

  countClick = 0;
  
  idle         = color(0);
  mouseOver    = color(100);
  clicked      = color(255, 0,0);
  currentColor = idle;
  
  trollface = loadImage("troll.jpg");
  buttonClicked = false;
  
  noStroke();
  
}

void draw()
{
  background(255);
  fill(0);
  text("Click count: "+Integer.toString(countClick), 20, 20);
  
  fill(currentColor);
  rect(x, y, w, h);
  
  if(buttonClicked)
  {
    image(trollface, x,y);
  }
}

void mouseMoved()
{
  if(mouseX > x && mouseX < x+w &&
     mouseY > y && mouseY < y+h)
  {
    currentColor = mouseOver;
  }
  else
  {
    currentColor = idle;
  }
}

void mousePressed()
{
  countClick++;
  if(mouseX > x && mouseX < x+w &&
     mouseY > y && mouseY < y+h)
  {
    buttonClicked = true;
    currentColor = clicked;
  }
  else
  {
    currentColor = idle;
  }
}

void mouseReleased()
{
  currentColor = idle;
  buttonClicked = false;
}


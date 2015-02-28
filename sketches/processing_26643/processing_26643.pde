
//variables

PFont font1;
float r,g,b;
int shape, width, height;


void setup () 
{
  size (800,800);
    background(224, 222, 222);
  font1 = loadFont ("Futura-Medium-48.vlw");
  width = height = 30;
}

void draw () 
{
  instructions();
  smooth ();
  noStroke();
 
}

void instructions()
{
  //if (mouseX < 50 && (mouseY <50))
  //{
  textFont(font1, 25);
  text("Right Mouse: Draw random shapes",0, 75);
  text ("Arrow Keys: Draw from corners of shapes",0,50);
  text("Shift: Clear Page", 0,125);
  //}
}

void mousePressed () 
{
  if (mouseButton == LEFT) 
  {
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    int ct;
    ct = int(random(2));
    shape = int(random(5));

    if(ct == 0)
      fill(r,g,b);
    else
      fill(r,g,b,random(200));

    changeSize();

    if(shape == 0)
      rect(mouseX, mouseY, width, height);   //square
    else if(shape == 1)
      ellipse(mouseX,mouseY, width, height);  //circle
    else if(shape == 2)
      ellipse(mouseX,mouseY, width, height + 10);
    else if(shape == 3)
      rect(mouseX, mouseY, width, height + 10);
    else if(shape == 4)
    {
      triangle(mouseX, mouseY, mouseX-20, height, mouseX+20, height);
    }
  }
}

void changeSize ()
{
  if (mouseY <100) 
  {

    width = height = 10;
  }
  if (mouseY >= 100 && (mouseY <200)) 
  {
    width = height = 20;
  }
  if (mouseY >= 200 && (mouseY <300)) 
  {
    width = height = 30;
  }
  if (mouseY >= 300 && (mouseY <400)) 
  {
    width = height = 40;
  }
  if(mouseY >= 400 && (mouseY <550)) 
  {
    width = height = 50;
  }
}

void keyPressed () 
{
  if (key == CODED) 
  {
    if (keyCode == UP)
    {
      fill(235,206,255);
      triangle (mouseX, mouseY, mouseX+20, mouseY+20, 0, 0);
    }
    if (keyCode == DOWN)
    {
      fill(255,206,249);
      triangle (mouseX, mouseY, mouseX+20, mouseY+20, 800, 800);
  
    }
    if (keyCode == LEFT)
    {
      fill(212,255,206);
      triangle (mouseX, mouseY, mouseX+20, mouseY+20, 0, 800);
    }
    if (keyCode== SHIFT)
    {
      setup();
    }
  }
}



int viewX = 0;
int viewY = 0;
int prog = 60;
int wiz = 60;
int no = 60;
PImage computer,wizard,wolf;
PFont font;
PFont deepest;
//setup :P
void setup()
{
  frameRate(60);
  size(1000, 1000);
  font = loadFont("JingJing-48.vlw");
  deepest = loadFont("Arial-Black-48.vlw");
  computer = loadImage("computer.png");
  wizard = loadImage("wizard.png");
  wolf = loadImage("wolf howl.png");
  
  textFont(font, 30);
}

void draw()
{
  //setup room
  background(135,206,250,20);

  //computer
  stroke(0);
  fill(0);
  //font size
  textFont(font, prog-viewX/20);
  if (prog<0)
  {
    prog=0;
  }
  text("Programmer", (width/2)-240, (height/2-viewX/2)-15);
  image(computer,width/2-viewX/2, height/2-viewX/2, viewX, viewX);

  //programming wizard
  if (viewX>300)
  {
    noStroke();
    fill(100);
    textFont(font, wiz-(viewX-300)/20);
    if (wiz<0)
    {
      wiz=0;
    }
    text("Wizard", (width/2)-120, (height/2-(viewX-300)/2)-15);
    image(wizard,width/2-(viewX-300)/2, height/2-(viewX-300)/2, viewX-300, viewX-300);
  }

  //wolf
  if (viewX>700)
  {
    noStroke();
    fill(255);
    textFont(font, no-(viewX-700)/20);
    if (no<0)
    {
      no=0;
    }
    text("''No Talent''", (width/2)-200, (height/2-(viewX-700)/2)-15);
    image(wolf,width/2-(viewX-700)/2, height/2-(viewX-700)/2, viewX-700, viewX-700);
 
  }
  if(viewX>950)
  {
  textFont(font,viewX-900);
  fill(255,0,0);
 text("Inner Awesome", (width/2)-350,height/2);
  }
  
  //slider square and line
  stroke(255, 0, 0, 60);
  strokeWeight(4);
  noFill();
  rect(viewX, 8, 20, 20);
  line(0, 18, width, 18);

  //slider text
  fill(20, 255, 20, viewX/4);
  textFont(font, 30);
  text("'Wil'", viewX-30, 30);
  if(viewX>980)
  {
  viewX=980;
  }
  print(" "+viewX);
}

void mouseClicked()
{
  //sets the value of viewX
  if (mouseY>viewY&&mouseY<viewY+30)
  {
    viewX=mouseX-8;
  }

  if (viewX<0)
  {
    viewX=0;
  }
}

void mouseDragged()
{
  //sets the value of viewX
  if (mouseY>viewY&&mouseY<viewY+30)
  {
    viewX=mouseX-8;
  }
  if (viewX<0)
  {
    viewX=0;
  }
}



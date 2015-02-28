
//Snow Blowing Up!!!
//Create by Christopher Trinh

/*
Keys - 
 1)click snow to blow up
 2)space bar for effect
 
 when mouse get near the snow it turn yellow.
 when mouse touch the snow it red.
 */

Line [] lines;
final int MAX_LINE = 100;//number of snow
final int LINE_LEN = 10;
int lineLeft = MAX_LINE;
int lineGone = MAX_LINE;

Text texts;
PFont myFont;
final int MAX_INDEX = 6;//number of string of text
int count = 0;

Drawing drawing;
Star [] star;
final int MAX_STAR = 100;//number of star

ArrayList explodes;//make more then one explodes in one draw
final int MAX_EXPLODE = MAX_LINE;
float angle;

final int MOUSE_LEN = 10;//how big the crosshair

boolean trace = false;

int preX = 200;
int preY = 200;

Time time; 
int lenLine = 0;

int crossColor;
float d;

float minDist;
float amount;

void setup()
{
  size(400, 400);
  smooth();
  background(0);
  noCursor(); 
  mouseY = 200;//center the mouse
  mouseX = 200;
  myFont = createFont("Arial", 16, true);

  drawing = new Drawing(200, 200, color(128));
  star = new Star [MAX_STAR];

  for(int i = 0; i < MAX_STAR; i++)
  {
    star [i] = new Star(random(0, width), random(0, height - 100), random(1,2), randomColor());
  }

  time = new Time(int(random(1000, 3000)));//speed the snow come out, 1000 = 1second

  lines = new Line[MAX_LINE];
  for(int i = 0; i < MAX_LINE; i++)
  {
    lines[i] = new Line(randomX(), randomY(), LINE_LEN, randomStarColor());
  }

  texts = new Text(width, 500, myFont, color(255), color(0), randomIndex());

  explodes = new ArrayList();
  explodes.add(new Explode(300, 300, 200, 200, color(randomColor(), randomColor(), randomColor()))); 
}

int randomStarColor()
{
  int result = int(random(128,255));// for light grey to white
  return result;
}

int randomIndex()
{
  int result = int(random(0, MAX_INDEX));//random string of text
  return result;
}

int randomColor()
{
  int result = int(random(128, 255));
  return result;
}

int randomY()
{
  int result = int(random(0, height - LINE_LEN));
  return result;
}

int randomX()
{
  int result = int(random(0, width - LINE_LEN));
  return result;
}

void draw()
{
  if( !trace ) {
    background(0);
  }
  else {
    noStroke();
    fill(0, 20);
    rect(0, 0, width, height);
  }

  for(int i = 0; i < MAX_STAR; i++)
  {
    star[i].display();
  }
  count();
  drawing.display();

  if (time.startOver()) 
  {
    lines[lenLine] = new Line(randomX(), randomY(), LINE_LEN, randomStarColor());

    lenLine = lenLine + 1;

    if (lenLine == MAX_LINE)// to clear and startover
    {
      noStroke();
      fill(0, 20);
      rect(0, 0, width, height);
      lineLeft = MAX_LINE;
      lineGone = MAX_LINE;
      count = 0;
    } 

    if (lenLine >= MAX_LINE) 
    {
      lenLine = 0;
    }
    time.start();// startover
  }

  minDist = 800; // everyone is less than this.

  for(int i = 0; i < lenLine; i++)
  {
    amount = lines[i].distanceFromCursor();//distance between star
    if (amount < minDist)
    {
      minDist = amount;
    }

    if(lines[i].hit(mouseX, mouseY) && mousePressed)
    {
      lines[i].pop();
      lineLeft = lineGone - 1;
    }
    else
    {
      lines[i].display();
      lines[i].move();
    }
  }

  noStroke();
  texts.display();

  for(int i = explodes.size()-1; i >= 0; i--)
  {
    Explode explode = (Explode) explodes.get(i);

    explode.display();

    if(explode.finished())
    {
      explodes.remove(i);
    }
  }

  //effect when you click on snow and text
  if(lineLeft != lineGone && lineLeft < lineGone && mousePressed)
  {
    preX = mouseX;
    preY = mouseY;
    explodes.add(new Explode(0, 0, preX, preY, color(randomColor(), randomColor(), randomColor())));
    texts = new Text(width, 65, myFont, color(randomColor(), randomColor(), randomColor()), color(0), randomIndex());
    lineGone = lineGone - 1;
    count = count + 1;
  }

  crossHair(crossColor);

  if (minDist < 20)
  {
    crossColor = color(255, 0, 0);//red
  }
  else if (minDist < 50)
  {
    crossColor = color(255, 255, 0);//yellow
  }
  else
  {
    crossColor = color(255);//white
  }

}

void crossHair(color c)//your mouse
{ 
  noFill();
  stroke(c);
  ellipse(mouseX, mouseY, 2 * MOUSE_LEN, 2 * MOUSE_LEN);
  line(mouseX, mouseY + MOUSE_LEN, mouseX, mouseY - MOUSE_LEN);
  line(mouseX + MOUSE_LEN, mouseY, mouseX - MOUSE_LEN, mouseY);
}

void count()// keep count of how many you pop
{
  fill(255);
  textFont(myFont);
  if(count < 10)
  {
    text("Shot Hit: 0" + count, 300, 380);
  }
  else
  {
    text("Shot Hit: " + count, 300, 380); 
  }  
}

void keyPressed() 
{
  if( key == ' ' ) {
    trace = !trace;
  }
}




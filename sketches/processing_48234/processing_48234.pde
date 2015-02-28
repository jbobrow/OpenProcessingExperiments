
PImage s;
PImage h;
PImage b;
PFont font1;
PFont font2;

float xpos;

void setup()
{
  size(800, 800);
  smooth();
  colorMode(HSB);
  
  font1 = loadFont("OCRAStd-12.vlw");
  font2 = loadFont("OCRAStd-8.vlw");
  
  s = loadImage("usps_logo.png");
  h = loadImage("human_icon.png");
  b = loadImage("bargraph.png");
 
}


void draw()
{ 
  background(150,220,200);
  
  image(s, 77, -170);
  
  fill(255);
  noStroke();
  rect(97, 205, 612, 212);
  image(b, 97, 205);
  
  float cx = constrain(mouseX, 97, 700);
  xpos = map(cx, 97, 490, 160, 485);
  
  image(h, 97, 490);
  image(h, xpos, 490);
  
  textFont (font1);
  text("1.personal  2.business  3.transactions", 97, 185);
  text("let's make a change. stay in touch.", 250, 730);
  
  textFont (font2);
  text("2000", 110, 440);
  text("2001", 167, 440);
  text("2002", 220, 440);
  text("2003", 277, 440);
  text("2004", 335, 440);
  text("2005", 390, 440);
  text("2006", 445, 440);
  text("2007", 500, 440);
  text("2008", 557, 440);
  text("2009", 612, 440);
  text("2010", 667, 440);
  text("based on The Household Diary Study of USPS", 280, 760);
  
}

void keyPressed()
{
  if (key == '1')
  {
    b = loadImage("bargraph.png");
  }
    if (key == '2')
    {
       b = loadImage("bargraph2.png");
    }
    if (key == '3')
    {
       b = loadImage("bargraph3.png");
    }
}


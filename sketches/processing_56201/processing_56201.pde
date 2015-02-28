
int h;
int m;
int l;
boolean t = boolean(hour());

void setup()
{
  size(600, 600);
  colorMode(HSB);
}

void draw()
{
  background(255);
  fill(255, 0, 170);
  strokeWeight(1);
  stroke(255);


  if (t)
  {
    rect(0, 0, hour()*25, 10*minute());
  } 
  else
  {
    rect(0, 0, width, 10*minute());
  }

  for (int h = 0; h <= width; h = h + 25)
  {
    strokeWeight(1);
    stroke(255);
    line(h, 0, h, height);
  }

  strokeWeight(1);
  stroke(0, 0, 0, 0);
  fill(128, 255, 255, 84);
  rectMode(CORNERS);
  rect(width/2+1, 0, width, day()*10);
  rectMode(CORNER);

  for (int m = 0; m <= height; m = m + 10)
  {
    strokeWeight(1);
    stroke(255);
    line(0, m, width, m);
  }

  for (int l = 0; l <= height; l = l + 50)
  {
    strokeWeight(2);
    stroke(0);
    line(0, l, width, l);
  }

  stroke(128, 255, 255);
  strokeWeight(2);
  line(width/2, 0, width/2, height);

  stroke(255, 255, 255);
  strokeWeight(2);
  line(0, height/2, width, height/2);

  strokeWeight(1);
  stroke(0, 0, 0, 0);
  fill(255, 255, 255, 84);
  rect(0, month()*50, width/2-1, -49);

  fill(255, 0, 0, 162);
  strokeWeight(1);
  stroke(0, 0, 0, 0);


  if (t)
  {
    rect(hour()*25, 10*second(), -24, -9);
  } 
  else
  {
    rect(width, 10*second(), -24, -9);
  }

  PFont HelveticaBold;
  HelveticaBold = loadFont("Helvetica-Bold-48.vlw");
  textFont(HelveticaBold, 164);
  fill(255, 0, 240, 200);
  text(year(), width/2-185, height/2+58);
}



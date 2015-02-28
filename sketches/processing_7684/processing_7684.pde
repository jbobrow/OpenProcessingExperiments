
/** 
 * A slightly more complex clock
 * using recursive box drawing.
 *
 * By Evan Raskob
 * http://openlabworkshops.org
 *
 */


float DegreesPerMillisecond = 360.0/1000.0;
float DegreesPerTick = 360.0/60.0;

int itemsPerRow = 60;
int itemWidth;
int itemHeight;

void drawRow(int items)
{
  if (items > 0)
  {
    fill(255.0 * (items % 10) / 10.0);
    rect(0,0,itemWidth,itemHeight);
    translate(itemWidth,0);
    drawRow(items - 1);
  }
}


void setup()
{
  size(800,300);
  itemWidth = width/itemsPerRow;
  itemHeight = height/3;
  rectMode(CORNER);
}

void draw()
{
  background(120);
  stroke(220);
  // time!
  int ms = int(60.0 * (millis() % 1000) / 1000.0);
  
  smooth();
  
  fill(255);

  // draw milliseconds
  pushMatrix();
  drawRow(ms);
  popMatrix();

  pushMatrix();

  // draw seconds
  translate(0,itemHeight);
  
  pushMatrix();
  drawRow(second());
  popMatrix();
  
  // draw minutes
  translate(0,itemHeight);
  
  pushMatrix();
  drawRow(minute());
  popMatrix();

  popMatrix();

}


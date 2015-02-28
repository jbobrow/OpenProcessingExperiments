
//Sarah C, CP1 16/17, Animations

int water = 255;
int change = 10;
int x = 398;
int y = 146;
int cloudX = 1;
int cloudSize = 1;
int cloudChange = 1;

void setup()
{
  size(400, 400);
}  

void draw()
{
  background(160, 237, 232);
  penguin(); 
  water();
 // iceberg();  
  clouds();
}

void iceberg()
{
  stroke(212);
  strokeWeight(2);
  fill(255);
  beginShape();
  vertex(220, 400);
  vertex(240, 150);
  vertex(400, 150);
  vertex(400, 400);
  endShape(CLOSE);
}

void water()
{
  //frameRate(30);
  noStroke();
  fill(60, 170, water);
  rect(0, 360, 400, 400);
  water = water + change;
  if ( water > 255)
  {
    change = change - 10;
  }

  if (water < 130)
  {
    change = change + 25;
  }
}

void penguin()
{
  noStroke();
  fill(0);
  ellipse(x, y, 10, 14);
  fill(245, 189, 47);
  ellipse(x - 6,y - 4, 4, 4);
  ellipse(x - 2, y + 6, 5, 3);
  fill(255);
  ellipse(x, y - 4, 3, 3);
  if (x > 0)
  {
    x = x - 1;
  }
  if (x <= 240)
  {
    y = y + 2;
  }      
  if (y > 400)
  {
    x = 398;
    y = 146;
  }
}

void clouds()
{
  noStroke();
  fill(255);
  ellipse(cloudX,50,40 + cloudSize,20 + cloudSize);
  cloudX = cloudX + 1;
  cloudSize = cloudSize + cloudChange;
  
  if (cloudSize > 19)
  {
    cloudChange = -1;
  }
  
  if (cloudSize < 1)
  {
    cloudChange = 1;
  }
}



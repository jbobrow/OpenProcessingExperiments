
color bgcolor = #000000;
int direction = 1;

void setup()
{
  size(600, 600);
  bgcolor = rcolor();
  background(bgcolor);
  smooth();
  strokeWeight(3);
}

void draw()
{
  if (random(1000) < 5)
  {
    bgcolor=rcolor();
    background(bgcolor);
    direction = int(random(2));
  }
  
    
  for (int i = 0; i < 5; i++)
  {
    pushMatrix();
    translate(width/2, height/2);
    float y = height/3 - random(height/1.5);
    float x = width/3 - random(width/1.5);
    translate(x, y);
    rotate(radians(random(360)));
    stroke(0,0,0);
    fill(rcolor());
    float r = random(height/8);
    if (random(5) < 3)
      ellipse(0,0,r,r);
    else
      rect(0, 0, r, r);
    popMatrix();
  }
  noStroke();
  fill(bgcolor, 15);
  rect(0,0, width, height);
  if (direction == 0)
  {
    copy(15, 15, width-30, height-30, 0, 0, width, height);
  }
  else 
 { 
    copy(0, 0, width, height,15, 15, width-30, height-30);
    fill(bgcolor);
    rect(0,0,width,15);
    rect(0,height-15, width, height);
    rect(0,0,15,height);
    rect(width-15,0, width, height);
 }
}

void keyPressed()
{
  direction =  direction == 0 ? 1 : 0;
  background(bgcolor);
}

color rcolor()
{
  return color(random(256), random(256), random(256));
}


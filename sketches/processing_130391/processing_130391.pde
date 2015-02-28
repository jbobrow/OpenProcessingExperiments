
//copyright Yoon-ji Kim 2014
//51-257 A, HW#4
//ellipses move with the mouse
//pressing any key will make the bg white
//clicking will draw a white ellipse
//mouseWheel will change the bg color

float x, y;
float wd, ht;
float xDist, yDist;
float easingCoef;

void setup()
{
  size(400, 400);
  background(0);
  noStroke();
  easingCoef = .1;
}

void draw()
{
  x = x+xDist*easingCoef;
  y = y+yDist*easingCoef;
  wd = random(40, 150);
  ht = random(40, 150); 
  xDist = mouseX-x;
  yDist = mouseY-y;
  
  //circles move with mouse
  ellipseMode(CORNER);
  fill(116, random(230), random(255), 10);
  ellipse(x, y, wd+xDist, ht+yDist);
  ellipseMode(CENTER);
  fill(111, 251, 255, 20);
  ellipse(x, y, 1.5*xDist, 1.5*yDist);
}

//press any key to change the background color to white
void keyPressed()
{
    background(255);
}

//clicking will draw a white ellipse
void mousePressed()
{
  fill(255);
  ellipse(mouseX, mouseY, 2*xDist, 2*yDist);
}

//mouseWheel to change background color
void mouseWheel()
{
  background(random(255), random(255), random(255));
}



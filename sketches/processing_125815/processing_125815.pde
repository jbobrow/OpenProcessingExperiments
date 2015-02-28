

float x;
float y;
float xrandom;
float yrandom;

void setup()
{
size(1000,1000);
}


void draw()
{
  x = mouseX;
  y = mouseY;
  xrandom = random(1000);
  yrandom = random(1000);
  fill(random(100),random(100),random(100),x);
  while (xrandom>375 && xrandom<575)
  {
    xrandom = random(1000);
  }
  while (yrandom>375 && yrandom<575)
  {
    yrandom = random(1000);
  }
  rect(xrandom,yrandom,random(70),random(70));
  me();
  
  
}

void mouseClicked()
{
  if (mouseButton == LEFT)
  {background(156,79,200);
  }
  
  if (mouseButton == RIGHT)
  {fill(random(255),random(600),random(255));
    ellipse(500,500,random(255),random(255));
    ellipse(175,500,random(100),random(100));
    ellipse(500,175,random(100),random(100));
    ellipse(825,500,random(100),random(100));
    ellipse(500,825,random(100),random(100));
    
}
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      background(255);
    } else if (keyCode == LEFT) {
      background(0);
    } 
 }
}

void me()
{
  ellipse(50,500,25,25);
  ellipse(500,50,25,25);
  ellipse(500,950,25,25);
  ellipse(950,500,25,25);
}

  



int balance = 255;
int time = 0;
int rectSize = 12;


void setup()
{
  size(700,700);
  colorMode(HSB,255);
  background(255);
  frameRate(60);
}

void draw()
{
  if (time > 0)
  {
    time -= 1;
  }
  background(255);
  for (int i = 0; i < width; i += rectSize)
  {
    for (int j = 0; j < height; j += rectSize)
    {
      color c1 = color(255.0*i/width,255.0*j/height,balance);
      fill(c1);
      stroke(c1);
      rect(i,j,rectSize,rectSize);
    }
  }
  if (balance > 124)
  {
    fill(0,255,0);
  }
  else
  {
    fill(0,0,255);
  }
  if (time > 0)
  {
    text("balance " + str(round(balance/2.55)) + "%",width/2,30);
  }
  String mouseover = "h=" + str(round(100.0*mouseX/width)) + "% s=" + str(round(100.0*mouseY/height)) + "%";
  int position;
  if (mouseX > width - 70)
  {
    position = mouseX - 70;
  }
  else
  {
    position = mouseX;
  }
  
  text(mouseover,position,mouseY);
}

void keyPressed()
{
  if (keyCode == UP) 
  {
    balance += 10;
    if (balance > 255)
    {
      balance = 255;
    }
    
  }
  else if (keyCode == DOWN)     
  {
    balance -= 10;
    if (balance < 0)
    {
      balance = 0;
    }
  }
  else if (keyCode == LEFT)
  {
    rectSize -= 1;
  }
  else if (keyCode == RIGHT)
  {
    rectSize += 1;
  }
  
  time = 60;
}


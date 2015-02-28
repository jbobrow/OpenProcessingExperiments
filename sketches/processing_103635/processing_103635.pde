
float xPos = 0;
float yPos = 0;
int randR, randG, randB;

void setup()
{
  size(800, 800);
  background(255);
}

void draw()
{
  xPos = mouseX;
  yPos = mouseY;
  if(mousePressed) {
    fill(randR, randG, randB);
    noStroke();
    ellipse(xPos, yPos, 50, 50);
  }
  
}

void mouseClicked()
{
  randR = (int)random(255);
  randG = (int)random(255);
  randB = (int)random(255);
}

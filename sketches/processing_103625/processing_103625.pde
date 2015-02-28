
float xPos = 0;
float yPos = 0;
float phatness, randR, randG, randB;

void setup()
{
  size(200, 200);
  background(0);
  noStroke();
}

void draw()
{
  //background(0);
  if (keyPressed && key == 's')
  {
  }
  if(mousePressed) {
    fill(randR, randG, randB);
    ellipse(mouseX, mouseY, phatness, phatness);
  }
}

void mouseClicked()
{
  randR = random(255);
  randG = random(255);
  randB = random(255);
  phatness = random(100);
}

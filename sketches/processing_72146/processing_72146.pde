
float randomPi = 0;
int randomColor = 0;
float randomX = 0;
float a = 0.0;
float inc = TWO_PI/25.0;
boolean booGrow = false;

void setup()
{
  size(1200, 600);
  background(0);
}

void draw()
{
  smooth();
  randomColor = int(random(0, 255));
  randomPi = random(7);
  randomX = random(1200);
  if (booGrow == true)
  {
    stroke(255,255,0);
    strokeWeight(0.0001);
    for (int i = 0; i<100;i++)
    {
      noFill();
      bezier(i*6,i*9,randomX,randomX/2,randomX/i,i*6,mouseX,mouseY);
      a=a+inc;
    }
  }
  else
  {
    for (int i = 0; i<100; i++)
    {
      smooth();
      strokeWeight(0.1);
      stroke(randomColor, 0, randomColor);
      line(mouseX, mouseY, randomX, (i*6));
      fill(randomColor,0,randomColor);
      ellipse(mouseX,mouseY,randomPi*10,randomPi*10);
    }
  }
}

void mouseClicked()
{
  booGrow = !booGrow;
}

void keyPressed()
{
  if (key == 's')
  {
    save("eugeneJahng.png");
  }
}

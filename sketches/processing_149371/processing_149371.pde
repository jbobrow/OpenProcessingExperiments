
float textX;
float textY;
float siz;

void setup()
{
  size(800, 700);
  background(0);
  frameRate(15);
  textX = 400;
  textY = height;
  siz = 100;
}

void draw()
{
  background(0);

  for (int i = 0; i < 33; i++)
  {
    fill(255);
    ellipse(random(width), random(height), 3, 3);
    fill(255, 255, 0);
    ellipse(random(width), random(height), 3, 3);
  }



  textAlign(CENTER);
  textSize((height/siz)*10);
  fill((255), (255), 0);
  text("STAR WARS", textX, textY);
  fill(255, 0, 0);
  text("Revenge of the Sith", textX, textY+40);
  fill(255, 255, 0);
  text("A long, long time ago", textX, textY+80);
  text(" in a galaxy far far away.", textX, textY+120);

  textY = textY-6;
  siz++;

  if (textY<0)
  {
    textY=height;
    siz=100;
  }
}



void setup()
{
  noStroke();
  size(400, 600);
  background(0, 0, 0);
  fill(255, 255, 255);
  ellipse(width/2, 500, 200, 200);

  ellipse(width/2, 350, 150, 150);

  ellipse(width/2, 240, 100, 100);

  fill(102, 51, 0);
  rect(135, 170, 130, 30);

  fill(102, 52, 0);
  rect(165, 110, 70, 70);
}

void draw()
{
  fill(255, 255, 255, random(120));
  noStroke();
  ellipse(random(400), random(600), 5, 5);
  
}

void mousePressed()
{
  fill(random(255), random(255), random(255));
  ellipse(mouseX, mouseY, 20,20);
}

//Meg Noordewier

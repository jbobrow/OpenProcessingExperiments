
void setup()
{
  size(600,300);
}

void draw()
{
}

void keyPressed()
{
  color c;
  
  fill(255);
  rect(0,0, 600,150);
  fill(0);
  rect(0,150, 600,150);
  
  fill(random(200)+55, random(64), random(64));
  triangle(0,0, 100, 150, 200,0);
  fill(random(200)+55, random(64), random(64));
  triangle(0,300, 100,150, 200,300);
  
  fill(random(64), random(200)+50, random(64));
  ellipse(300, 75, 100, 100);
  fill(random(64), random(200)+50, random(64));
  ellipse(300, 225, 100, 100);
  
  fill(random(64), random(64), random(200)+50);
  rect(450, 50, 100, 100);
  fill(random(64), random(64), random(200)+50);
  rect(450, 150, 100, 100);
  save("Test.png");
}


boolean clicked = false;

void setup()
{

  size(500,500);

  background(130, 130, 130);

  frameRate(10000);

  noStroke();

}



void draw()
{
  int dx = 10;

  fill(random(56,255),random(245,255),random(165,255));

  if (clicked == true)
  {

triangle(mouseX+random(dx),mouseY+random(dx),mouseX+random(dx),mouseY+random(dx),mouseX+random(dx),mouseY+random(dx));

  }

}

void mousePressed()
{
  if (clicked == true)
  {
    clicked = false;
  } else {
    clicked = true;
  }
}

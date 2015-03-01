
void setup()
{ 
  size (500, 500);
}

void draw()
{
  background(255);
  translate(250, 250);
  rectMode(CENTER);

  for (int i=0; i<360; i+=30)

  {
    pushMatrix();
    noFill();
    stroke(random(0), random(0) ,random(255));
    rotate(radians(i));
    ellipse(100+ random(mouseX), 0, 100, 100);
    popMatrix();
    
    pushMatrix();
    noFill();
    stroke(random(0), random(0) ,random(255),80);
    rotate(radians(i));
    ellipse(120+ random(mouseX), 0, 100, 100);
    popMatrix();
  }
}


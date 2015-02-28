
void setup()
{
  size(600, 600);
}


void draw()
{
  background(240);

  if (mouseX > 200 && mouseX < 400 && mouseY > 200 && mouseY < 400)
  {
    noStroke();
    fill(10, 80, 180);
    rectMode(CENTER);
    rect(width/2, height/2, 200, 200);
  } 
  else
  {
    noStroke();
    fill(255, 90, 60);
    rectMode(CENTER);
    rect(width/2, height/2, 200, 200);
  }
}




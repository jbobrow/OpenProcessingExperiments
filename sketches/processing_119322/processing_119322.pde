
void setup()
{
  size (500, 500);
  background(255);
}

void draw()
{
  background(255);
  fill(0);
  noStroke();
  rect(115, 100, 20, 70);
  rect(115, 215, 20, 70);
  rect(115, 330 , 20, 70);
  rect(240, 100, 20, 70);
  rect(240, 330, 20, 70);
  rect(365, 100, 20, 70);
  rect(365, 215, 20, 70);
  rect(365, 330, 20, 70);
  
float winkel = map(mouseY, 0, 5000, 0, 1.5*PI);
  
  fill(190, 0, 30);
  translate(240, 215);
  rotate(winkel);
  //rectMode(CENTER);
  rect(0, 0, 20, 70);
  
}

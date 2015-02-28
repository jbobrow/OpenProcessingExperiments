
void setup()
{
  size(400, 600);
  background(200,255 , 0);
  stroke(10);
  smooth();
  
}

void draw()
{
  frameRate(10);
  fill(255, 255, 255, 45);
  rect(0,0,width,height);
  fill(0,0,0);
  rect(mouseX, mouseY, 125, 125);
}


void mousePressed()
{
  fill (random(0), random(255), random(255), 45);
}
void keyPressed()
{
  save("snapshot.jpg");
}



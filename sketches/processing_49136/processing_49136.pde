
void setup()
{
  size(1000,900);
  background(240,73,156);
  smooth();
  strokeWeight(5);
  //frameRate(20);
}

void draw()
{
  fill(random(200),random(155),random(200));
  line(mouseX,mouseY,mouseX,mouseY);
  ellipse(mouseX,mouseY,200,200);
} 
void keyPressed()
{
  save ("snapshot.jpg");
}


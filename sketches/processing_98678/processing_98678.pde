
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

  fill(0, 0, 0);
  textAlign(CENTER);
  text("Click on screen to see that pixel's column and row.",  width/2, height/2);
}

void draw()
{
  
}

void mousePressed()
{
  background(255, 255, 255);
  strokeWeight(1);
  stroke(200, 200, 200);
  line(mouseX, 0, mouseX, mouseY);
  line(0, mouseY, mouseX, mouseY);
  text(mouseX + "," + mouseY, mouseX, mouseY-5);
  stroke(255, 0, 0);
  strokeWeight(3);
  point(mouseX, mouseY);

}

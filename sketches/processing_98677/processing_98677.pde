
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

  fill(0, 0, 0);
  textAlign(CENTER);
  text("Click your mouse on the screen to see that pixel's column and row. \n Press any key to clear screen and start over.",  width/2, height/2);
}

void draw()
{
  
}

void mousePressed()
{
  text(mouseX + "," + mouseY, mouseX, mouseY-5);
  stroke(255, 0, 0);
  strokeWeight(3);
  point(mouseX, mouseY);

}

void keyPressed()
{
  background(255, 255, 255);
}

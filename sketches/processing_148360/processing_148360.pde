
void setup()
{
  size(400, 600);
  background(0, 0, 0);

}

void draw()
{
  stroke(255, 0, 0);
  line(0, 0, mouseX, mouseY);
  fill(0,0,255);
  rect(mouseX,mouseY,50,100);
  quad(75, 50, 175, 150, 175, 50, 75, 150);
  textSize(46);
  text("Awesome!", 200, 200);
  smooth(36);

}

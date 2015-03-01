
int barWidth = 20;
int lastBar = -1;

void setup()
{
  size(1000,1000);

  background(23,210,255);

}

void draw()
{
  fill(222,199,157);
  if (mousePressed) {
    int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(mouseY, height, height);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
    noStroke();
  }
  rotate ( random(0,100) );
  triangle(mouseX-10,mouseY+50,mouseX,mouseY,mouseX+10,mouseY+50);
  triangle(mouseX-10,mouseY+50,mouseX,mouseY,mouseX,mouseY+50);
 
  }
}

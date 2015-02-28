
/*
ZanDraw 1.0
By Zander Franks
*/
color CurrentColor = color(255, 0, 0);
float weight;
void setup()
{
  size(displayWidth / 2, displayHeight / 2);
  smooth();
  background(255);
  textSize(18);
}

void draw()
{
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  rect(10, 10, 100, 75);
  fill(0, 255, 0);
  rect(10, 95, 100, 75);
  fill(0, 0, 255);
  rect(10, 180, 100, 75);
  fill(CurrentColor);
  noStroke();
  rect(width / 2 - 5, 10, 10, 10);
  fill(0);
  text("Press a key to clear", width / 4.6, 15);
  text("ZanDraw 1.0", width / 2 + 210, 15);
  if(mousePressed == true)
  {
    if((mouseX >= 10 && mouseY >= 10)  && (mouseX <= 110 && mouseY <= 85))
    {
      CurrentColor = color(255, 0, 0);
    } else if((mouseX >= 10 && mouseY >= 95) && (mouseX <= 110 && mouseY <= 165)) {
      CurrentColor = color(0, 255, 0);
    } else if((mouseX >= 10 && mouseY >= 180) && (mouseX <= 110 && mouseY <= 245)) {
      CurrentColor = color(0, 0, 255);
    } else {
      stroke(CurrentColor);
      weight = dist(mouseX, mouseY, pmouseX, pmouseY);
      strokeWeight(weight);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

void Clear()
{
  background(255);
}

void keyPressed()
{
  Clear();
}



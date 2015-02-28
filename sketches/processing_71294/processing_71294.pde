
//Philip H CP1 14/15
//gameDuGame
void setup()
{
  size(500, 500);
}
void draw()
{
  background(62, 175, 57);
  person();
  ellipse(mouseX-30, mouseY-50, 40, 40);
  ellipse(mouseX+30, mouseY-50, 40, 40);
  rect(mouseX-27, mouseY-50, 50, 100);
  ellipse(mouseX-30, mouseY+50, 40, 40);
  ellipse(mouseX+30, mouseY+50, 40, 40);
}

void person()
{
  int x = 0;
  if (keyCode==UP)
  {
    stroke(255);
    triangle(240, 230, 260, 230, 250, 280);
    stroke(11, 73, 152);
    line(250, 230, 250, 220);
  }

else if (keyCode==DOWN)
{
  stroke(255);
  triangle(240, 270, 260, 270, 250, 220);
  stroke(11, 73, 152);
  line(250, 270, 250, 290);
  stroke(45);
}
else if (keyCode==LEFT)
{
  stroke(255);
  triangle(230, 240, 230, 260, 280, 250);
  stroke(11, 73, 152);
  line(230, 250, 210, 250);
}
else if (keyCode==RIGHT)
{
  stroke(255);
  triangle(270, 240, 270, 260, 220, 250);
  stroke(11, 73, 152);
  line(270, 250, 290, 250);
}
else
{
  stroke(255);
  triangle(240+x, 230+x, 260+x, 230+x, 250+x, 280+x);
  x=x+int(random(-2, 2));
}
//stop
}


/*
 Calvin Truong
 Click on any spot of the canvas to create something out of what 
 you have! You will randomly get a circle, triangle, or square of
 different shapes and sizes when clicked. There is a rare chance
 of a colorful character that will pop up when you click.
 After you've placed a lot of shapes (and hopefully the suprise
 figure) around the canvas, you will have a beautiful piece of art.
 GIVE ME AN A++++!!1!!11!!1!!1
 
*/



float dice;



void mouseClicked()
{

  if (dice < 1.000001 && dice > 0.1)
  {
    fill (random(0, 255), random(0, 255), random(0, 255));
    ellipse (mouseX, mouseY, random(15, 75), random(15, 75));
  }
  else if (dice < 2.000001 && dice > 1.000001)
  {
    fill (random(0, 255), random(0, 255), random(0, 255));
    triangle (mouseX-random(15, 75), mouseY+random(15, 75), mouseX+random(15, 75), mouseY+random(15, 75), mouseX, mouseY+random(15, 75));
  }

  else if (dice < 0.1)
  {
    robotHead();
    robotBody();
    robotFace();
  }
  else
  {
    fill (random(0, 255), random(0, 255), random(0, 255));
    rect (mouseX-25, mouseY-25, random(15, 75), random(15, 75));
  }
}











void setup()
{
  size(640, 480);
  background (255);
  smooth();
  noStroke();
}


void draw()
{

  dice = random(0, 3);
}








void robotHead()
{
  fill(0, 197, 255);
  triangle (mouseX+50, mouseY-30, mouseX, mouseY-30, mouseX+7.5, mouseY+10);
  triangle (mouseX-50, mouseY-30, mouseX, mouseY-30, mouseX-7.5, mouseY+10);
  fill(183, 0, 131);
  ellipse (mouseX, mouseY-10, 50, 50);
}

void robotBody()
{
  fill(255, 0, 0);
  rect(mouseX-50, mouseY+25, 45, 20);
  rect(mouseX+8, mouseY+25, 45, 20);
  fill(30, 232, 16);
  rect(mouseX-20, mouseY+100, 15, 50);
  rect(mouseX+6, mouseY+100, 15, 50);
  fill(255, 255, 8);
  rect(mouseX-22, mouseY+15, 45, 100);
}

void robotFace()
{
  fill(0);
  ellipse(mouseX-10, mouseY-10, 10, 10); 
  ellipse(mouseX+10, mouseY-10, 10, 10);
  arc(mouseX, mouseY, 20, 20, radians(0), radians(180));
}



























































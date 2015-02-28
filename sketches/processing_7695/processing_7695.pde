


void setup ()
{
  size (500,500);
  background (190,214,216);
  smooth();
}

void draw ()
{
  background (190,214,216);
  if (keyPressed)
  {
    if (key == 'a')
    {
      for (int r = 0; r < 500; r = r + 10)
      {
        stroke (r, mouseX, mouseY);
        fill (r, mouseX, mouseY);
        rect (r, 5, 500, 500);
      }
    }  
  }  
  if (keyPressed)
  {
    if (key == 'h')
    {
      fill (59,21,2);
      ellipse (width*.5,320,width*.8,height*.8);
    }
  }
  stroke (0);
  fill (255,30,18);
  rect (150,460,200,39);
  fill(240,233,186);
  rect (230,430,50,30);
  ellipse (width*.5,320,width*.5,height*.5);
  triangle (224,356,212,369,229,369);
  fill(191,204,240);
  ellipse (width*.35,345,30, 20);
  ellipse (width*.55,345,30,20);
  fill (0);
  ellipse (width*.35,345,8,8);
  ellipse (width*.55,345,8,8);
  fill(242,242,242);
  ellipse (width*.58,318,2,2);
  ellipse (width*.58,326,2,2);
  fill (0);
  strokeWeight(2);
  line (160, 322, 195, 319);
  line (260, 319, 295, 322);
  strokeWeight(1);
  println (mouseX);
  println (mouseY);
  if (keyPressed)
  {
    if (key == 'a')
    {
      fill (232,152,168);
      ellipse (width*.5,400,mouseX/5,mouseY/5);
    }
  }
}




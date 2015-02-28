
//George Sanders
//Final Project DAILY ACTIVITIES CALENDAR
//May 17 2010
//CMSC 117 Keith Ohara

void setup()
{
  size(750, 500);
  smooth();
  strokeWeight(1);
  textAlign (CENTER);
  textFont (loadFont ("HelveticaCYOblique-48.vlw"));
  textSize (18);
}

void draw()
{
  background (255);
//rectangles-days

  fill (64, 224, 224);
  rect (0, 0, 107, 250);
  fill (64, 128, 160);
  rect (107, 0, 107, 250);
  fill (64, 160, 128);
  rect (214, 0, 107, 250);
  fill (96, 126, 192);
  rect (321, 0, 107, 250);
  fill (64, 192, 160);
  rect (428, 0, 107, 250);
  fill (96, 224, 224);
  rect (535, 0, 107, 250);
  fill (64, 192, 288);
  rect (642, 0, 107, 250);
  fill (64, 224, 192);
  rect (0, 250, 107, 500);
  fill (96, 192, 192);
  rect (107, 250, 107, 250);
  fill (64, 192, 160);
  rect (214, 250, 107, 250);
  fill (64, 256, 192);
  rect (321, 250, 107, 250);
  fill (96, 160, 224);
  rect (428, 250, 107, 250);
  fill (96, 128, 256);
  rect (535, 250, 107, 250);
  fill (96, 192, 256);
  rect (642, 250, 107, 250);

//interaction 
  if(mousePressed)
  {
    if (mouseX > 0 && mouseX < 107 && mouseY > 0 && mouseY < 250)
    {
      fill (0);
      text ("64, 224, 224", 107/2, 210);
    }
    if (mouseX > 107 && mouseX < 214 && mouseY > 0 && mouseY < 250)
    {
      fill (0);
      text ("64, 128, 160", 160, 210);
    }
    if (mouseX > 214 && mouseX < 321 && mouseY > 0 && mouseY < 250)
    {
      fill (0);
      text ("64, 160, 128", 265, 210);
    }
    if (mouseX > 321 && mouseX < 428 && mouseY > 0 && mouseY < 250)
    {
      fill (0);
      text ("96, 126, 192", 370, 210);
    }
    if (mouseX > 428 && mouseX < 535 && mouseY > 0 && mouseY < 250)
    {
      fill (0);
      text ("64, 192, 160", 480, 210);
    }
    if (mouseX > 535 && mouseX < 642 && mouseY > 0 && mouseY < 250)
    {
      fill (0);
      text ("96, 224, 224", 585, 210);
    }
    if (mouseX > 642 && mouseX < 749 && mouseY > 0 && mouseY < 250)
    {
      fill (0);
      text ("64, 192, 288", 690, 210);
    }
    if (mouseX > 0 && mouseX < 107 && mouseY > 250 && mouseY < 500)
    {
      fill (0);
      text ("64, 224, 192", 107/2, 460);
    }
    if (mouseX > 107 && mouseX < 214 && mouseY > 250 && mouseY < 500)
    {
      fill (0);
      text ("96, 192, 192", 160, 460);
    }
    if (mouseX > 214 && mouseX < 321 && mouseY > 250 && mouseY < 500)
    {
      fill (0);
      text ("64, 192, 160", 265, 460);
    }
    if (mouseX > 321 && mouseX < 428 && mouseY > 250 && mouseY < 500)
    {
      fill (0);
      text ("64, 256, 192", 370, 460);
    }
    if (mouseX > 428 && mouseX < 535  && mouseY > 250 && mouseY < 500)
    {
      fill (0);
      text ("96, 160, 224", 480, 460);
    }
    if (mouseX > 535 && mouseX < 642 && mouseY > 250 && mouseY < 500)
    {
      fill (0);
      text ("96, 128, 256", 585, 460);
    }
    if (mouseX > 642 && mouseX < 749 && mouseY > 250 && mouseY < 500)
    {
      fill (0);
      text ("96, 192, 256", 690, 460);
    }
  }
}



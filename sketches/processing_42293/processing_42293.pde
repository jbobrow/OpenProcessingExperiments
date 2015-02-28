
class Ball
{
  float xPlace, yPlace;
  void show()
  {
   fill (229,215,49);
  ellipse (xPlace, yPlace-5, 20, 5); 
    fill(240,0,0);
    ellipse (xPlace, yPlace, 10, 10);
    ellipse (xPlace+5, yPlace-5, 10, 10);
   
  }
  void movement()
  {
    xPlace = xPlace+random(-5,5);
    yPlace = yPlace+random(-5,5);
    if (xPlace<5)
    {
      xPlace = 5;
    }
    if (yPlace<0)
    {
      yPlace = 5;
    }
    if (xPlace>495)
    {
      xPlace = 495;
    }
    if (yPlace>495)
    {
      yPlace = 495;
    }
  }
}



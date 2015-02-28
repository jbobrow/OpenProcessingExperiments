
void keyPressed()
{
  
  p1 = p1 + change('q','Q','a','A',1);
  p2 = p2 + change('w','W','s','S',1);
  p3 = p3 + change('e','E','d','D',0.03);
  p4 = p4 + change('r','R','f','F',0.25);
  p5 = p5 + change('t','T','g','G',0.0001);
  p6 = int(p6 + change('y','Y','h','H',1));

  redraw();
}

float change(char k0, char k02, char k11, char k12, float step)
{
  float temp = 0;
  if (key==k0  || key== k02)
  {
   temp = step;
  }
   if (key==k11 || key==k12)
  {
    temp = (-step);
  }
  return temp;
}


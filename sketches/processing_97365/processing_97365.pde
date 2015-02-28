
public void show(int x, int y, int state, int age)
{
  //state += xorMask[x][y];
  state = state % numStates;
    
  if(state == 0)
    return;
  
  float s;
  if (subtleColors)
  {
    s = map((age/3) % 10, 0, 10, 200, 360);
    if(state > 1)
      s = 360 / state;
  }
  else
    s = 360;

  float cellHue = 70 * sqrt(age);
    
  int phaseModifier = (frame+state+y) * 360/period;
  float h = (colorTheme + cellHue + phaseModifier) % 360;
  
  float b;
  if (subtleColors)
    b = map(age % 20, 0, 20, 300, 360);
  else
    b = 360;

  stroke(color(h, s, b));
  point(x, y);
}



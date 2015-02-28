
class Gradient
{
  ArrayList colors;
  
  // Constructor
  Gradient()
  {
    colors = new ArrayList();
  }
  
  void addColor(color c)
  {
    colors.add(c);
  }
  
  color getGradient(float value)
  {
    // make sure there are colors to use
    if(colors.size() == 0)
      return #000000;
    
    // if its too low, use the lowest value
    if(value <= 0.0)
      return (color)(Integer) colors.get(0);
    
    // if its too high, use the highest value
    if(value >= colors.size() - 1)
      return (color)(Integer) colors.get(colors.size() -  1);
    
    // lerp between the two needed colors
    int color_index = (int)value;
    color c1 = (color)(Integer) colors.get(color_index);
    color c2 = (color)(Integer) colors.get(color_index + 1);
    
    return lerpColor(c1, c2, value - color_index);
  }
}




char currentBrush;

class BrushButton extends Button
{
  BrushButton(char key, int weight)
  {
    super(key);
    m_weight = weight;
  }
  
  void buttonPressed(int mouseButton)
  {
    currentTool = cKey;
    currentBrush = cKey;
  }

  boolean drawIcon()
  {
    ColorButton ec = (ColorButton)m_toolbar.getButton(currentColor);
    
    strokeWeight(m_weight);
    stroke(ec.m_color);
    smooth();
    point(width * 0.5, height * 0.5);

    return true;
  }

  int m_weight;
};



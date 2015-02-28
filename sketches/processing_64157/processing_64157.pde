

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

class FloodButton extends Button
{
  FloodButton(char key) {super(key);}
  
  boolean drawIcon()
  {
    smooth();
    pushMatrix();
    translate(width/2,height/2);
    rotate(-PI/4);
    
    float canWidth = width*0.5;
    float canTop = -height/4;
    float canBottom = height/4;

    fill(128);    
    rect(-canWidth/2,canTop,canWidth,height/2);
    arc(0,canBottom,canWidth,height/10,0,PI);
    fill(255,0,0);
    ellipse(0,canTop,canWidth,height/10);

    stroke(255,0,0);
    strokeWeight(3);
    line(-canWidth/2,canTop, -0.45 * width, 0.15*height);

    popMatrix();
    return true;
  }
};




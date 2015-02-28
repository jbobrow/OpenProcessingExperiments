
public class Control
{

  
  public Control()
  {
    
  }
  
  public void initialize()
  {
    controlP5 = new ControlP5(parent);
    controlP5.addSlider("Red",0,255,255,10,440,80,10);
    controlP5.addSlider("Green",0,255,255,10,460,80,10);
    controlP5.addSlider("Blue",0,255,255,10,480,80,10);
    
    CColor red = new CColor();
    red.setForeground(color(255,0,0));
    red.setActive(color(255,0,0));
    red.setBackground(color(150,0,0));
    controlP5.controller("Red").setColor(red);
    controlP5.controller("Red").setLabelVisible(false);
    
    CColor green = new CColor();
    green.setForeground(color(0,255,0));
    green.setActive(color(0,255,0));
    green.setBackground(color(0,100,0));
    controlP5.controller("Green").setColor(green);
    controlP5.controller("Green").setLabelVisible(false);
    
    CColor blue = new CColor();
    blue.setForeground(color(0,0,255));
    blue.setActive(color(0,0,255));
    blue.setBackground(color(0,0,100));
    controlP5.controller("Blue").setColor(blue);
    controlP5.controller("Blue").setLabelVisible(false);
  }
}


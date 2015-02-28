
ADSliderBar color1, color2, color3;

color r, g, b;

boolean back=true;

//////////////////////////////////////////////////////////////
void setup()
{
  size(600,400);
  smooth();

  color1 = new ADSliderBar(100,79,200,0.0,255.0,"Slider 1");
  color2 = new ADSliderBar(256,77,200,0.0,255.0,"Slider 2");
  color3 = new ADSliderBar(410,77,200,0.0,255.0,"Slider 3");
  
  //see the section ADSliderBar public methods on the class, to get more information on how to customize the slider
  color1.setOrientation(2);
  color1.setThickness(100);
  color1.setForegroundColor(#930303,#FF0000);
  color1.setBackgroundColor(#D84C4C,#FF0000);
  color1.setValue(180);
  
  color2.setOrientation(2);
  color2.setThickness(100);
  color2.setForegroundColor(#0B6400,#1CFF00);
  color2.setBackgroundColor(#5BCE4D,#1CFF00);
  color2.setValue(180);

  color3.setOrientation(2);
  color3.setThickness(100);
  color3.setForegroundColor(#0A007E,#9990FF);
  color3.setBackgroundColor(#4439C9,#9990FF);
  color3.setValue(134);
  
  activateMouseWheel();
}
//////////////////////////////////////////////////////////////
void draw()
{
   
  background(r,g,b);
  r=(int )color1.update();
  g=(int )color2.update();
  b=(int )color3.update();
  
}

//////////////////////////////////////////////////////////////
void mouseWheel(int delta)
{
  color1.changePositionWithWheel(delta);
  color2.changePositionWithWheel(delta);
  color3.changePositionWithWheel(delta);
}
//////////////////////////////////////////////////////////////
void activateMouseWheel()
{
 addMouseWheelListener(new java.awt.event.MouseWheelListener() 
 { 
   public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) 
   { 
     mouseWheel(evt.getWheelRotation());
   }
 });

}


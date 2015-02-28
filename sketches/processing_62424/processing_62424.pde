
keys keyP = new keys();
ADPanelMeter panel1, panel2;
float tScale1=1, tScale2=1;
float indicator=28.59999;


void setup()
{
  size(600,300);
  smooth();
  
  panel1 = new ADPanelMeter(0,0,300,"Mouse X");
  panel1.setBigMarks(5);
  panel1.setScale(0,width);
  panel1.setDebugOn();

  panel2 = new ADPanelMeter(300,0,300,"Mouse Y");
  panel2.setBigMarks(5);
  panel2.setScale(0,height);
  panel2.setDebugOn();
  panel2.showScaleColor();
  
  activateMouseWheel();  
  
}


void draw()
{
//  frame.setLocation(600,200);
  background(255);

  panel1.update();
  panel2.update();
  
  panel1.setValue(100*mouseX/width);
  panel2.setValue(100*mouseY/height);
  
}

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

void mouseWheel(int delta)
{  

  if (keyP.checkStrokes("CONTROL+S"))
  {
    if (panel1.mouseOver())
    {
      tScale1+=(float )delta/100;
      panel1.resize(tScale1);
    }
    if (panel2.mouseOver())
    {
      tScale2+=(float )delta/100;
      panel2.resize(tScale2);
    }

  }
/*  else
  {
    indicator+=(float )delta;
    
    if (indicator<0) indicator=0;
    if (indicator>100) indicator=100;
    panel.setValue(indicator);

  }*/

}

void keyPressed()
{
  keyP.pressedKey();
}

void keyReleased()
{
  keyP.releasedKey();
}


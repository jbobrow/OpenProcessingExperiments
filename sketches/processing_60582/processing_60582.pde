
import processing.serial.*;

ADText textLines;

void setup()
{
  size(500,310);
  smooth();
  
  textLines = new ADText();
  textLines.add(50.0, 24.0, 400.0, "Name", "Name");
  textLines.add(50.0, 66.0, 400.0, "Username", "Username");
  textLines.add(50.0, 109.0, 400.0, "Password", "Passw1");
  textLines.add(50.0, 152.0, 400.0, "Retype Password", "Passw2");
  
  textLines.setActive(1);

  setTextParams();
}
/////////////////////////////////////////////////////////////
void setTextParams()
{
  
  textLines.getElement(0).setBackgroundBox(#F0D29B);
  textLines.getElement(0).setFocusOn();

  textLines.getElement(1).setBackgroundBox(#F0D29B);

  textLines.getElement(2).setBackgroundBox(#F0E39B);
  textLines.getElement(2).setMaskOn();
  
  textLines.getElement(3).setBackgroundBox(#F0E39B);
  textLines.getElement(3).setMaskOn();
   
}
/////////////////////////////////////////////////////////////
void draw()
{
  background(255);
  textLines.update();
  
  if (textLines.getLastKey()!=0 && textLines.getLastField()==0)
  {
   println("Ejecutar Busqueda de campo: "+textLines.getElement(0).getText());
  }
  printOut();  
}
/////////////////////////////////////////////////////////////
void keyPressed()
{
  textLines.checkKeyPressed();
}
/////////////////////////////////////////////////////////////
void keyReleased()
{
  textLines.checkKeyReleased();
}


/////////////////////////////////////////////////////////////
void printOut()
{
  int y=220;

  fill(0);
  textSize(18);
  textAlign(LEFT);
  
  for (int i=0; i<textLines.size(); i++)
  {
    if (textLines.getElement(i).isEmpty())
      text(textLines.getElement(i).getID()+": is empty",50,y+i*20);
    else  
      text(textLines.getElement(i).getID()+": "+textLines.getElement(i).getText(),50,y+i*20);
  }
  

}

/*void keyPressed(KeyEvent ev) {
   System.out.println("Pressed: "+ev.getKeyCode());
}*/



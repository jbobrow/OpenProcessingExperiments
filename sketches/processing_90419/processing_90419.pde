
/**
* ControlP5 Textarea
*
*
* find a list of public methods available for the Textarea Controller
* at the bottom of this sketch.
*
* by Andreas Schlegel, 2012
* www.sojamo.de/libraries/controlp5
*
*/

import controlP5.*;

ControlP5 cp5;
Textarea myTextarea;

void setup() {
  size(700,400);
  cp5 = new ControlP5(this);
  
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(100,100)
                  .setSize(200,200)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(128))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100))
                  .setBorderColor(color(255,100));
                  ;
  myTextarea.setText("Change the brightness and darkness of this font by pressing c at different mouseY points.(0-255)"
                    +"Press r to see another message."
                    +"To change lineheight, press l at different points on the y axis."
                    +"Press h to hide textarea, and s to show it again."
                    );
    
  cp5.addSlider("changeWidth")
     .setRange(100,400)
     .setValue(200)
     .setPosition(100,20)
     .setSize(100,19)
     ;
     
  cp5.addSlider("changeHeight")
     .setRange(100,400)
     .setValue(200)
     .setPosition(100,40)
     .setSize(100,19)
     ;
  
}


void keyPressed() {
  if(key=='r') {
    myTextarea.setText("You should'na done that, he's just a boy"
                       +"Press o for original message."
                      );
    myTextarea.setBorderColor(255);  
  } else if(key=='c') {
    myTextarea.setColor(mouseY);
  }
  else if(key=='o') {
    myTextarea.setText("Change the brightness and darkness of this font by pressing c at different mouseY points.(0-255)"
                  +"Press r to see another message."
                    +"To change lineheight, press l at different points on the y axis."
                    +"Press h to hide textarea, and s to show it again."
                  );
  }else if(key=='h') {
   myTextarea.hide();  
  }else if(key=='s'){
    myTextarea.show();
  }
}
void draw() {
  background(0);
  if(keyPressed && key==' ') {
    myTextarea.scroll((float)mouseX/(float)width);
    
  }
  if(keyPressed && key=='l') {
    myTextarea.setLineHeight(mouseY);
  }
}

void changeWidth(int theValue) {
  myTextarea.setWidth(theValue);
}

void changeHeight(int theValue) {
  myTextarea.setHeight(theValue);
}




/*
a list of all methods available for the Textarea Controller
use ControlP5.printPublicMethodsFor(Textarea.class);
to print the following list into the console.

You can find further details about class Textarea in the javadoc.

Format:
ClassName : returnType methodName(parameter type)

controlP5.Textarea : Label getValueLabel() 
controlP5.Textarea : String getStringValue() 
controlP5.Textarea : String getText() 
controlP5.Textarea : Textarea disableColorBackground() 
controlP5.Textarea : Textarea enableColorBackground() 
controlP5.Textarea : Textarea hideScrollbar() 
controlP5.Textarea : Textarea scroll(float) 
controlP5.Textarea : Textarea setBorderColor(int) 
controlP5.Textarea : Textarea setColor(int) 
controlP5.Textarea : Textarea setColorBackground(int) 
controlP5.Textarea : Textarea setFont(ControlFont) 
controlP5.Textarea : Textarea setFont(PFont) 
controlP5.Textarea : Textarea setFont(int) 
controlP5.Textarea : Textarea setHeight(int) 
controlP5.Textarea : Textarea setLineHeight(int) 
controlP5.Textarea : Textarea setScrollActive(int) 
controlP5.Textarea : Textarea setScrollBackground(int) 
controlP5.Textarea : Textarea setScrollForeground(int) 
controlP5.Textarea : Textarea setSize(int, int) 
controlP5.Textarea : Textarea setText(String) 
controlP5.Textarea : Textarea setWidth(int) 
controlP5.Textarea : Textarea showScrollbar() 
controlP5.Textarea : boolean isScrollable() 
controlP5.Textarea : float getValue() 
controlP5.Textarea : void controlEvent(ControlEvent) 
controlP5.ControllerGroup : CColor getColor() 
controlP5.ControllerGroup : ControlWindow getWindow() 
controlP5.ControllerGroup : ControlWindowCanvas addCanvas(ControlWindowCanvas) 
controlP5.ControllerGroup : Controller getController(String) 
controlP5.ControllerGroup : ControllerProperty getProperty(String) 
controlP5.ControllerGroup : ControllerProperty getProperty(String, String) 
controlP5.ControllerGroup : Label getCaptionLabel() 
controlP5.ControllerGroup : Label getValueLabel() 
controlP5.ControllerGroup : PVector getPosition() 
controlP5.ControllerGroup : String getAddress() 
controlP5.ControllerGroup : String getInfo() 
controlP5.ControllerGroup : String getName() 
controlP5.ControllerGroup : String getStringValue() 
controlP5.ControllerGroup : String toString() 
controlP5.ControllerGroup : Tab getTab() 
controlP5.ControllerGroup : Textarea add(ControllerInterface) 
controlP5.ControllerGroup : Textarea bringToFront() 
controlP5.ControllerGroup : Textarea bringToFront(ControllerInterface) 
controlP5.ControllerGroup : Textarea close() 
controlP5.ControllerGroup : Textarea disableCollapse() 
controlP5.ControllerGroup : Textarea enableCollapse() 
controlP5.ControllerGroup : Textarea hide() 
controlP5.ControllerGroup : Textarea moveTo(ControlWindow) 
controlP5.ControllerGroup : Textarea moveTo(PApplet) 
controlP5.ControllerGroup : Textarea open() 
controlP5.ControllerGroup : Textarea registerProperty(String) 
controlP5.ControllerGroup : Textarea registerProperty(String, String) 
controlP5.ControllerGroup : Textarea remove(CDrawable) 
controlP5.ControllerGroup : Textarea remove(ControllerInterface) 
controlP5.ControllerGroup : Textarea removeCanvas(ControlWindowCanvas) 
controlP5.ControllerGroup : Textarea removeProperty(String) 
controlP5.ControllerGroup : Textarea removeProperty(String, String) 
controlP5.ControllerGroup : Textarea setAddress(String) 
controlP5.ControllerGroup : Textarea setArrayValue(float[]) 
controlP5.ControllerGroup : Textarea setColor(CColor) 
controlP5.ControllerGroup : Textarea setColorActive(int) 
controlP5.ControllerGroup : Textarea setColorBackground(int) 
controlP5.ControllerGroup : Textarea setColorForeground(int) 
controlP5.ControllerGroup : Textarea setColorLabel(int) 
controlP5.ControllerGroup : Textarea setColorValue(int) 
controlP5.ControllerGroup : Textarea setHeight(int) 
controlP5.ControllerGroup : Textarea setId(int) 
controlP5.ControllerGroup : Textarea setLabel(String) 
controlP5.ControllerGroup : Textarea setMouseOver(boolean) 
controlP5.ControllerGroup : Textarea setMoveable(boolean) 
controlP5.ControllerGroup : Textarea setOpen(boolean) 
controlP5.ControllerGroup : Textarea setPosition(PVector) 
controlP5.ControllerGroup : Textarea setPosition(float, float) 
controlP5.ControllerGroup : Textarea setStringValue(String) 
controlP5.ControllerGroup : Textarea setUpdate(boolean) 
controlP5.ControllerGroup : Textarea setValue(float) 
controlP5.ControllerGroup : Textarea setVisible(boolean) 
controlP5.ControllerGroup : Textarea setWidth(int) 
controlP5.ControllerGroup : Textarea show() 
controlP5.ControllerGroup : Textarea update() 
controlP5.ControllerGroup : Textarea updateAbsolutePosition() 
controlP5.ControllerGroup : boolean isCollapse() 
controlP5.ControllerGroup : boolean isMouseOver() 
controlP5.ControllerGroup : boolean isMoveable() 
controlP5.ControllerGroup : boolean isOpen() 
controlP5.ControllerGroup : boolean isUpdate() 
controlP5.ControllerGroup : boolean isVisible() 
controlP5.ControllerGroup : boolean setMousePressed(boolean) 
controlP5.ControllerGroup : float getValue() 
controlP5.ControllerGroup : float[] getArrayValue() 
controlP5.ControllerGroup : int getHeight() 
controlP5.ControllerGroup : int getId() 
controlP5.ControllerGroup : int getWidth() 
controlP5.ControllerGroup : void remove() 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 


*/






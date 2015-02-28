
/*
  ------------------------------------------------------------
  GUI -  by Thomas Diewald
  30.08.2010
  Version 6.1
  
  update 07.10.2010
  ------------------------------------------------------------
*/
import java.lang.Object;
import java.lang.reflect.*;

public class GUI{
  //GUI_Control control[] = new GUI_Control[0];
  ArrayList control; 
  
  PApplet p;
  PMatrix3D currCameraMatrix;
  PGraphics3D g3d; 
  
  boolean isActive  = true;
  boolean autoBuild = true;
  int lockedControl = -1;
  
  GUI(PApplet p){
    this.p = p;
    this.p.registerDraw(this);
    this.p.registerPost(this);
    this.p.registerMouseEvent(this);
    this.p.registerKeyEvent(this);
    control = new ArrayList();
  } // end constructor
  
  void deleteGUI(){
    this.p = p;
    this.p.unregisterDraw(this);
    this.p.unregisterPost(this);
    this.p.unregisterMouseEvent(this);
    this.p.unregisterKeyEvent(this);
  }
  
  
  void draw() {
    if( isActive ){
      if ( mousePressed ) checkForEvent("mousePressed");
      if ( autoBuild )    build();
    }
  } // end void draw()
  
  void post(){
     //if(mousePressed) println("fgaffgag");
  }
  
  
  
  void build() {
    if(g.is3D() ){
      g3d = (PGraphics3D)g;
      currCameraMatrix = new PMatrix3D(g3d.camera);
      camera();
      build_UI();
      g3d.camera = currCameraMatrix;
    } else {
      build_UI();
    } // end if
  } // end void build() 
  
  
  void build_UI(){
    for(int i = 0; i < control.size(); i++){
      GUI_Control c = (GUI_Control) control.get(i);
      if(c.getControlVisible()){
        if( lockedControl < 0) c.isFocused(mouseX, mouseY);
        c.build();
      }
    } // end for i
   
    for(int i = 0; i < control.size(); i++){
      GUI_Control c = (GUI_Control) control.get(i);
      if(c.getControlVisible())
        if( c.getInfoBoxVisible() )
          c.drawInfoBox();
    }
    for(int i = 0; i < control.size(); i++){
      GUI_Control c = (GUI_Control) control.get(i);
      c.wasTriggered = false;
      c.isPressed    = false;
    }
  } // end void build_UI(){
  
    
  
    
  boolean controlIsAttached( GUI_Control c ){
    for(int i = 0; i < control.size(); i++)
      if( (GUI_Control) control.get(i)  == c ) 
        return true;  
    return false;    
  } // end boolean controlIsAttached( GUI_Control c )
   
  boolean addControl(GUI_Control c){
    if ( ! controlIsAttached(c) ) return control.add( c ); else return false;
  } // end void addControl(GUI_Control c)
  
  boolean removeControl(GUI_Control c){
    if (  controlIsAttached(c) ) return control.remove( c ); else return false;
  } // end void removeControl(GUI_Control c)
  
  

  
  public void keyEvent(KeyEvent e){
    if( isActive ){
      switch (e.getID()) {
        case KeyEvent.KEY_PRESSED:
   
          if ( lockedControlIsTextfield >= 0 ) {
            if( key == ENTER || key == RETURN || key == ESC) {
              GUI_Control c = (GUI_Control) control.get( lockedControlIsTextfield );
              c.isActive = false; 
              c.resetTextFieldSelection();
              c.updateTextFieldValue();
              guiEvent( c );
              lockedControlIsTextfield = -1; 
            } else {
              GUI_Control c = (GUI_Control) control.get( lockedControlIsTextfield );
              c.keyPressed();
            }
          }
          break;
        //case KeyEvent.KEY_RELEASED: println("key was released");  break;
        //case KeyEvent.KEY_TYPED:    println("key was typed"); break;
      }// end switch
    }
  } // end void keyEvent
  
  
  
  
  
 
  public void mouseEvent(MouseEvent e) {
    if( isActive ){
      //println(e);
      //int xFrame = e.getX();
      //int yFrame = e.getY();               
      //int xFrame1 = mouseEvent.getPoint().x;
      //int yFrame1 = mouseEvent.getPoint().y;   
      //int xScreen = e.getLocationOnScreen().x;
      //int yScreen = e.getLocationOnScreen().y;              
      //int button = e.getButton();         
      switch (e.getID()) {
        case MouseEvent.MOUSE_PRESSED:
          lockControl();
          break;
        case MouseEvent.MOUSE_RELEASED:
          checkForEvent("mouseReleased");
          lockedControl = -1;
          break;    
        case MouseEvent.MOUSE_CLICKED: break;
        case MouseEvent.MOUSE_DRAGGED: break;
        case MouseEvent.MOUSE_MOVED:   break;    
        case MouseEvent.MOUSE_ENTERED: break; 
        case MouseEvent.MOUSE_EXITED:  break;
      }// end switch
    }
  } // end void mouseEvent(MouseEvent e) {
  
  
  void lockControl(){
    if ( mouseButton == LEFT ) {
      for( int i = 0; i < control.size(); i++ ){
        GUI_Control c = (GUI_Control) control.get( i );
        if( c.isFocused(mouseX, mouseY ) && c.getControlVisible() ){   
          lockedControl = i;
          //println("lock "+control[i]);
        }  // end if( control[i].isFocused(mouseX, mouseY) )
      } // end for i
    } // end if  ( mouseButton == LEFT)     
  } // end  void lockControl()
  



  int lockedControlIsTextfield = -1;
  
  void checkForEvent(String mouseEvent){
    // for textFields
    if(lockedControlIsTextfield >= 0){ 
      GUI_Control c = (GUI_Control) control.get( lockedControlIsTextfield );
      c.isActive = false; 
      if(lockedControl != lockedControlIsTextfield) {
        c.resetTextFieldSelection();
        c.updateTextFieldValue();
        guiEvent( c );
      }
      lockedControlIsTextfield = -1; 
    }
    
    if(lockedControl >= 0) {
      GUI_Control c = (GUI_Control) control.get( lockedControl );
      c.controlReleased( mouseEvent );
      if ( c.wasTriggered() ){
        guiEvent( c );
        if( c.controlType.equals("textField") ) lockedControlIsTextfield = lockedControl;
      }
    }  
  } // end void checkForEvent() 
  

    
    
    
  void setAutoBuild (boolean autoBuild){
    this.autoBuild = autoBuild;
  }
  
  boolean getAutoBuild (){
    return autoBuild;
  }
  
  void activate(boolean isActive){
    this.isActive = isActive;
  }
  
  boolean isActive(){
    return isActive;
  } 
} // end class GUI



























/*
  ------------------------------------------------------------
  GUI_Control -  by Thomas Diewald
  28.06.2010
  Version 1.3
  ------------------------------------------------------------
  
*/
class GUI_Control{
  String controlType = "";
  int id = 0;

  PApplet p;
  
  // control
  float x = 0, y = 0;
  float w = 100, h = 20;
  float borderWidth = 1;
  
  // label
  String label = "";
  float  labelMarginLeft = 2, labelMarginTop = 2;
  float  labelXposition, labelYposition;
  String labelAlign = "LEFT"; // "LEFT", "CENTER", "RIGHT", "NONE"
  PFont  font;
  int    labelSize;


  boolean borderVisible  = true;
  boolean labelVisible   = true;
  boolean controlVisible = true;
  boolean isFocused      = false;
  boolean isPressed      = false;
  boolean wasTriggered   = false;
  boolean isActive       = false;
  
 
 
  // colors
  color colorButtonDefault_Stroke = color(200);
  color colorButtonDefault_Fill   = color(100);
  color colorButtonFocused_Stroke = color(200);
  color colorButtonFocused_Fill   = color(120);
  color colorButtonPressed_Stroke = color(200);
  color colorButtonPressed_Fill   = color(50);
  color colorLabelDefault_Fill    = color(200);
  color colorLabelPressed_Fill    = color(200);
  color colorLabelFocused_Fill    = color(200);


  // infoBox
  int     infoBoxTimer   = 0;
  boolean infoBoxVisible = true;
  String  infoBoxLabel = "infobox";

  
  
  // --------------------------------------------------------------------------------------------------------------------------------------------
  // --------------------------------------------------------------------------------------------------------------------------------------------
  // --------------------------------------------------------------------------------------------------------------------------------------------
  GUI_Control(GUI g){ 
    p = g.p;
  }

  
  GUI_Control(GUI gui, int id, String label, float x, float y, float w, float h, PFont font){
    this.id    = id;
    this.label = label;
    this.x     = x;
    this.y     = y;
    this.w     = w;
    this.h     = h;
    this.font  = font;
    p = gui.p;
    gui.addControl(this);
    
    textFont(font);
    labelSize = (int)g.textSize;

    setLabelPosition(x + labelMarginLeft, y + h/2 +  labelSize/3);
  } // end constructor
  
  
  GUI_Control(GUI gui, int id, String label, float x, float y, float w, float h){
    this.id    = id;
    this.label = label;
    this.x     = x;
    this.y     = y;
    this.w     = w;
    this.h     = h;
    font       = createFont("Calibri", 12);
    p = gui.p;
    gui.addControl(this);
    textFont(font);
    labelSize = (int)g.textSize;

    setLabelPosition(x + labelMarginLeft, y + h/2 +  labelSize/3);
  } // end constructor
  

  
  
  // --------------------------------------------------------------------------------------------------------------------------------------------
  // --------------------------------------------------------------------------------------------------------------------------------------------
  // --------------------------------------------------------------------------------------------------------------------------------------------

   
  
  boolean isFocused(int mouseXpos, int mouseYpos ){
    float boundaryX_left = x;
    float boundaryX_right = x + w;
    float boundaryY_top = y;
    float boundaryY_bot = y + h;
    return isFocused = ( mouseXpos >= boundaryX_left && mouseXpos <= boundaryX_right && mouseYpos >= boundaryY_top && mouseYpos <= boundaryY_bot ) ? true : false;
  } // end boolean isFocused(float mouseXpos, float mouseYpos )
  
  
  
  void controlReleased( String mouseEvent){
  }
  
  boolean wasTriggered(){
    return wasTriggered; 
  }
  
  boolean isPressed(){
    return isPressed; 
  }
  
  void activate(boolean isActive){
    this.isActive = isActive;
  }
  
  boolean isActive(){
    return isActive;
  } 
  
  void build(){
  }
  
  
  
  // textFields
  void keyPressed(){ }
  void resetTextFieldSelection(){}
  void updateTextFieldValue(){}
  
  
  // set visibility of control
  void setControlVisible(boolean controlVisible){
    this.controlVisible = controlVisible;
  }
  
  boolean getControlVisible(){
    return controlVisible;
  }




  // label position
  void setLabelPosition(float labelXposition, float labelYposition){
    this.labelXposition = (int)labelXposition;
    this.labelYposition = (int)labelYposition; 
    labelAlign = "NONE";
  }
  float[] getLabelPosition(){
    return new float[]{labelXposition, labelYposition};
  }
  void setLabelPositionX(float labelXposition){
    this.labelXposition = (int)labelXposition;
    labelAlign = "NONE";
  }
  float getLabelPositionX(){
    return labelXposition;
  }
  void setLabelPositionY(float labelYposition){
    this.labelYposition =  (int)labelYposition;
    labelAlign = "NONE";
  }
  float getLabelPositionY(){
    return labelYposition;
  }
  void setLabelMarginLeft(float labelMarginLeft){
    this.labelMarginLeft = (int)labelMarginLeft;
    this.labelXposition += this.labelMarginLeft;
    labelAlign = "NONE";
  }
  float getLabelMarginLeft(){
    return labelMarginLeft;
  }
  void setLabelMarginTop(float labelMarginTop){
    this.labelMarginTop =  (int)labelMarginTop;
    this.labelYposition += this.labelMarginTop;
    labelAlign = "NONE";
  }
  float getLabelMarginTop(){
    return labelMarginTop;
  }
  void setLabelAlign(String align){
    labelAlign = align;
    textFont(font, labelSize);
    float textW = textWidth(label);
    if     ( labelAlign.equals("LEFT")   )  labelXposition = int( x + 3);
    else if( labelAlign.equals("CENTER") )  labelXposition = int( x + w/2 - textW/2.0 );
    else if( labelAlign.equals("RIGHT")  )  labelXposition = int( x + w - textW - 3 );
    labelYposition = int(y + h/2 + labelSize/3); 
  }
  
  void refreshLabelAlign(){
    setLabelAlign(labelAlign);
  }

  String getLabelAlign(){
    return  labelAlign;
  }
  
  
  
  // label size
  void setLabelSize(float labelSize) {
    this.labelSize = (int)labelSize;
  }
  float getLabelSize() {
    return labelSize;
  }


  void setLabelVisible( boolean labelVisible){
    this.labelVisible = labelVisible;
  }
  boolean getLabelVisible(){
    return labelVisible;
  }
  // label text and fotn
  void setLabel(String labelNew){
    this.label = labelNew; 
  }
  String getLabel(){
    return label;
  }
  
  void setLabelFont(PFont font){
    this.font = font;
    textFont(font);
    labelSize = (int)g.textSize;
  }
  PFont getLabelFont(){
    return font; 
  }
  

  

  // set border Stuff
  void setBorderWidth(float borderWidth){
    this.borderWidth = borderWidth;
  }
  float getBorderWidth(){
    return borderWidth;
  }
  void setBorderVisible(boolean borderVisible){
    this.borderVisible = borderVisible; 
  }
  boolean getBorderVisible(){
    return borderVisible;
  }
  
 
  
  void setID(int id){
    this.id = id; 
  }
  int getID(){
    return id; 
  }
  


  
  
  
  

  
  // set/get position
  void setPosition(float x, float y){
    labelXposition += x - this.x;
    labelYposition += y - this.y;
    this.x = x; this.y = y; 
    setLabelAlign(labelAlign);
  }
  float[] getPosition(){
    float xy[] = {x,y};
    return xy;
  }
  void setPositionX(float x){
    labelXposition += x - this.x;
    this.x = x; 
    setLabelAlign(labelAlign);
  }
  float getPositionX(){
    return x;
  }
  void setPositionY(float y){
    labelYposition += y - this.y;
    this.y = y; 
    setLabelAlign(labelAlign);
  }
  float getPositionY(){
    return y;
  }
  
  
  
  // set/get Size
  void setWidth(float w){
    this.w = w;
    setLabelAlign(labelAlign);
  }
  float getWidth(){
    return w;
  }
  void setHeight(float h){
   this.h = h;
   setLabelAlign(labelAlign);
  }
  float getHeight(){
    return h;
  }
  
  void setSize(float w, float h){
    this.w = w;
    this.h = h;
    setLabelAlign(labelAlign);
  }
  float[] getSize(){
    return new float[]{w,h};
  }
 
 

  

 

 
 
   
  // set button colors
  void  setColorButtonDefault_Fill  ( color colorButtonDefault_Fill )  { this.colorButtonDefault_Fill   = colorButtonDefault_Fill;   }
  void  setColorButtonDefault_Stroke( color colorButtonDefault_Stroke ){ this.colorButtonDefault_Stroke = colorButtonDefault_Stroke; }
  void  setColorButtonPressed_Fill  ( color colorButtonPressed_Fill )  { this.colorButtonPressed_Fill   = colorButtonPressed_Fill;   }
  void  setColorButtonPressed_Stroke( color colorButtonPressed_Stroke ){ this.colorButtonPressed_Stroke = colorButtonPressed_Stroke; }
  void  setColorButtonFocused_Fill  ( color colorButtonFocused_Fill )  { this.colorButtonFocused_Fill   = colorButtonFocused_Fill;   }
  void  setColorButtonFocused_Stroke( color colorButtonFocused_Stroke ){ this.colorButtonFocused_Stroke = colorButtonFocused_Stroke; }
  
  // get button colors
  color getColorButtonDefault_Fill()   { return colorButtonDefault_Fill;   }
  color getColorButtonDefault_Stroke() { return colorButtonDefault_Stroke; }
  color getColorButtonPressed_Fill()   { return colorButtonPressed_Fill;   }
  color getColorButtonPressed_Stroke() { return colorButtonPressed_Stroke; }
  color getColorButtonFocused_Fill()   { return colorButtonFocused_Fill;   }
  color getColorButtonFocused_Stroke() { return colorButtonFocused_Stroke; }
  
  // set label colors
  void  setColorLabelDefault_Fill  ( color colorLabelDefault_Fill )  { this.colorLabelDefault_Fill   = colorLabelDefault_Fill;   }
  void  setColorLabelPressed_Fill  ( color colorLabelPressed_Fill )  { this.colorLabelPressed_Fill   = colorLabelPressed_Fill;   }
  void  setColorLabelFocused_Fill  ( color colorLabelFocused_Fill )  { this.colorLabelFocused_Fill   = colorLabelFocused_Fill;   }
  void  setColorLabel ( color colorLabel ) {
    setColorLabelDefault_Fill(colorLabel);
    setColorLabelPressed_Fill(colorLabel);
    setColorLabelFocused_Fill(colorLabel);
  }

  // get label colors
  color getColorLabelDefault_Fill()   { return colorLabelDefault_Fill; }
  color getColorLabelPressed_Fill()   { return colorLabelPressed_Fill; }
  color getColorLabelFocused_Fill()   { return colorLabelFocused_Fill; }
  
  
  
  
  
  
  // infoBox
  void setInfoBoxVisible( boolean infoBoxVisible){
    this.infoBoxVisible = infoBoxVisible;
  }
  
  boolean getInfoBoxVisible(){
    return infoBoxVisible;
  }
  
  void setInfoBoxLabel(String infoBoxLabel){
    this.infoBoxLabel = infoBoxLabel;
  }
  
  String getInfoBoxLabel(){
    return infoBoxLabel;
  }
  
  // draw infoBox
  void drawInfoBox(){
    if( isFocused && !isPressed){
      if( infoBoxTimer == -1 ) infoBoxTimer = millis();
      if( millis() - infoBoxTimer > 600){
        textFont(font); 
        float infoW = textWidth(infoBoxLabel) + 5;
        float infoH = (labelSize + 4 ) * split(infoBoxLabel, "\n").length;
        float infoX = mouseX;
        float infoY = mouseY - infoH;
        float infoXlabel =infoX+3;
        float infoYlabel = infoY + 1*labelSize;
        fill(0,100); stroke(200); strokeWeight(1);
        rect(infoX, infoY, infoW, infoH);
        textAlign(LEFT); fill(200);
        text(infoBoxLabel, infoXlabel, infoYlabel);
      } 
    } else {
      infoBoxTimer = -1;
    } // end if else
  } // end drawInfoBox()
  
  
  
  
  
  
  
  
  
  
} // end class GUI_Control{
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
/*
  ------------------------------------------------------------
  GUI_Button -  by Thomas Diewald
  28.06.2010
  Version 1.3
  ------------------------------------------------------------
*/

class GUI_Button extends GUI_Control{
  
  GUI_Button(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    g.addControl(this);
    controlType = "button";
  }
  
  GUI_Button(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    g.addControl(this);
    controlType = "button";
  }
  
  void controlReleased(String mouseEvent){
    if( mouseEvent.equals("mouseReleased") && isFocused(mouseX, mouseY ) )wasTriggered = true; else wasTriggered = false;
    if( mouseEvent.equals("mousePressed"))                                isPressed    = true; else isPressed    = false;
  } // end  void controlReleased(String mouseEvent){
  

  void build(){
    strokeWeight(1);
    if      ( isPressed ){ stroke(colorButtonPressed_Stroke); fill(colorButtonPressed_Fill); } 
    else if ( isFocused ){ stroke(colorButtonFocused_Stroke); fill(colorButtonFocused_Fill); } 
    else                 { stroke(colorButtonDefault_Stroke); fill(colorButtonDefault_Fill); }
    if( ! borderVisible ) noStroke();   
    rect(x, y, w, h);

    if ( labelVisible ){
      if      ( isPressed ) fill( colorLabelPressed_Fill ); 
      else if ( isFocused ) fill( colorLabelFocused_Fill ); 
      else                  fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
    }
  } // end void build

} // end class GUI_Button




























/*
  ------------------------------------------------------------
  GUI_DragBox -  by Thomas Diewald
  28.06.2010
  Version 1.3
  ------------------------------------------------------------
*/

class GUI_DragBox extends GUI_Control{
  float dragBoxValue;
  float dragBoxValueCopy;
  float dragBoxValueTMP = 0;
  float dragBoxSteps = 2;
  float dragBoxValueMin = -50;
  float dragBoxValueMax = 300;
  boolean valueIsTypeOfInteger     = true;
  
  
  GUI_DragBox(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    dragBoxValue = 0;
    g.addControl(this);
    controlType = "dragBox";
  }
  
  GUI_DragBox(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    dragBoxValue = 0;
    g.addControl(this);
    controlType = "dragBox";
  }

  void controlReleased(String mouseEvent){
     wasTriggered = true; isPressed = true;
     calculateDragBoxValue();
  } // end  void controlReleased(String mouseEvent){
    

  void build(){
    strokeWeight(1);
    if      ( isPressed ){ stroke(colorButtonPressed_Stroke); fill(colorButtonPressed_Fill); } 
    else if ( isFocused ){ stroke(colorButtonFocused_Stroke); fill(colorButtonFocused_Fill); } 
    else                 { stroke(colorButtonDefault_Stroke); fill(colorButtonDefault_Fill); }
    if( ! borderVisible ) noStroke();   
    rect(x, y, w, h);

    if ( labelVisible ){
      if      ( isPressed ) fill( colorLabelPressed_Fill ); 
      else if ( isFocused ) fill( colorLabelFocused_Fill ); 
      else                  fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
      textAlign(CENTER);
      text(nf((int)dragBoxValue, 1), int(x+w/2), int(y+h/2 + labelSize/3.0));
      //text(nf(dragBoxValue, 1, 2), int(x+w/2), int(y+h/2 + labelSize/3.0));
    }
  } // end void build
  


  void setDragBoxValue(float dragBoxValue){
     this.dragBoxValue = dragBoxValue;
     dragBoxValueCopy = this.dragBoxValue;
  }
  
  float getDragBoxValue(){
    return dragBoxValue;
  }
  
  void setDragBoxValueMin(float dragBoxValueMin){
    this.dragBoxValueMin = dragBoxValueMin;
  }
  float getDragBoxValueMin(){
    return dragBoxValueMin;
  }
  void setDragBoxValueMax(float dragBoxValueMax){
    this.dragBoxValueMax = dragBoxValueMax;
  }
  float getDragBoxValueMax(){
    return dragBoxValueMax;
  }
  
  void setSteps(float dragBoxSteps){
    this.dragBoxSteps = dragBoxSteps;
  }
  
  void calculateDragBoxValue(){
    int dir = (pmouseY-mouseY) > 0 ? 1: -1;
    dragBoxValueCopy += (pmouseY-mouseY)/(dragBoxSteps*1.0) + int(dir* sq(pmouseY-mouseY)/20);
    dragBoxValue = valueIsTypeOfInteger ? (int) dragBoxValueCopy : dragBoxValueCopy;
    if ( dragBoxValue < dragBoxValueMin) {
      dragBoxValue = dragBoxValueMin; dragBoxValueCopy = dragBoxValueMin;
    } else if( dragBoxValue > dragBoxValueMax) {
      dragBoxValue = dragBoxValueMax; dragBoxValueCopy = dragBoxValueMax;
    }
    wasTriggered = true;
  }

} // end GUI_DragBox
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


/*
  ------------------------------------------------------------
  GUI_Label -  by Thomas Diewald
  28.06.2010
  Version 1.3
  ------------------------------------------------------------
*/

class GUI_Label extends GUI_Control{

  GUI_Label(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    g.addControl(this);
    controlType = "label";
  }
  
  GUI_Label(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    g.addControl(this);
    controlType = "label";
  }
  

  void build(){
    strokeWeight(1);
    fill(colorButtonDefault_Fill);
    if( ! borderVisible ) noStroke();  else stroke(colorButtonDefault_Stroke); 
    rect(x, y, w, h);

    if ( labelVisible ){
      fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
    }
  } // end void build
} // end class GUI_Lab






















/*
  ------------------------------------------------------------
  GUI_Slider -  by Thomas Diewald
  28.06.2010
  Version 1.3
  ------------------------------------------------------------
*/

class GUI_Slider extends GUI_Control{
  
  float sliderValueDefault         = 0;
  float sliderValueMax             = 255;
  float sliderValueMin             = 0;
  float sliderValue                = 0;
  float sliderKnobWith             = 20;
  float sliderKnobPositionX        = 0;
  float sliderDelay                = 1;
  boolean sliderValueVisible       = true;
  boolean valueIsTypeOfInteger     = true;
  int sliderValueMarginTop         = 0;
  int sliderValueMarginLeft        = 0;


  
  GUI_Slider(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    controlType = "slider";
    
    refreshSliderValues();
    sliderKnobWith = h/2; sliderKnobWith = 0;
  }
  
  GUI_Slider(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    controlType = "slider";
    
    refreshSliderValues();
    sliderKnobWith = h/2; sliderKnobWith = 0;
  }
  

  void controlReleased(String mouseEvent){
     wasTriggered = true; isPressed = true;
     calculateSliderValue();
  } // end  void controlReleased(String mouseEvent){
  

  
  
  void build(){
    strokeWeight(1);
    fill(colorButtonDefault_Fill); noStroke();
    if ( isFocused ){ fill(colorButtonFocused_Fill);  } 
    rect(x, y, w, h); // just fill the basic rectangle
    
    
    fill(colorButtonPressed_Fill); noStroke();
    rect(x, y, sliderKnobPositionX - x - sliderKnobWith/2, h); // draw slider position
    
    /*
    stroke(colorButtonPressed_Stroke);
    fill(0, 150); noFill(); fill(colorButtonPressed_Stroke); fill(colorButtonDefault_Fill);
    float hOffset = 0;
    sliderKnobWith = 0;
    rect(sliderKnobPositionX - sliderKnobWith/2, y + hOffset, sliderKnobWith, h - hOffset*2);
    */
    
    if      ( isPressed ){ stroke(colorButtonPressed_Stroke);  } 
    else if ( isFocused ){ stroke(colorButtonFocused_Stroke);  } 
    else                 { stroke(colorButtonDefault_Stroke);  }
    if( ! borderVisible ) noStroke();   
    noFill();
    rect(x, y, w, h); // draw slider borde
    


    if ( labelVisible ){
      if      ( isPressed ) fill( colorLabelPressed_Fill ); 
      else if ( isFocused ) fill( colorLabelFocused_Fill ); 
      else                  fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
      
      if( sliderValueVisible ) 
        text(nf(sliderValue, 1, 2), int(x+w/2 - 5) + sliderValueMarginLeft, int(y+h/2 + labelSize/3.0) + sliderValueMarginTop);
    }
  } // end void build


  void setSliderValueMarginTop( int sliderValueMarginTop ){
    this.sliderValueMarginTop = sliderValueMarginTop;
  }
  int getSliderValueMarginTop(){
    return sliderValueMarginTop;
  }
  void setSliderValueMarginLeft( int sliderValueMarginLeft ){
    this.sliderValueMarginLeft = sliderValueMarginLeft;
  }  
  int getSliderValueMarginLeft(){
    return sliderValueMarginLeft;
  }
  
  

  void calculateSliderValue(){
    float minX = x + sliderKnobWith/2;
    float maxX = x + w - sliderKnobWith/2;
    
    sliderKnobPositionX += (mouseX - sliderKnobPositionX) / sliderDelay;
    if(sliderKnobPositionX <= minX) sliderKnobPositionX = minX;
    if(sliderKnobPositionX >= maxX) sliderKnobPositionX = maxX;
    
    sliderValue = map(sliderKnobPositionX, minX, maxX, sliderValueMin, sliderValueMax);
    if( valueIsTypeOfInteger ) sliderValue = int(sliderValue);
  } // end void getSliderValue()
  
  
  void refreshSliderValues(){
    sliderValue            = sliderValueMin + (sliderValueMax - sliderValueMin)/2;
    sliderValueDefault     = sliderValue;
    sliderKnobPositionX    = x + sliderKnobWith/2 + map(sliderValue, sliderValueMin, sliderValueMax, 0, w-sliderKnobWith);
  }
  
  
  
  void setSliderValue(float sliderValue){
    this.sliderValue = sliderValue;
    if(sliderValue < sliderValueMin) this.sliderValue = sliderValueMin;  
    if(sliderValue > sliderValueMax) this.sliderValue = sliderValueMax;
    sliderKnobPositionX    = x + sliderKnobWith/2 + map(sliderValue, sliderValueMin, sliderValueMax, 0, w-sliderKnobWith);
    //refreshSliderValues();
  }
  float getSliderValue(){
    return sliderValue;
  }
  
  void setSliderValueDefault(float sliderValueDefault){
    this.sliderValueDefault = sliderValueDefault;
    refreshSliderValues();
  }
  void setSliderValueMax(float sliderValueMax){
    this.sliderValueMax     = sliderValueMax; 
    refreshSliderValues();
  }
  float getSliderValueMax(){
    return sliderValueMax;
  }
  void setSliderValueMin(float sliderValueMin){
    this.sliderValueMin = sliderValueMin; 
    refreshSliderValues();
  }
  float getSliderValueMin(){
    return sliderValueMin;
  }
  void setSliderDelay(float sliderDelay){
    this.sliderDelay = sliderDelay;
  }
  float getSliderDelay(){
    return sliderDelay;
  }
  
  
  void setSliderValueVisible(boolean sliderValueVisible){
    this.sliderValueVisible = sliderValueVisible;
  }
  boolean getSliderValueVisible(){
    return sliderValueVisible;
  }
 
} // end class GUI_Slider


































/*
  ------------------------------------------------------------
  GUI_Switch -  by Thomas Diewald
  28.06.2010
  Version 1.3
  ------------------------------------------------------------
*/

class GUI_Switch extends GUI_Control{

   
  GUI_Switch(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    g.addControl(this);
    controlType = "switch";
  }
  
  GUI_Switch(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    g.addControl(this);
    controlType = "switch";
  }
  
  void controlReleased(String mouseEvent){
     wasTriggered = false; isPressed = false;
     if( mouseEvent.equals("mouseReleased") && isFocused(mouseX, mouseY ) ){ wasTriggered = true;    isActive = isActive ? false : true; } // end if
     if( mouseEvent.equals("mousePressed") )                                 isPressed    = true;
  } // end  void controlReleased(String mouseEvent){
  
    
  void build(){
    strokeWeight(1);
    if      ( isPressed || isActive){ stroke(colorButtonPressed_Stroke); fill(colorButtonPressed_Fill); } 
    else if ( isFocused ){ stroke(colorButtonFocused_Stroke); fill(colorButtonFocused_Fill); } 
    else                 { stroke(colorButtonDefault_Stroke); fill(colorButtonDefault_Fill); }
    if( ! borderVisible ) noStroke();   
    rect(x, y, w, h);

    if ( labelVisible ){
      if      ( isPressed ) fill( colorLabelPressed_Fill ); 
      else if ( isFocused ) fill( colorLabelFocused_Fill ); 
      else                  fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
    }
  } // end void build
  
} // end class GUI_Switch





















/*
  ------------------------------------------------------------
  GUI_CheckBox -  by Thomas Diewald
  16..07.2010
  Version 1.4
  ------------------------------------------------------------
*/

class GUI_CheckBox extends GUI_Control{

   
  GUI_CheckBox(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    g.addControl(this);
    controlType = "switch";
  }
  
  GUI_CheckBox(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    g.addControl(this);
    controlType = "switch";
  }
  
  void controlReleased(String mouseEvent){
     wasTriggered = false; isPressed = false;
     if( mouseEvent.equals("mouseReleased") && isFocused(mouseX, mouseY ) ){ wasTriggered = true;    isActive = isActive ? false : true; } // end if
     if( mouseEvent.equals("mousePressed") )                                 isPressed    = true;
  } // end  void controlReleased(String mouseEvent){
  
    
  void build(){
    strokeWeight(1);
    if      ( isPressed || isActive){ stroke(colorButtonPressed_Stroke); fill(colorButtonPressed_Fill); } 
    else if ( isFocused ){ stroke(colorButtonFocused_Stroke); fill(colorButtonFocused_Fill); } 
    else                 { stroke(colorButtonDefault_Stroke); fill(colorButtonDefault_Fill); }
    if( ! borderVisible ) noStroke();   
    rect(x, y, w, h);

    if( isActive ){
      stroke(colorButtonDefault_Stroke);
      //stroke(colorButtonDefault_Fill);
      float o = 3;
      line( x+o, y+o, x+w-o, y+h-o);
      line( x+w-o, y+o, x+o, y+h-o);
      
    }
    
    if ( labelVisible ){
      if      ( isPressed ) fill( colorLabelPressed_Fill ); 
      else if ( isFocused ) fill( colorLabelFocused_Fill ); 
      else                  fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
    }
  } // end void build
  

} // end class GUI_CheckBox

















/*
  ------------------------------------------------------------
  GUI_RadioButton -  by Thomas Diewald
  16..07.2010
  Version 1.4
  ------------------------------------------------------------
*/

class GUI_RadioButton extends GUI_Control{

   
  GUI_RadioButton(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    g.addControl(this);
    controlType = "switch";
  }
  
  GUI_RadioButton(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    g.addControl(this);
    controlType = "switch";
  }
  
  void controlReleased(String mouseEvent){
     wasTriggered = false; isPressed = false;
     if( mouseEvent.equals("mouseReleased") && isFocused(mouseX, mouseY ) ){ wasTriggered = true;    isActive = isActive ? false : true; } // end if
     if( mouseEvent.equals("mousePressed") )                                 isPressed    = true;
  } // end  void controlReleased(String mouseEvent){
  
    
  void build(){
    strokeWeight(1);
    if      ( isPressed || isActive){ stroke(colorButtonPressed_Stroke); fill(colorButtonPressed_Fill); } 
    else if ( isFocused ){ stroke(colorButtonFocused_Stroke); fill(colorButtonFocused_Fill); } 
    else                 { stroke(colorButtonDefault_Stroke); fill(colorButtonDefault_Fill); }
    if( ! borderVisible ) noStroke();   
    //rect(x, y, w, h);
    ellipse(x+w/2, y+h/2, w, h);

    if( isActive ){
      stroke(colorButtonDefault_Stroke);
      //fill(colorButtonDefault_Fill);
      float o = 5;
      ellipse(x+w/2, y+h/2, w-o, h-o);
      
    }
    
    if ( labelVisible ){
      if      ( isPressed ) fill( colorLabelPressed_Fill ); 
      else if ( isFocused ) fill( colorLabelFocused_Fill ); 
      else                  fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
    }
  } // end void build
  
} // end class GUI_RadioButton







/*
  ------------------------------------------------------------
  GUI_TextDisplay -  by Thomas Diewald
  29.07.2010
  Version 1.4
  ------------------------------------------------------------
*/

class GUI_TextDisplay extends GUI_Control{
  String methodNameToInvoke = "";
  boolean getLabelFromMethod = false;
   
  GUI_TextDisplay(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    g.addControl(this);
    controlType = "switch";
  }
  
  GUI_TextDisplay(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    g.addControl(this);
    controlType = "switch";
  }
   
   


  
  void setMethodNameToInvoke(String methodNameToInvoke){
    this.methodNameToInvoke = methodNameToInvoke;
    getLabelFromMethod = true;
  } 
  String getMethodNameToInvoke(){
    return methodNameToInvoke;
  }
    
  void build(){   
    if( getLabelFromMethod  ) {
      try {
        Class class_P5 = p.getClass();
        Method method_P5 = class_P5.getDeclaredMethod( methodNameToInvoke );
  
        if ( method_P5.getReturnType().getSimpleName().equals("String") ) 
          label = method_P5.invoke( p ).toString() ;
      } catch (NoSuchMethodException e)     { println(e); }
        catch (IllegalAccessException e)    { println(e); }
        catch (InvocationTargetException e) { println(e); }
    } // end ifif( getLabelFromMethod  ) {
    refreshLabelAlign();
    if ( labelVisible ){
      fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
    }
  } // end void build
  
  

} // end class GUI_TextDisplay






























/*
  ------------------------------------------------------------
  GUI_TextField -  by Thomas Diewald
  19.08.2010
  Version 1.0
  ------------------------------------------------------------
*/


class GUI_TextField extends GUI_Control{

  String userText = "";
  String textFieldValue = "";
  int charIndexInText_start, charIndexInText_end, charIndexInText_drag;
  float cursorPosX_selectionStart = 0; 
  float cursorPosX_selectionEnd = 0; 
    
  float textPosX, textPosY;
  boolean mPressed = false;
   
  GUI_TextField(GUI g, int id, String label, float x, float y, float w, float h, PFont font){
    super (g, id, label, x, y, w, h, font);
    controlType = "textField";
  }
  
  GUI_TextField(GUI g, int id, String label, float x, float y, float w, float h){
    super (g, id, label, x, y, w, h);
    controlType = "textField";
  }
  
   void controlReleased(String mouseEvent){
     wasTriggered = false; isPressed = false;
     if( mouseEvent.equals("mouseReleased") ){ wasTriggered = true;    isActive = isActive ? true : true; } 
     if( mouseEvent.equals("mousePressed")  )  isPressed    = true;
     
     
     if( mouseEvent.equals("mousePressed") && !mPressed) {
       mPressed = true;
       charIndexInText_start      = getCharIndexInText( userText, textPosX, mouseX );
       cursorPosX_selectionStart  =  setCursorPosition( userText, textPosX, charIndexInText_start );
     }
     if( mouseEvent.equals("mouseReleased") ) {
       mPressed = false;
       charIndexInText_end      = getCharIndexInText( userText, textPosX, mouseX );
       cursorPosX_selectionEnd  =  setCursorPosition( userText, textPosX, charIndexInText_end );
      
       if (charIndexInText_start > charIndexInText_end){
         int tmp = charIndexInText_start;
         charIndexInText_start = charIndexInText_end;
         charIndexInText_end = tmp;
       }
     }
  } // end  void controlReleased(String mouseEvent){
  
    
    
   
  
  void setUserText( String userText ){ 
    this.userText  = userText;
    charIndexInText_end = charIndexInText_start = userText.length(); 
    updateTextFieldValue();
  }
  
  void updateTextFieldValue(){
    textFieldValue = userText;
  }
  
  String getTextFieldValue(){
    return textFieldValue;
  }
  
  String getTextFieldValueTemp(){
    return userText;
  }
  
    
  void build(){
    strokeWeight(1);
    if      ( isPressed || isActive){ stroke(colorButtonPressed_Stroke); fill(240); } 
    else if ( isFocused ){ stroke(colorButtonFocused_Stroke); fill(210); } 
    else                 { stroke(colorButtonDefault_Stroke); fill(210); }
    if( ! borderVisible ) noStroke();   
    rect(x, y, w, h);
    
    textPosX = x + 3;
    textPosY = y + labelSize+0;    
    
    float cursorPosX = setCursorPosition( userText, textPosX, charIndexInText_start );
    float cursorPosY1 = textPosY - textAscent()  - 0;
    float cursorPosY2 = textPosY + textDescent() + 1;
    
    if( mPressed ){
      charIndexInText_drag    = getCharIndexInText( userText, textPosX, mouseX );
      cursorPosX              = setCursorPosition ( userText, textPosX, charIndexInText_drag );
      cursorPosX_selectionEnd = cursorPosX;
    } //else textIsSelected = false;
    
    // draw selection
    if ( cursorPosX_selectionStart != cursorPosX_selectionEnd ){
      rectMode(CORNERS) ;
      fill(180); noStroke();
      rect(cursorPosX_selectionEnd, cursorPosY1, cursorPosX_selectionStart , cursorPosY2);
      rectMode(CORNER) ;
    }
    
    // draw text
    fill(0);
    textAlign(LEFT); textFont(font);
    text ( userText, textPosX, textPosY);
  
    // draw cursor
    if( frameCount/15 % 2 == 0 && isActive){
      stroke(0);
      line(cursorPosX, cursorPosY1, cursorPosX, cursorPosY2);
    }
    
    
    if ( labelVisible ){
      if      ( isPressed ) fill( colorLabelPressed_Fill ); 
      else if ( isFocused ) fill( colorLabelFocused_Fill ); 
      else                  fill( colorLabelDefault_Fill );
      textAlign(LEFT); textFont(font);
      text(label, labelXposition, labelYposition);
    }
    
  } // end void build
  
  
  
  
  
  void resetTextFieldSelection(){
    cursorPosX_selectionStart = cursorPosX_selectionEnd = setCursorPosition( userText, textPosX, charIndexInText_start );
  }
  
  
  
  private float setCursorPosition(String txtOrig, float txtPosX, int  charIndex ){
    textFont(font);
    String textUntilCursorPosition = txtOrig.substring(0, charIndex);
    return (txtPosX + textWidth( textUntilCursorPosition ) );
  } // end float[] getCursorPositionInText(String txtOrig, float txtPosX, float txtPosY, float txtLineHeight, int charIndex )




  int getCharIndexInText(String txtOrig, float txtPosX, float cursorPositionX ){
    textFont(font);

    String charsInLine = "";
    float minDisX = abs(txtPosX - cursorPositionX);
    int charIndexInLine = 0;
    for(int i = 0; i < txtOrig.length(); i++){
      charsInLine += txtOrig.charAt(i);
      float dis = abs(txtPosX + textWidth(charsInLine) - cursorPositionX);
      if( dis < minDisX){
        minDisX = dis;
        charIndexInLine = i+1;
      } // end if
    } // end for i
    return charIndexInLine;
  } // end int getCharIndexInText(String txtOrig, float txtPosX,  PFont txtFont, float txtFontSize, float cursorPositionX )

  
  
  
  
  void keyPressed(){
    
    if ( !(key == CODED || key == BACKSPACE || key == ENTER || key == RETURN || key == TAB || key == DELETE) && int(key) < 128){
        userText = userText.substring(0, charIndexInText_start) + userText.substring(charIndexInText_end);
        userText = userText.substring(0, charIndexInText_start) + str(key) +userText.substring(charIndexInText_start);
        charIndexInText_end = ++charIndexInText_start; 
    }
    /*
    if( key == ENTER || key == RETURN){
        userText = userText.substring(0, charIndexInText_start) + userText.substring(charIndexInText_end);
        userText = userText.substring(0, charIndexInText_start) + str(key) + userText.substring(charIndexInText_start);
        charIndexInText_end = ++charIndexInText_start; 
    }
    */
    if (key == BACKSPACE) {   
      if( charIndexInText_start != charIndexInText_end ){ // text is selected
        userText = userText.substring(0, charIndexInText_start) + userText.substring(charIndexInText_end);
        charIndexInText_end = charIndexInText_start; 
      } else if (charIndexInText_start > 0) {
        userText = userText.substring(0, charIndexInText_start-1) + userText.substring(charIndexInText_start);
        charIndexInText_end = --charIndexInText_start; 
      } // end if
  
    }
    if( key == DELETE){
      if( charIndexInText_start != charIndexInText_end ){  // text is selected
        userText = userText.substring(0, charIndexInText_start) + userText.substring(charIndexInText_end);
        charIndexInText_end = charIndexInText_start; 
      } else if( charIndexInText_start < userText.length() ){
        userText = userText.substring(0, charIndexInText_start) + userText.substring(charIndexInText_end+1);
      } 
    }
    
    if( keyCode == LEFT)  charIndexInText_start = charIndexInText_end = (charIndexInText_start <= 0 )                 ? 0                 : charIndexInText_start-1;
    if( keyCode == RIGHT) charIndexInText_start = charIndexInText_end = (charIndexInText_start >= userText.length() ) ? userText.length() : charIndexInText_start+1;
  
    cursorPosX_selectionEnd = cursorPosX_selectionStart;
    //println(" --- on key: charindex = "+ charIndexInText_start);
  } // end void keyPressed()
  
  
} // end class GUI_TextField







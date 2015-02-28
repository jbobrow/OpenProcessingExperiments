
/**
Based on Handle class: draw a circle than can be dragged with the mouse.
by Philippe Lhoste <PhiLho(a)GMX.net> http://Phi.Lho.free.fr & http://PhiLho.deviantART.com
Copyright notice: For details, see the following file:
http://Phi.Lho.free.fr/softwares/PhiLhoSoft/PhiLhoSoftLicense.txt
This program is distributed under the zlib/libpng license.
Copyright (c) 2008-2010 Philippe Lhoste / PhiLhoSoft
*/

public class Button
{
  float bDestX, bDestY;                               // Destination Position of button
  float bActX, bActY;                                 // Actual Position of button  
  float bParentX, bParentY;                           // Position of parent button
  int bSize;                                          // Diameter of handle
  int bLineWidth;
  color bColorLine;
  color bColorFill;
  color bColorHover;
  color bColorDrag;
  String bColorName;
  int bGotoState;
  String bImage;
  int bAlphaVal = 10;                                 // initial value
  int alphaDelta = 30;                                // rate of change

  private boolean bOver = false;
  private boolean bPressed = false;
  private boolean bReleased = false;
  private boolean bDragged = false;
  private float bClickDX, m_clickDY;
  private int frameCounter;

  //---------------------------------------------------- Simple constructor with hopefully sensible defaults.
   
  Button(float x, float y)
  {
    this("name", 0, x, y, x, y, 5, 1, #000000, #FFFFFF, #FFFF00, #FF8800, "a.png");
  }

  //---------------------------------------------------- Full constructor.
  Button(String name, int bGotoState, float x, float y, float parentX, float parentY,int size, int lineWidth,
         color colorLine, color colorFill, color colorHover, color colorDrag, String file)
   {
    bDestX = x; bDestY = y;
    bParentX=parentX;
    bParentY=parentY;
    bSize = size;
    bLineWidth = lineWidth;
    bColorLine = colorLine;
    bColorFill = colorFill;
    bColorHover = colorHover;
    bColorDrag = colorDrag;
    bColorName=name;
    this.bGotoState=bGotoState;
    this.bImage=file;
    this.bActX = width/2;
    this.bActY = height/2;
  }

  //---------------------------------------------------- MOUSEVENT
  void mouseEvent(MouseEvent event){
    if (dist(mouseX,mouseY,this.bDestX,this.bDestY)<=bSize/2){ 
      bOver = true;
      switch(event.getID()){
      case MouseEvent.MOUSE_PRESSED:
        bPressed = true;
        bDragged = false;
        if(frameCounter==0) frameCounter = frameCount;
        break;
      case MouseEvent.MOUSE_DRAGGED:
       {
         bDragged = true; 
         bDestX = mouseX;
         bDestY = mouseY;
       }
       break;
      
      case MouseEvent.MOUSE_RELEASED:
         bPressed = false;
         bDragged = false;
         bOver=false;
        if(frameCount-frameCounter<=5) {
        bReleased = true;
        appState = bGotoState;
        somethingChanged=true;
        }
        frameCounter=0;
      break;
      }
    }
    else {
      bOver = false;
      bPressed = false;
      bReleased = false;
      somethingChanged=false;
    }
  }

  public void draw() {
    //---------------------------------------------------- <EASING>
    if((bActX>=bDestX+5)||(bActX<=bDestX-5)) bActX=lerp(bActX, bDestX, 0.5);else bActX=bDestX;
    if((bActY>=bDestY+5)||(bActY<=bDestY-5)) bActY=lerp(bActY, bDestY, 0.5);else bActY=bDestY;
    //---------------------------------------------------- </EASING>
    
    //---------------------------------------------------- <LINK>
    strokeWeight(bLineWidth/2);
    stroke(bColorLine);
    noFill();
    bezier(bParentX,bParentY, bActX+(width/2-bActX), height/2,  bActX-(width/2-bActX), height/2, bActX,bActY);
    //---------------------------------------------------- </LINK>
    
    noStroke();
    pushMatrix();
      translate(bActX,bActY);
      if (bDragged)
        {fill(bColorDrag); bAlphaVal=0;}
      else
        if (bPressed)
          {if(bAlphaVal<=255) bAlphaVal+= alphaDelta;}
        else
          {fill(bColorFill);if(this.bAlphaVal>=0) this.bAlphaVal-= this.alphaDelta;}
      
    //---------------------------------------------------- <SHOW TEXT>
      if(bAlphaVal!=0) {
        fill(bColorFill,bAlphaVal);
        rect(-bSize*0.7,-bSize*0.85,bSize*1.4,bSize*0.3);
        fill(bColorLine,bAlphaVal);
        textFont(font, 24); 
        text(bColorName, -bSize*0.65, -bSize*0.8, bSize*1.5, bSize*0.65);
        }
    //---------------------------------------------------- </SHOW TEXT>
      buttonImage = loadImage(bImage);
      image(buttonImage, -(bSize/2), -(bSize/2), bSize, bSize);
    popMatrix();
  }
}

class ButtonList
{
  private ArrayList m_handles = new ArrayList();
  private boolean m_bDragging;
  private boolean m_bGroupDragging;                        // True if you want to be able to drag several objects at once

  ButtonList(){}
  ButtonList(boolean bGroupDragging){m_bGroupDragging = bGroupDragging;}
  void Add(Button h){m_handles.add(h);}
  void Clean(){for (int i = 0; i < m_handles.size(); i++)
    {unregisterMouseEvent(m_handles.get(i)); println("fatto"+i);}
    m_handles = new ArrayList();}
     
  
  void Update()
  {
    for (int i = 0; i < m_handles.size(); i++)
    {
      Button h = (Button) m_handles.get(i);
      h.draw();
      registerMouseEvent(h);
    }
  }
}



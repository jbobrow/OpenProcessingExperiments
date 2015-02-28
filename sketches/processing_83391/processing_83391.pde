
/* * * * * * * * * * * * * * * * * * * * * * * * *  
 * drawWithCustomImage 
 *
 * Cc Andres Wanner, Dec 2012
 * tested with  Processing 2.0b7, Java and Javascript Modes
 *
 * * * * * * * * * * * * * * * * * * * * * * * * *  
 */
  
 /* @pjs preload="dot_blur.png"; */ 
 	 
DrawingClass myImg;
  
//------------------------------------------------------
void setup() {
 size(800,450);  
 frameRate(120);
 background(128);
 
 smooth();
 noCursor();
  
 // set initial parameters  
 myImg = new DrawingClass(width,height);
 myImg.selectBrush("dot_blur.png");
 myImg.display();
}
//------------------------------------------------------ 
void draw() {
   
   if (abs(mouseX - pmouseX)>0) { // avoid overlap when mouse is not moved
     myImg.paint( mouseX, mouseY) ; 
     myImg.display();
   }
    
} 
//------------------------------------------------------
class DrawingClass {
  
  // set default parameters for drawing
  color paintColor = color(0,0,64);
  boolean paintDirected = false;
  boolean paintAdditive = false;
  float paintDiameter = 70;
  float paintOpacity = 96;
  
  PGraphics pg;
 
  PImage activeBrush;
  PImage alphaBrush;

  int brushWidth=int(paintDiameter); int brushHeight=int(paintDiameter);
  color lastBgColor = color(240); // stores last used background color to erase picture
   
// CONSTRUCTOR ---------------------------------------------------------
DrawingClass( int w, int h) {  
    
     selectBrush("dot_blur.png" );
     paintDiameter = activeBrush.width; 
      
     pg = createGraphics(w,h); // offscreen buffer
 
     erase(); 
  }// constructor
  
// METHODS -------------------------------------------------------------
 void selectBrush(String _brush) {
     activeBrush=loadImage(_brush); 
     brushWidth = activeBrush.width; brushHeight = activeBrush.height;
     renderAlphaBrush();
  }

//-----------------------------------------------------------------------
  void paint( int x, int y  ) {
    if (paintDirected) { renderAlphaBrush(); }
      pg.beginDraw(); 
        if (paintAdditive) {  
         pg.blend(alphaBrush, 0, 0, brushWidth, brushHeight, int(x-paintDiameter/2), int(y-paintDiameter/2), int(paintDiameter), int(paintDiameter), ADD);    
        } else {  
         pg.blend(alphaBrush, 0, 0, brushWidth, brushHeight, int(x-paintDiameter/2), int(y-paintDiameter/2), int(paintDiameter), int(paintDiameter), SUBTRACT);      
        }
     pg.endDraw();
  }// paint 

//------------------------------------------------------------------
  void display() {
    image(pg,0,0);
  }
  
//------------------------------------------------------------------
  void erase() {
    erase(lastBgColor); // uses the same colour that was used last time
  }
  void erase(color eraseColor) {
     pg.beginDraw();
     pg.background(eraseColor);
     pg.endDraw();
     lastBgColor = eraseColor;  
  } 
  
//-----------------------------------------------------------------------  
  void renderAlphaBrush() { 
    // create a semi-opaque, coloured version of activeBrush, store it in alhaBrush
     PImage ptemp = activeBrush;  
     ptemp.filter(INVERT);
     
     float rotAngle=0;
     PGraphics pt;
     pt=createGraphics(brushWidth, brushHeight);
     pt.beginDraw();
         if (paintAdditive) {
            pt.tint(paintColor, paintOpacity);
          } else {
            color inversePaintColor= color(255-red(paintColor), 255-green(paintColor), 255-blue(paintColor));
            pt.tint(inversePaintColor, paintOpacity);
          } 
          
          if (paintDirected) {
             rotAngle = atan2(float(pmouseY-mouseY),float(pmouseX-mouseX));
          } else { // brush is not tilted
             rotAngle = 0;
          } 
        
          pt.translate(pt.width/2, pt.height/2);
           pt.rotate(rotAngle);
            pt.image(ptemp, -ptemp.width/2, -ptemp.height/2, ptemp.width, ptemp.height);
           pt.rotate(-rotAngle);
          pt.translate(-pt.width/2, -pt.height/2);
     
       pt.tint(255);
     pt.endDraw();
       
     alphaBrush=pt;
     ptemp.filter(INVERT);
  } // renderAlphaBrush()

//-----------------------------------------------------------------------  
  void setAdditive() {
     paintAdditive=true;
     renderAlphaBrush() ;
  }
  void setSubtractive() {
     paintAdditive=false;
     renderAlphaBrush() ;
  }
//-----------------------------------------------------------------------  

}  // end Drawingclass
 
 




import controlP5.*;
ControlP5 controlP5;
 
/*Right Rect Starting Dimensions*/
public int MyrectWidth = 20;
public int MyrectHeight = 20;
 
/*Right Rect Starting Color*/
public int MyrectR = 20;
public int MyrectG = 20;
public int My1r = 20;
public int My1g = 20;
public int My1b = 20;
public int My2r = 20;
public int My2g = 20;
public int My2b = 20;
public int My3r = 20;
public int My3g = 20;
public int My3b = 20;
public int bg = 20;
 
void setup() {
  size(500,500);
   
  /* new instance of ControlP5 */
  controlP5 = new ControlP5(this);
   
  /* add 5 controllers and give each of them a unique id. */
  controlP5.addSlider("X [0/200]",0,200,MyrectWidth,10,10,100,10).setId(1);
  controlP5.addSlider("Y [0/200]",0,200,MyrectHeight,10,30,100,10).setId(2);
  controlP5.addSlider("R [60/255]",60,255,MyrectR,10,50,100,10).setId(3);
  controlP5.addSlider("Disitance [0/125]",0,125,MyrectG,10,70,100,10).setId(4);
  controlP5.addSlider("My1r [0/255]",0,255,My1r,10,90,100,10).setId(5);
  controlP5.addSlider("My1g [0/255]",0,255,My1g,10,110,100,10).setId(6);
  controlP5.addSlider("My1b [0/255]",0,255,My1b,10,130,100,10).setId(7);
  controlP5.addSlider("My2r [0/255]",0,255,My2r,10,150,100,10).setId(8);
  controlP5.addSlider("My2g [0/255]",0,255,My2g,10,170,100,10).setId(9);
  controlP5.addSlider("My2b [0/255]",0,255,My2b,10,190,100,10).setId(10);
  controlP5.addSlider("My3r [0/255]",0,255,My3r,10,210,100,10).setId(11);
  controlP5.addSlider("My3g [0/255]",0,255,My3g,10,230,100,10).setId(12);
  controlP5.addSlider("My3b [0/255]",0,255,My3b,10,250,100,10).setId(13);
  controlP5.addSlider("Background [0/255]",0,255,bg,10,270,100,10).setId(14);
  
}
 
void draw() {
  noStroke();
  background(bg);
  fill(My1r,My1g,My1b);
  polygon(50+MyrectWidth, 250+MyrectHeight, MyrectR);
  fill(My2r,My2g,My2b);
  polygon2(50+MyrectWidth, 250+MyrectHeight, MyrectR);
  fill(My3r,My3g,My3b);  
  polygon(50+MyrectWidth + MyrectG, 250+MyrectHeight -sqrt(3)*MyrectG, MyrectR);
  
  fill(255,255,255);
  polygon3(50+MyrectWidth, 250+MyrectHeight, MyrectR);
}
 
void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to
     the controlEvent method; by checking the id of a controller one can distinguish
     which of the controllers has been changed.*/
      
  switch(theEvent.controller().id()) {
    case(1):
    /* controller numberbox1 with id 1 */
    MyrectWidth = (int)(theEvent.controller().value());
    break;
    case(2):
    /* controller slider1 with id 2 */
    MyrectHeight = (int)(theEvent.controller().value());
    break;
   case(3):
    /* controller slider1 with id 3 */
    MyrectR = (int)(theEvent.controller().value());
    break; 
   case(4):
    /* controller slider1 with id 4 */
    MyrectG = (int)(theEvent.controller().value());
    break; 
   case(5):
    /* controller slider1 with id 5 */
    My1r = (int)(theEvent.controller().value());
    break;
   case(6):
    /* controller slider1 with id 5 */
    My1g = (int)(theEvent.controller().value());
    break;
   case(7):
    /* controller slider1 with id 5 */
    My1b = (int)(theEvent.controller().value());
    break;
   case(8):
    /* controller slider1 with id 5 */
    My2r = (int)(theEvent.controller().value());
    break;
   case(9):
    /* controller slider1 with id 5 */
    My2g = (int)(theEvent.controller().value());
    break;
   case(10):
    /* controller slider1 with id 5 */
    My2b = (int)(theEvent.controller().value());
    break;
   case(11):
    /* controller slider1 with id 5 */
    My3r = (int)(theEvent.controller().value());
    break;
   case(12):
    /* controller slider1 with id 5 */
    My3g = (int)(theEvent.controller().value());
    break;
    case(13):
    /* controller slider1 with id 5 */
    My3b = (int)(theEvent.controller().value());
    break;
    case(14):
    /* controller slider1 with id 5 */
    bg = (int)(theEvent.controller().value());
    break;
    
  }
}





void polygon(float tx, float ty, float r)
{
  triangle(tx,ty,tx+r,ty,tx+r/2,ty-sqrt(3)*r/2);

}

void polygon2(float tx, float ty, float r)
{
  triangle(tx+r,ty, tx+r+MyrectG, ty-sqrt(3)*MyrectG , -MyrectG+tx+r ,ty-sqrt(3)*MyrectG );

}

void polygon3(float tx, float ty, float r)
{
  triangle(-MyrectG+tx+r, ty-sqrt(3)*MyrectG, tx+r/2  ,ty-sqrt(3)*r/2  ,tx+MyrectG  ,ty-sqrt(3)*MyrectG  );

}



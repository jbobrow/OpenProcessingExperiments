
 /*Import the control lib*/
/*http://www.sojamo.de/libraries/controlP5/*/
 
import controlP5.*;
ControlP5 controlP5;
 

public int x1 = 0;
public int y1 = 0;
public int x2 = 0;
public int y2 = 0;
public int x3 = 0;
public int y3 = 0;
public int x4 = 0;
public int y4 = 0;

PImage webImg;
 
void setup() {
    size(1000,1000);
    String url = "http://eastlifecoaching.com/wp-content/uploads/2013/10/clouds.jpg";
    // Load image from a web server
    webImg = loadImage(url, "jpg");
   
  /* new instance of ControlP5 */
  controlP5 = new ControlP5(this);
   
  /* add 5 controllers and give each of them a unique id. */
  controlP5.addSlider("x1 [10/220]",10,220,x1,100,10,100,10).setId(1);
  controlP5.addSlider("x2 [10/180]",10,180,y1,100,30,100,10).setId(2);
  controlP5.addSlider("x3 [0/255]",50,255,x2,100,50,100,10).setId(3);
  controlP5.addSlider("x4 [0/255]",50,255,y2,100,70,100,10).setId(4);
  controlP5.addSlider("y1 [0/255]",50,255,x3,100,90,100,10).setId(5);
  controlP5.addSlider("y2 [0/255]",50,255,y3,100,110,100,10).setId(6);
  controlP5.addSlider("y3 [0/255]",50,255,x4,100,130,100,10).setId(7);
  controlP5.addSlider("y4 [0/255]",100,255,y4,100,150,100,10).setId(8);
}
 
void draw() {
  background(255);
  image(webImg, 0, 0);
  noFill();
  stroke(255);
 vertex(x4,-y4);
 vertex(x1,-y1);
 vertex(x2,-y2);
 vertex(x3,-y3);
 vertex(-x4,y4);
 vertex(-x3,y3);
 vertex(-x2,-y2);
 vertex(-x1,-y1);



  // etc1
  endShape(CLOSE);
  
}
 
void controlEvent(ControlEvent theEvent) {
  /* events triggered by controllers are automatically forwarded to
     the controlEvent method; by checking the id of a controller one can distinguish
     which of the controllers has been changed.*/
      
  switch(theEvent.controller().id()) {
    case(1):
    /* controller numberbox1 with id 1 */
    x1 = (int)(theEvent.controller().value());
    break;
    case(2):
    /* controller slider1 with id 2 */
    y1 = (int)(theEvent.controller().value());
    break;
   case(3):
    /* controller slider1 with id 3 */
    x2 = (int)(theEvent.controller().value());
    break; 
   case(4):
    /* controller slider1 with id 4 */
    y2 = (int)(theEvent.controller().value());
    break; 
   case(5):
    /* controller slider1 with id 5 */
    x3 = (int)(theEvent.controller().value());
    break;  
   case(6):
    /* controller slider1 with id 6 */
    y3 = (int)(theEvent.controller().value());
    break;  
   case(7):
    /* controller slider1 with id 7 */
    x4 = (int)(theEvent.controller().value());
    break;  
   case(8):
    /* controller slider1 with id 8 */
    y4 = (int)(theEvent.controller().value());
    break;  
  }
}




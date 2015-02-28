
import processing.video.*;
 
Capture camara ;
 
void setup (){
  size (640, 480) ;
  frameRate (10000) ;
  camara = new Capture(this, 640, 480) ;
}
 
void draw (){
  camara .read();
 tint (108, 234,287, 3) ;
  image (camara, 0, 0) ;
   

   

 
  
}



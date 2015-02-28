
import processing.video.*;

Capture cam;

void setup ()
{
  size (640, 480) ;
  frameRate (20) ;
  cam = new Capture(this, 640, 480) ;
}

void draw (){
  cam .read(); 
  tint (108, 234,287, 3) ;
  image (cam, 0, 0) ; 
  
  tint (108, 237, 165, 3) ;
  image (cam, 25, 25) ;
  
  tint (144,237, 108, 3) ;
  image (cam, 50, 50) ;
  
  tint (234, 237, 108, 3) ;
  image (cam, 100, 100) ;
  
  tint (63,173,67, 3) ;
  image (cam, 150, 150) ;
   
  tint (108, 234,287, 3) ;
  image (cam, 640, 480) ; 
  
  tint (108, 237, 165, 3) ;
  image (cam, 615, 455) ;
  
  tint (144,237, 108, 3) ;
  image (cam, 590, 430) ;
  
  tint (234, 237, 108, 3) ;
  image (cam, 540, 380) ;
  
  tint (63,173,67, 3) ;
  image (cam, 490, 330) ;
  
  tint (112,203,76, 3) ;
  image (cam, 500, 340) ;
  
  tint (148,203,76, 3) ;
  image (cam, 460, 300) ;
  
  tint (192, 203,76, 3) ;
  image (cam, 420, 260) ;
  
  tint (203, 183, 76, 3) ;
  image (cam, 380, 220) ;
  
  tint (203, 155, 76, 3) ;
  image (cam , 340, 180) ;
  
  tint (201, 131, 77, 3) ;
  image (cam, 300, 170) ;
  
  
  stroke (177,216,186) ;
  strokeWeight (.1) ;
  smooth () ;
  line (0, random(640), 640, random(640)) ;
  delay (500) ;
 
}


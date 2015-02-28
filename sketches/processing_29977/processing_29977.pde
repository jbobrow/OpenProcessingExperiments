
/*
 * Finger detection class.
 * (c) Antonio Molinaro 2011 
 * http://code.google.com/p/blobscanner/.
 */

class FingerDetector{
  PImage out;
  int w,h;
  
  public FingerDetector(int _w, int _h){
  w = _w;
  h = _h;  
  out = createImage(w, h, RGB);
}
  
  void setImage(PImage img){
    out.loadPixels();
     
 
        for(int k = 0; k <img.pixels.length; k++){
        out.pixels[k] = img.pixels[k];
      }
 
    out.updatePixels();
  }
  
//  PImage getImage(){
//    return out;
//  }
  
  boolean goodPixel(int x, int y){
    
  int count_white = 0;
  
  //Finger's tip model . 
  float r =  120 /TWO_PI;
  
  //The farest  the hand is placed from the webcam 
  //the smallest this needs to be set.
  int finger_size = 8 ; 
  
  //For each pixels on the circumference
  //with radius 120/2*pi and with center 
  //located at x,y (current pixel's coordinate)...
  for(int k = 0; k < 360; k+=10){
    int x1 =  x + (int)(r*cos(k));
    int y1 =  y + (int)(r*sin(k));
 
    if(x1  >= 0 && x1  < out.width && y1  >= 0 && y1  < out.height)
    
    //...count how many are hand pixel... 
    if(brightness((out.pixels[x1+y1*out.width]&0xff0000)>>16)== 255){count_white++;}
  }
   
  //..if they are in the finger's tip region...  
  if( count_white < finger_size  && count_white != 0) return true; //...at x y coordinate we have a finger's tip pixel 
  else
  return false;
  
}
}


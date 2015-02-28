
class Button{
  int x,y;  //coordinates
  int dim;  //dimension
  
  String source;  //icon
  String sourceP;  //icon for pressed button
  PImage im;
  boolean press; 
  
  Button(int x, int y, int dim, String source, String sourceP, boolean press){
    this.x = x;
    this.y = y;
    this.dim = dim;
    
    //source images for buttons
    this.source = source;
    this.sourceP = sourceP;
    this.press = press;
  }
  
  //pointer detection
  boolean over(int mx,int my){
    if((mx >= x) && (mx <= x+dim) &&
      (my >= y) && (my <= y+dim)){
      return true;
    }else{
      return false;
    }
  }
  
  //button images loaded from "data"
  void display(){
    if(!press){
      this.im = loadImage(source);
    }else
    if(press){
      this.im = loadImage(sourceP);
    }
    image(im,x,y);
  }
  
  void pressButton(){
      this.press = !press;
  }
  
}


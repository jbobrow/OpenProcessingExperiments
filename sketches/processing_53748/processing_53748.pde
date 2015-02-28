
class Feeling {
  
  float x;
  float y;
  float w;
  float h;
//  float endX;
//  float endY; 
//  float offsetY;
  String feelingName;
 
  
  Feeling(String feelingName_, float x_, float y_, float w_, float h_) {
    feelingName = feelingName_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
//    endX = x_;
//    endY = y_;
  }
    
  void display(float w){
    fill(feelingFill);
    noStroke();
    rect(x,y,w,h);
    
    textFont(feelingTitle);
    text(feelingName,x+w+5,y+h-h/3);

  }

}


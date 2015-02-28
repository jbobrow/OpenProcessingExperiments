
class Column {
  
  //declare variables
  int id;
  float x;
  float y;
  float endX;
  float endY;
  float w; 
  float h;
  String name;
  color lgray = color (150);

  //constructor
   Column (int id_, String name_, float x_, float y_, float w_, float h_) {
     id = id_;
     x = x_;
     y = y_;
     w = w_;
     h = h_;
  
     
     name = name_;
  //   lgray = lgray_;
     
     endX = x_;
     endY = y_;
   }
  
  void display () { 
    
    x = x +(endX-x) *damping;
    y = y +(endY-y) *damping;
    
    
 //   colorMode (HSB);
    fill (lgray);
    noStroke ();
   // rectMode (CENTER);
    rect (x, y, w, h);
  //  textFont(caption);
  //  textSize (15);
  //  text(name,x-w/2,y+h/2+20);
  
  
  textFont(caption);
  text(name, x, y - 20);
    
  }
  
  //void position (float x_, float y_) {
    
   // endX = x_;
   // endY = y_;
    
    void position (float x_) {
      endX = x_;
    
  }
}


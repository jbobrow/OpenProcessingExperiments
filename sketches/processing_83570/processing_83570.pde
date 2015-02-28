
ArrayList rects = new ArrayList();  

void setup () { 
  size(600,400); 
  
  rects.add(new Rectangle(100,20,40,30)); 
  rects.add(new Rectangle(300,100,60,100)); 
}
void draw() { 
  background(0);
  for(int i = 0; i<rects.size(); i++) { 
    Rectangle r = (Rectangle)rects.get(i); 
    if(r.isMouseOver()) {
      fill(255,0,0); 
    } else { 
      fill(255,255,255); 
    }
    
    r.drawRect();
  }

}

class Rectangle { 
  
  float x, y, w, h; 
  
  Rectangle(float xpos, float ypos, float rectwidth, float rectheight) { 
    x = xpos; 
    y = ypos; 
    w = rectwidth; 
    h = rectheight; 
   
  } 
  
  void drawRect() {
    rect(x,y,w,h); 
  }
  
  boolean isMouseOver() { 
    
     if((mouseX>x) && (mouseX<x+w) && (mouseY>y) && (mouseY<y+h)) {
       return true; 
     } else { 
       return false; 
     }
  }
  
}

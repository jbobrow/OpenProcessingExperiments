
//varies in size depending on distance from mouse
class Thing {
  float x, y, size, drawSize;

  Thing(float _x, float _y) {
    size = 1;
    x = _x;
    y = _y;
  }
  
  void draw(){
   size = (map(dist(x,y,mouseX,mouseY), 0, sqrt(width * width + height * height), 3 ,0));
   drawSize = size * size * size * size;
   ellipse(x,y,drawSize,drawSize);
    
  }
  
}



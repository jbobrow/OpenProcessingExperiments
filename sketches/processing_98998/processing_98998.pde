
Rects[] rects;
int numOfRects = 10;
int Width = 0;
float angle = 0;
float range = HALF_PI;
//////////////////////////
void setup(){
 size(1200, 400);
 smooth();
 background(255);
 
 int i = 0;
 Width = width / numOfRects;
 range = range / numOfRects;
 rects = new Rects[numOfRects];

 rects[i] = new Rects(i, Width, angle);
 rects[i].drawRect();
 angle += range;
 
 for(i = 1; i < numOfRects; i++){
   
   angle += range;
   rects[i] = new Rects(i, Width, angle);
   rects[i].drawRect();
   
 }
 
}

void draw(){
  renderTabs();
}

//////////////////////////////
class Rects{
  int index;
  float Width, x1, y1, Height, angle;
  
  
  Rects(int _index, float _Width, float _angle){
    index = _index;
    Width = _Width;
    Height = height;
    x1 = index * Width;
    y1 = 0;
    angle = _angle;
  }
  
  void drawRect(){
    stroke(0);
    fill(255*sin(angle));
    rect(x1, y1, Width, Height);
    return;
  }
  
  void drawNewRect(){
    
    stroke(0);
    if (mousePressed == true && mouseX > x1 && mouseX < x1 + Width) {
      fill(255,255*sin(angle),0);
    } else {
      fill(255*sin(angle));
    }

    rect(x1, y1, Width, Height);
    return;
  }
  
  
}
/////////////////////////////
void renderTabs(){
  int i = 0;
  
 rects[i].drawNewRect();
 
 for(i = 1; i < numOfRects; i++){
   rects[i].drawNewRect();
  }
}



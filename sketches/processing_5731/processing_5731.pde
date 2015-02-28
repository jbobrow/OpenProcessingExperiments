

class Segment{
  
  float x;
  float y;
  float x2;
  float y2;
  float a;
  int num;
  float m = millis();

  Segment(float x, float y, float x2, float y2, float a, int num){
 
    this.x = x;
    this.y = y;
    this.x2 = x2;
    this.y2 = y2;
    this.a = a;
    this.num = num;
  }
  
  void dessin(){
  
    if (num==0){
    x2 = x+300*cos(a);
    y2 = y+300*sin(a);
    }
    
    if(num > 0){
       x = Seg[num-1].x2;
       y = Seg[num-1].y2;
    }
    
     if(num > 0){
    x2 = Seg[num-1].x2 + (300*cos(a));
    y2 = Seg[num-1].y2 + (300*sin(a));
     }
 
       //================
       //test avec vertex
       //================
       stroke (55,55,55,10);
       strokeWeight (0);
        beginShape(LINES);
        vertex(x, y);
        vertex (x2, y2);
        endShape();
        
        stroke (201, 36, 38, 120);
       strokeWeight (5);
        
        beginShape(POINTS);
        vertex(x, y);
        vertex (x2, y2);
        endShape();
  }
  
}





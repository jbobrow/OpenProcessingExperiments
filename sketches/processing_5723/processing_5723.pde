

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
    x2 = x+60*cos(a);
    y2 = y+60*sin(a);
    }
    
    if(num > 0){
       x = Seg[num-1].x2;
       y = Seg[num-1].y2;
    }
    
     if(num > 0){
    x2 = Seg[num-1].x2 + (60*cos(a));
    y2 = Seg[num-1].y2 + (60*sin(a));
     }
 
       //================
       //test avec vertex
       //================
       stroke (55,55,55,80);
       strokeWeight (8);
        beginShape(LINES);
        vertex(x, y);
        vertex (x2, y2);
        endShape();
        
        stroke (201, 36, 38, 30);
       strokeWeight (20);
        
        beginShape(POINTS);
        vertex(x, y);
        vertex (x2, y2);
        endShape();
  }
  
}





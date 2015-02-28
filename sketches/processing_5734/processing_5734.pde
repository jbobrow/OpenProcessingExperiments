

class Segment{
  
  float x;
  float y;
  float x2;
  float y2;
  float a;
  int num;
  float m = millis();
  float cor1;
  float cor2;
  float cor3;
float cor4;

  Segment(float x, float y, float x2, float y2, float a, int num, float cor1, float cor2, float cor3, float cor4){
 
    this.x = x;
    this.y = y;
    this.x2 = x2;
    this.y2 = y2;
    this.a = a;
    this.num = num;
    this.cor1 = cor1;
    this.cor2 = cor2;
    this.cor3 = cor3;
    this.cor4 = cor4;
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
       stroke (cor1,cor2,cor3,cor4);
       strokeWeight (8);
        beginShape(LINES);
        vertex(x, y);
        vertex (x2, y2);
        endShape();
        
        stroke (cor1, cor2, cor3, cor4);
       strokeWeight (20);
        
        beginShape(POINTS);
        vertex(x, y);
        vertex (x2, y2);
        endShape();
  }
  
}






//HW#7
Rects[] rects;


void setup(){
  size(1000,800);
  background(0);
  rects = new Rects[8000];
  for(int i = 0; i < rects.length; i++){
    rects[i] = new Rects(random(width), (height),random(-2000,2000),random(-2000,2000));
}
}

void draw(){
  for(int i = 0; i < rects.length; i++){
  rects[i].move();
  rects[i].displayC();
}
}
   
   
   
class Rects{
    float offX, offY, x,y, rr, thetaB;
    //constructor
    Rects(float _x, float _y,float _offX, float _offY){
  
      x = _x;
      y = _y;
      offX=_offX;
      offY=_offY;
      rr =50;
      thetaB =50;
    }
    //methods
    void move(){
      x = rr * cos(thetaB/9);
      y = rr * sin(thetaB/4);
      thetaB += 3;
    }
    void displayC(){
      fill(random(100,250),20,100);
      noStroke();
      rect(x+offX, y+offY,80,12);
     
   
    }
  }


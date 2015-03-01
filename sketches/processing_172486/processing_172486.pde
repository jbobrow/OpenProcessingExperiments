
IntroGame introgame;
void setup() {
  size(320,480,P2D);
  introgame = new IntroGame();
}

void draw() {

  introgame.draw();

}

class IntroGame {

  float x1, y1, x2, y2, x3, y3;
  float side = 100;
  float scaleTri = 12.0;
  float scaleInit = 12.0;
  float acce = 0.05;
  float angle = (TWO_PI / 6) * 2;
  
    
  void IntroGame() {
    //
  }
  
  void draw() {
    
    x1 = 0;      
    y1 = -sqrt(3)/3 * side;
    
    x2 = x1 + cos( angle ) * side;
    y2 = y1 + sin( angle ) * side;
    
    x3 = x1 + (cos(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
    y3 = y1 + (sin(atan2(y2-y1,x2-x1)-PI/3) * dist(x1,y1,x2,y2));
    
    
    pushMatrix();
    translate(width/2, height/2);  
    scale(scaleTri);
    stroke(255);
    fill(255, 204, 0);
    strokeWeight(1);
    triangle(x1, y1, x2, y2, x3, y3);
    popMatrix();
    
    
    scaleTri = scaleTri-scaleTri*acce;
    if(scaleTri<0.1) {
     scaleTri = scaleInit;
     if(acce<0.98) {
       acce = acce + acce*0.15;
     } else {
       fill(0);
       rect(0,0,width,height);
       noLoop();
     }
    } 
    
    
  }
}


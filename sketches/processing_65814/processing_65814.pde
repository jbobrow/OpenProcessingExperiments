
// Sometimes you just need to draw stripes or dotted lines from point A to point B.
// jbloit.com 2012

float x1,y1,x2,y2;

int spacing = 14;
int stripeWidth = 150;

void setup(){
  size(400,400);
  smooth();
  noStroke();
}

void draw(){
  background(66,33,11);  
  stripes( x1, y1, mouseX, mouseY, spacing, stripeWidth);
}

void mousePressed(){
  x1 = mouseX;
  y1 = mouseY;
}

  void stripes(float x1, float y1, float x2, float y2, int spacing, int stripeWidth){
    
    PVector v1 = new PVector(x1, y1);
    PVector v2 = new PVector(x2, y2);

    PVector v3 = PVector.sub(v1, v2);
    float beta = atan(v3.y/v3.x);
    float len = v3.mag();  
    int N = floor(len / (spacing * 2)) ;
    float trueSpacing = len / (N*2);
    
    pushMatrix();
    translate(v1.x, v1.y);
    
    if (x1<x2) rotate(beta); else rotate( beta - PI);
    for (int i = 0; i < N; i++){
      // hack this for different color shape...
      fill(0, 0);
      rect(i*2*trueSpacing, 0, trueSpacing, stripeWidth);
      fill(255);
      rect(i*2*trueSpacing + trueSpacing , 0, trueSpacing, stripeWidth);      
    }
    popMatrix();
  }


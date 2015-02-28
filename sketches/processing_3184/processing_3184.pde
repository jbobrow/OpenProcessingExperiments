
Pincel p;

void setup(){
  size(500, 500,P3D);
  background(0); 
  
  smooth();
  stroke(5);
  p = new Pincel();
}
void draw(){
  p.dibuja();
}
class Pincel{
  float x, y;
  float diam;
  color col;

  Pincel(){
    x = random(width);
    y = random(height);
    diam = 5;
  }

  void dibuja(){
    calc();
    fill(0);
    quad(x, y, diam/4, diam, diam*2, diam*2, diam*4, diam*4);
    
    fill(x,y,200,350);
    quad(x,y, diam/2, diam*2/y, diam*4, diam*4, diam*6, diam*6);
    
    noStroke();
    fill(x*2,y*2,100,250);
    ellipse(x,y, diam*2, diam*2);
    fill(0);
    ellipse(x,y,diam, diam);
  
  }

  void calc(){
    x += random(-20, 20);
    y += random(-10, 10);
    
    x = x % width;
    y = y % height;
    
    if (x < 0) x *= -10;
    if (y < 0) y *= -10;
  }
}





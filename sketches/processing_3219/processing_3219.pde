
Pincel p;


void setup(){
  size(500, 500);
  background(0); 
  smooth();
  colorMode(HSB);
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
    diam = 10;
    col = color(255);
  }

  void dibuja(){
    calc();
    fill(col);
    noStroke();
    
    fill(x,y,350,200);
   rect(x,y, diam, diam);
   fill(x,y,350,200);
   rect(y,x,diam,diam);
  }

  void calc(){
    x += random(-10, 10);
    y += random(20, -20);
    
    x = x % width;
    y = y % height;
    
    if (x < 0) x *= 15;
    if (y < 0) y *= 15;
  }
}






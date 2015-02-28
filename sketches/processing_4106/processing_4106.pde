
Pincel p;


void setup(){
  size(500, 500, P3D);
   background(0);
  smooth();
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
    x = noise(width);
    y = noise(height);
    diam = 20;
    col = color(0);
  }

  void dibuja(){
    calc();
    fill(col);
    noStroke();
  
   fill(255);
   ellipse(x, y, diam*1.5, diam*1.5); 
    fill(70, random (1, 200), random (10, 300), 200);
    rect(x,y, diam/2, diam*3);
    translate (noise(1, 5), noise (-10, 1));

  }

  void calc(){
    x += 10;
    y +=random(-30, 30);
    
    x = x % width;
    y = y % height;
    
    if (x < 0) x *= -10;
    if (y < 0) y *= -10;
  }
}


void mousePressed(){
 p.diam-= -10; 
}


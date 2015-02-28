
Pincel p;


void setup(){
  size(500, 500);
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
    x = random(width);
    y = random(height);
    diam = 10;
    col = color(2545);
  }

  void dibuja(){
    calc();
    fill(col);
    stroke(205);
    fill(5, 10*9, 0);
}
  

  void calc(){
    x += random(-70, 70);
    y += random(-70, 70);
    
    x = x % width;
    y = y % height;
    
    fill(x,y,56,100); 
  rect(x, y, second(), second()); 
  ellipse(x,y, diam, diam); 
    if (x < 0) x *= -1;
    if (y < 0) y *= -1;
  }
}


void mousePressed(){
 p.diam += 8; 
}


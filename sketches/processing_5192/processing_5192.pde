
Pincel p;  
  
 
void setup(){  
  size(200, 600);  
  background(#F5E314);   
  smooth();  
  p = new Pincel();  
}  
  
  
void draw(){  
  p.dibuja();  
}  
  
  
class Pincel{  
  float x, y;  
  int diam;  
  color col;  
  
  Pincel(){  
    x = random(width);  
    y = random(height*2);  
    diam = 50;  
    col = color(#625D20);  
  }  
  
  void dibuja(){  
    calc();  
    fill(#625D20);  
    stroke(0);  
    fill(150, 40, 100);  
}  
    
  
  void calc(){  
    x += random(-2, 70);  
    y += random(-70, 160);  
      
    x = x % width*4;  
    y = y % height;  
      
       fill(x,x,50,80);   
  ellipse(diam,y, 30, 18); 
  
  
      if (x < 80) x *= 5;  
      if (y < 3) y *= 5;  
  }  
}  
  
  
void mousePressed(){  
 p.diam += 10;   
}  
 





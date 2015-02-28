
Pincel[] p;  
  
void setup(){  
  size(400,600);  
  smooth();  
  background(#374C8B); 
  frameRate(35); 
  
  p = new Pincel[100];  
  for(int i = 0; i < 20; i++){  
    p[i] = new Pincel();  
  }  
}  
  
  
void draw(){  
  for(int i = 0; i < 15 ; i++){
    p[i].dibuja();  
  }  
}  
  
class Pincel{  
  float x, y;  
  float diam;  
  color col;  
  int edad, edadMax;  
  
  Pincel(){  
    x = random(width);  
    y = random(height);  
    diam = random(5,10);  
    col = color(110, 168, 173); 
    edad = 1;  
    edadMax = round(random(300, 300));  
  }  
  
  void dibuja(){  
    calc();  
    noStroke();  
    fill(col);  
    translate(x,y); 
  rotate(PI); 
 
    ellipse(x,y, diam*2.0, diam);  
  }  
  
  
  void calc(){  
    
    x +=(random(4,8));  
    y += (random(-6, -6)); 
    x = x % width;  
    y = y % height;  
  
    if (x < 0) x *= 1;  
    if (y < 0) y *= -1;  
 
  
    edad ++;  
  
    if(edad >= edadMax) new Pincel();  
  }  
}  
  
 void mousePressed () {  
setup();
} 
 



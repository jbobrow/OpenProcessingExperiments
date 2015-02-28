
Pincel p; 
 
 
void setup(){ 
  size(450, 450); 
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
  float diam2; 
  color col; 
 
  Pincel(){ 
    x = random(width); 
    y = random(width); 
    diam = 22; 
    diam2= 25; 
    col = color(200,607,79,25); 
  } 
 
  void dibuja(){ 
    calc(); 
    fill(col); 
    noStroke(); 
    ellipse(x,y, diam*2, diam2*2);  
    fill(0);
    ellipse(x,y,25,30)

    ; 
  } 
 
  void calc(){ 
    x += random(-50, 55); 
    y += random(20, 80); 
    
     
    x = x % height; 
    y = y % height; 
    
     
    if (x < 0) x = 4; 
    if (y < 0) y = -3; 
     
  } 
} 
 
 
void mousePressed(){  
 p.diam2 +=6; 
} 




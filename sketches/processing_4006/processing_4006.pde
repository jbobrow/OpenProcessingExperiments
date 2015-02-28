
Pincel[] p; 
PImage ritoque; 
void setup(){ 
  noCursor(); 
  ritoque = loadImage("ciudad abierta.jpg"); 
  size(ritoque.width, ritoque.height,P3D); 
  colorMode(HSB, 255); 
  smooth(); 
  p = new Pincel[150]; 
  for(int i = 0; i < 150; i++){ 
    p[i] = new Pincel(); 
  background(0);
} 
} 
 
 
void draw(){ 
  for(int i = 0; i < 150; i+=1){ 
    p[i].dibuja(); 
  } 
 
} 
 
 
class Pincel{ 
 int x, y; 
  float diam; 
  color col; 
  int edad, edadMax; 
 
  Pincel(){ 
    x = round(random(width)); 
    y = round(random(height)); 
    diam = 5; 
    //col = color(100); 
    col = ritoque.get(x,y); 
    edad = 600; 
    edadMax = round(random(5000)); 
  } 
 
  void dibuja(){ 
    calc(); 
    noStroke(); 
 
    ///fill(((mouseX*mouseX)/ritoque.width),((mouseY*mouseY)/ritoque.height),(1+mouseX/1+mouseY)); 
    fill(ritoque.get(x,y)); 
  
 ellipse(x,y,diam,diam);
 
 box(10);
  } 
 
  void calc(){ 
    x += random(-10, 10); 
    y += random(3,8); 
 
    x = x % width; 
    y = y % height; 
 
    if (x < 0) x *= 10; 
    if (y < 0) y *= 30; 
 
    edad ++; 
 
    //if(edad >= edadMax) col = color(0); 
    if(edad > edadMax) col =  ritoque.get(x,y); 
  } 
} 
 
 

 
 
 

 
 
 
 
 



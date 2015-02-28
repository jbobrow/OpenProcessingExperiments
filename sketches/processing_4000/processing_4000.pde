

 
 
Pincel[] p; 
 
 
void setup(){ 
  size(500, 500); 
 
  smooth(); 
 
  p = new Pincel[100]; 
 
  for(int i = 0; i < 100; i++){ 
    p[i] = new Pincel(); 
    background(#FAFAFA); 
  } 
} 
 
 
void draw(){ 
  for(int i = 0; i < 100; i++){ 
    p[i].dibuja(); 
  } 
 // velo(); 
} 
 
  


class Pincel{ 
  float x, y; 
  float diam; 
  color col; 
  int edad, edadMax; 
 
  Pincel(){ 
    x = random(width); 
    y = random(height); 
    diam = 10; 
    col = color(100); 
    edad = 1; 
    edadMax = round(random(500, 1000)); 
  } 
 
  void dibuja(){ 
    calc(); 
    stroke(#9A2F9B); 
     
    fill(#A52CE3);
    ellipse(x,y,diam,diam); 
    fill(#F44DF5,100); 
    ellipse(x,y, diam/2, diam/2); 
  } 
 
  void calc(){ 
    x += random(-2, 2); 
    y += random(-2, 2); 
 
    x = x % width; 
    y = y % height; 
 
    if (x < 0) x *= -1; 
    if (y < 0) y *= -1; 
 
    edad ++; 
 
    if(edad >= edadMax) col = color(0); 
  } 
} 
 


 
void velo(){ 
  fill(234); 
  rect(0,0,width, height);  
} 
 
 
 
 
void keyPressed(){ 
  setup(); 
}


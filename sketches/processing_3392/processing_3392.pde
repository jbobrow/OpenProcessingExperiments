
Pincel[] p;
float n;
void setup(){
  size(500, 500);

  smooth();
n=0;
  p = new Pincel[100];
 
  for(int i = 0; i < 100; i++){
    p[i] = new Pincel();
    
  }
}
 
 
void draw(){
  for(int i = 0; i < 100; i++){
    p[i].dibuja();
  }
  velo();
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
    col = color(random(45));
    edad = 1;
    edadMax = round(random(1000, 3000));
  }
     
  void dibuja(){
    calc();
    noStroke();

    fill(col);
    rect(x,y, diam, diam); 
    
    fill(255);
    rect(x,y, diam/4, diam/2);
  }
 
  void calc(){
   //n+=0.01;
  
  float N = random(n); 
    x += random(4, 2);
    y += random(-4, 2);
 
    x = x % width;
    y = y % height;
 
    if (x < 0) x+= random(20) ;
    if (y > 0) y+= random(600);
 
    edad ++;
 
    if(edad >= edadMax) col = color(20);
  
  }
}
 
 
void keyPressed(){
  for(int i = 0; i < 100; i++){
    p[i].col = color(random(p[i].col) + random(-88, 128), random(p[i].col)  + random(-10, 10), random(p[i].col)  + random(-10, 10));
  }
}
 
void velo(){
fill(0,10);

  rect(-9,-9,width, height); 
}
 
void mousePressed () {
  setup();
} 


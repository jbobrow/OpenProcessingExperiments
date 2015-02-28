
Pincel[] p; 
 
void setup(){ 
  size(600,600); 
  smooth(); 
  background(#210000);
  frameRate(35);
 
  p = new Pincel[100]; 
  for(int i = 0; i < 100; i++){ 
    p[i] = new Pincel(); 
  } 
} 
 
 
void draw(){ 
  for(int i = 0; i < 50 ; i++){//empieza con 50 
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
    diam = random(1,5); 
    col = color(255, 50);
    edad = 1; 
    edadMax = round(random(100, 300)); 
  } 
 
  void dibuja(){ 
    calc(); 
    noStroke(); 
    fill(col); 
    translate(x,y);
  rotate(PI);
 //se define como se comportan las elipses

    ellipse(x,y, diam*1.5, diam); 
  } 
 
 
  void calc(){ 
   
    x +=(random(2,4)); 
    y += (random(-6, -2)); //los valores negativos permiten que avancen hacia arriba
 
    x = x % width; 
    y = y % height; 
 
    if (x < 0) x *= -1; 
    if (y < 0) y *= -1; 

 
    edad ++; 
 
    if(edad >= edadMax) new Pincel(); 
  } 
} 
 
 void mousePressed () { 
setup();//al presionar el mouse se reinicia el sketch
}



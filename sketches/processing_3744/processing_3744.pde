
PImage ritoque; 
Pincel[] p;

void setup(){ 
  ritoque = loadImage ("ciudada.jpg"); //carga imagen
  size(ritoque.width, ritoque.height); //tamaño de lienzo según imagen
 colorMode(HSB, 20);
  smooth();
 p = new Pincel[1000];  
 for(int i = 0; i < 500; i++){ 
    p[i] = new Pincel(); 
  } 
} 

void draw(){ 
  for(int i = 0; i < 300; i++){ //mientras mayor el numero, mayor la cantidad de cuadraditos
    p[i].dibuja(); 
  } 
  // velo(); 
  } 
 
 
class Pincel{ 
int x, y; 
  float diam; 
  color col; 
  int edad, edadMax; 
  
   Pincel(){ 
    x = round(random(width)); //round para convertir float en int
    y = round(random(height));
    diam = 10;                //tamaño pincel          
    col = ritoque.get(x,y);  //col = color
    edad = 100; 
    edadMax = round(random(50, 100)); //vida
  }
  
  void dibuja(){ 
    calc(); 
    noStroke(); 
   fill(ritoque.get(x,y)); 
 rect(x,y,5,noise(5));

  } 
 
 
  void calc(){ 
    x += random( -1,4); 
    y += random( -2,4); 
 
    x = x % width; 
    y = y % height; 
 
    if (x < 0) x *= -1; 
    if (y < 0) y *= -1; 
 
    edad ++; 
 
     if(edad >= edadMax) col =ritoque.get(x,y);
     
  }  
} 
 
 
void mousePressed(){ 
   for(int i = 0; i < 100; i++){ 
 
    p[i].col = color(100,0,0); 
  } 
 
} 
void velo(){ 
  fill(0,10); 
  rect(0,0,width, height);  
} 
 



PImage carretera;
Pincel[] p;
  
void setup(){  
  
  carretera = loadImage ("perfecta.jpg"); //carga la imagen  
  size(carretera.width, carretera.height); //toma el tamaño de la imagen cargada   
  smooth();
  float parabrizas;
  background(carretera);
  p = new Pincel[100];

  for(int i = 0; i < 100; i++){
    p[i] = new Pincel();
  }
}


void draw(){
  
  for(int i = 0; i < 100; i++){
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
    diam = 10;
    col = color(109,221,240,10);
    edad = 1;
    edadMax = round(random(500, 1000));
  }

  void dibuja(){
    calc();
    noStroke();
    
    fill(col);
    ellipse(x,y, diam, diam); 
    
    fill(250,10);
    ellipse(x,y, diam/2, diam/2);
  }


  
  void calc(){
    x += random( 4);
    y += random( 4);

    x = x % width;
    y = y % height;

    if (x < 0) x *= -1;
    if (y < 0) y *= -1;

    edad ++;

    if(edad >= edadMax) col = color(255,1);
    
  } 
}


void mousePressed(){
   background(carretera);
}






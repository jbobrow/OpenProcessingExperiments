

//Composición interactiva con variantes presionando las teclas de desplazamiento, alt, shift y control.

Forma[] cuadrados = new Forma[5000];

int totalcuadrados;


void setup() {
  size(900,700);
  smooth();
}

void draw() {
  background(0);
  fill(29,18,118,50);
  rect(0,0,width, height);
  
  
  cuadrados[totalcuadrados] = new Forma();

  totalcuadrados++ ;

 
  if (totalcuadrados >= cuadrados.length) {
      totalcuadrados = 0; 
  }

  
  for (int i = 0; i < totalcuadrados; i++ ) { 
    cuadrados[i].salir();
    cuadrados[i].mostrar();
    cuadrados[i].rebotar();
  }

}

class Forma {

  float x,y;  
  float velocidadY; 
  float velocidadX;
  color c;
  float r;     

  Forma() {
    r = random (2,12);                
    x = random(width);     
    y =(height); //-r*4;             
    velocidadY = random(1,3);   
    velocidadX = random(1,2);
    c = color (45,87,170,50); 
  }

 
 void salir(){
    
    y -= velocidadY;
    x+=velocidadX/4;
 
  }
   
 void rebotar(){
    if ( x>=width || x<=0){
    velocidadX =velocidadX *-1;
    }
     if ( y>=height || y<=0){
    velocidadY =velocidadY *-1;
    }   
}
 
  void mostrar(){
    float a = 0.1;
    fill (c);
    smooth();
    noStroke();
 

     for (int i = 3; i < r; i++) {
     
     rect (x,y,50,50, 20, 20); 
     rect (x-50, y-150, 1,125);
     
  
  if (keyPressed==true) {
  if (key == CODED) {
      if (keyCode == LEFT){
      fill (12,106,100,30);
    
  } if (keyCode == RIGHT){
      fill  (75,57,133,30);
  }
  } if (keyCode == UP){
    fill (100,140,219,30);
  
  } if (keyCode == DOWN){
    fill (10,10,81,20);
  }  
  if (keyCode == CONTROL){
   fill (255,20);
    rect (x,y,50,50, 60, 70); 
  } 
  if (keyCode == ALT){
   fill (125,44,242,10);
    rect (x,y,50,50,-10,70); 
  } 
  if (keyCode == SHIFT){
   fill (242,130,44,20);
    rect (x,y,2,2, 60, 70); 
 }
 } 
 
 }}}
   
 



/*Ejercicio: Simular el movimiento lineal de un coche en 2 tramos
con pendientes 0 y PI/4 y velocidades v, v/2 en cada tramo.*/

float posX = 0.0;
float posY = 0.0;
float velocidad  = 100;
float delta_t = 0.01;

float x1,y1,x2,y2,x3,y3;

void setup() {
  size(438, 500);
  smooth();
}

void draw() {
  background(255,222,173,0);
  
  if( posX < (width/2) ) {
    posX += velocidad * delta_t;
    posY = 200;
        
    x1=25;
    y1=125;
    x2=25;
    y2=145;
    x3=50;
    y3=135;
  } else {
    posX += (velocidad/2)*delta_t;
    posY -= PI/4;
    
    x1=50;
    y1=130;
    x2=25;
    y2=140;
    x3=50;
    y3=150;
  }  
  translate(posX,posY);
  fill(0,255,255,255);
  triangle(x1,y1,x2,y2,x3,y3);
}  



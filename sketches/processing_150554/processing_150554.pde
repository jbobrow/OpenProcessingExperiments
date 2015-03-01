
//Ejercicio2: Simular el movimiento lineal de un coche en 2 tramos
//con pendientes 0 y PI/4 y velocidades v, v/2 en cada tramo.

float x,y;
float v = 100;
float dt = 0.05;
float dx;

void setup(){
  size(640,360);
  fill(255,0,0);

}

void draw(){
  background(0);
  
  if(x < width/3){
    dx= v*dt;
    x += dx;
    y= 0;
  }
  
  else{
    dx=v/2*dt;
    x += dx;
    y -= PI/4;
  }
  
  translate(x,y);
  ellipse(10,height/2+20,20,20);
  ellipse(40,height/2+20,20,20);
  rect(10,height/2-10,30,10);
  rect(0,height/2,50,15);
}

void keyPressed(){
  if (key == 'x'){
    x= 0;
  }
  
}




class Estrella{
  float velocidad;
  float r;
  color c;
  float x,y;
  float x1,x2;
  float ancho;
float angulo;
float velocidadX;
float velocidadY;
int direccionX;
int direccionY;

Estrella(){
  r= 55.0;
  x= random (60.0);
  y=60.0;
  c= color(8,255,253);
  velocidad= random( 1,10);
  ancho=25.0;
  angulo=0.0;
  velocidadX=8.0;
  velocidadY=6.0;
  direccionX=1;
  direccionY=1;
  x1=60.0;
  x2=60.0;
  
}


 void llover(){
   x+=velocidadX* direccionX;
  if((x>width-ancho)|| (x<ancho)){
  direccionX=direccionX*-1;
  }
y+=velocidadY * direccionY;
if((y>height-ancho)|| (y<ancho)){
  direccionY=direccionY*-1;
  
  }
 }
  
  
    
  void mostrar(){
  fill(c);
  noStroke();
  angulo=angulo+ 0.02;
  translate(x1,x2);
  rotate(angulo);
  rectMode(CENTER);
  rect(300,300,ancho,ancho);
  triangle(300+12,300+12,300+12,300-12,300+50,300);
  triangle(300-12,300-12,300+12,300-12,300,300-50);
  triangle(300-12,300-12,300-12,300+12,300-50,300);
  triangle(300+12,300+12,300-12,300+12,300,300+50);
  rectMode(CORNER);

  
    }
}



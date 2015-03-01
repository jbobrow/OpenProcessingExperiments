
Forma[] circulo = new Forma[50];  //Array

void setup(){
  size(800, 800);
  smooth();
  for(int i = 0; i<circulo.length; i++){
    
    circulo[i] = new Forma(random(width), random(height), color(random(255), random(100), random(20)));
    
  }

  
}


void draw(){
  //background(0);
  
  for(int i = 0; i < circulo.length; i ++){
    circulo[i].moverse();
    circulo[i].mostrar();
    circulo[i].rebote();
    //auto[1] = new Vehiculo(mouseX, mouseY); //con el mouse
  }
  
  //saveFrame("frames/####.png");
}

class Forma{
  color c;
  int tamano;
  float x;
  float y;
  int velocidad;
  int velocidad2;


Forma(float x_, float y_, color c_){
  x= x_;
  y= y_;
  c = c_;
  tamano = 100;
  velocidad = 10;
  velocidad2 = 6;
}
  void mostrar(){
  int offset = tamano/4;
  ellipseMode(CENTER);
  stroke(200);
  fill(c);
  ellipse(x, y, tamano, tamano/2);
  fill(200, random(100));
  ellipse(x, y, offset*random(5), offset*random(5));
  }
  void moverse(){
    x = x + velocidad;
    y = y + velocidad2;

  }

void rebote(){
  if((x>width)||(x<0)){
    velocidad = velocidad*-1;

  }
  if(y>height||(y<0)){
    velocidad2 = velocidad2*-1;
  }
}
}

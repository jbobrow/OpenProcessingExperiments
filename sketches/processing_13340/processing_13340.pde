
Individuo animales[];
int cantidad;

void setup() {
  size(600, 400,P3D);
  frameRate( 30 );
  cantidad=10;
  background(0);
  smooth(); //anti-aliased
  animales = new Individuo[cantidad];
  for(int i=0; i<cantidad ; i++){
      animales[i] = new Individuo(
          random(width),
          random(height),
          10,
          random(TWO_PI),
          random(1,5)
      );
  }
}

void draw(){

      for(int i=0; i<cantidad ; i++){
          animales[i].mover();
          animales[i].dibujar();
      }


}


class Individuo{
    float a = random (0,10);
    float x;
    float y;
    float t;
    float direccion;
    float velocidad;
    Individuo (float x_,float y_,float t_,float direccion_, 
    float velocidad_){
      x= x_;
      y= y_;
      t = t_;
      direccion = direccion_;
      velocidad = velocidad_;
    }
    void dibujar(){
      pushMatrix();
      translate( x, y );
      rotate(direccion);
      stroke(#ff0099);
      strokeWeight(1);
      point(t/20, t/20);
      popMatrix(); //el eje de coordenadas vuelve al ultimo lugar, a la ultima foto
    }
    void mover(){
      float amplitud = 100;
      direccion += radians (random(-amplitud,amplitud));
      
      float dx= velocidad * cos(direccion) ;
      float dy= velocidad * sin(direccion);
    x = x + dx;
    y = y + dy;
    x= (x > width ? x-width : x);
   y= (y > height ? y-height : y); 
    }
  }



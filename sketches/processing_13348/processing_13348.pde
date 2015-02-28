
class Individuo{
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
    pushMatrix(); //change the direcctions
    translate( x, y );
    rotate(direccion);
    point (t,t);
    stroke (255,0,209,200);
    strokeWeight (0.5);
    popMatrix(); //el eje de coordenadas vuelve al ultimo lugar, a la ultima foto
    }
    
void huir(Individuo otro){
          if (dist(x, y, otro.x, otro.y)<t){
            float angulo = atan2(otro.y-y,otro.x-x);
            direccion = angulo + PI ;
            stroke (0,249,255,200);
          }
  
}

void morir(Individuo otro){
  
  
  
  
}
    void mover(){
        float amplitud = 10;
        direccion += radians (random(-amplitud,amplitud));
        
        float dx= velocidad * cos(direccion) ;
        float dy= velocidad * sin(direccion);
        x = x + dx;
        y = y + dy;
        x= (x > width ? x-width : x);
        y= (y > height ? y-height : y); 
    }
  }



int px; // posición en x
int py; // posición en y
float vx =random(0.5,2); // velocidad en x (aleatoria)
float vy =random(0.5,2);// velocidad en x (aleatoria)
void setup() { 
size(500,300);
}

void draw() { 
  px+=vx; //variacion de la posicion segun la velocidad
  py+=vy;
  if(px>width||px<0){ // cuando la bola llega al borde
  vx=vx*-1; // cambie la direccion 
  }
  if(py>height||py<0){
  vy=vy*-1;
  }
 ellipse(px,py,10,10);

}

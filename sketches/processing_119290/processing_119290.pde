
//EJEMPLO DE UNA PELOTA PARA SABER MEDIANTE UN TIRO PARABOLICO SU POSICION Y VELOCIDAD.
//ADELA CARRASCO
//CARLOS CORRALES.
fuentes: http://go.yuri.at/p5/tutorial/


PVector position, acc, vel,coord;
int radius = 10;
boolean loop = true;
 
void setup() {
  frameRate(10); // DIBUJAR MUCHAS VECES POR SEGUNDO.
  size(600,500);
  
  smooth();
 
  //POSICION DEL CIRCULO.
  position = new PVector((int)(0.3*width),-10);
  
 
  //COMENZAR VELOCIDAD EN 4PX EN +X (DIRECCION)
  //CERO EN DIRECCION Y.
  vel = new PVector(1,0);
 
  //LA ACELERACION ES 0  EN DIRECCION DE X 
  acc = new PVector(0,.2);
  
  PVector[] elements = {};
}
 
void draw() {
    dibujo();
}


void dibujo(){
 background(0,0,0);
  noStroke();
    for(int x=0; x>=100; x+1)
    { 
     fill(x,0,x);
     }
   
 //Llamar al metodo para dibujar elipse
 elipseverde();
   
 
 //ACTUALIZAR LA VELOCIDAD DE LA PELOTA.
  vel.add(acc);
 
  //UTILIZAR LA VELOCIDAD PARA ACTUALIZAR LA POSICION DE LA PELOTA.
  position.add(vel);
 
  // SI LA PELOTA HA TOCADO EL FONDO REGRESAR HACIA ARRIBA.
  if ( position.y + radius >= height ) {
    
      ellipseMode(CENTER); //COLOCACION DEL CIRCULO.
      ellipse(position.x, position.y, 2*radius, 2*radius);
      fill(255,0,0);
      coord = new PVector(position.x,position.y);
      vel.y = -vel.y;
  }
 
  //SI LA PELOTA PEGA EN LA PARED DERECHA ENVIAR A LA IZQUIERDA.
  if ( position.x + radius >= width ) {
  ellipseMode(CENTER); //COLOCACION DEL CIRCULO.
  ellipse(position.x, position.y, 2*radius, 2*radius);
  
      fill(0,0,255);
    vel.x = -vel.x;
    

  }
 
  //SI LA PELOTA PEGA EN LA PARED IZQUIERDA ENVIAR A LA PARED DERECHA.
  if ( position.x - radius <= 0 ) {
    vel.x = -vel.x;
  }
 // PARA AGREGAR EL TEXTO.
   
  String legend = "";
  legend += "POSICION X: (" + position.x  + ")";
  legend += "\n\POSICION Y: (" + ((-1)*position.y) +  ")";
  legend += "\n\VELOCIDAD HORIZONTAL = " + vel.x;
  legend += "\n VELOCIDAD VERTICAL = " + vel.y;
  legend += "\n POSICION CAIDA" + coord;
  
  text(legend,15,height-90);
}

//void puntaje(){//Detectar cuando dos objetos se tocan
 //if(//si el objeto toca el otro objeto){
  //int puntaje= puntaje+1;
 //}else{
  //puntaje = puntaje-1;
 //}
//}

//void rectangulo(){
  //Dibujar rectangulo y detectar como moverlo con las teclas
 //Mover objeto con el mouse
//}



void elipseazul(){
  //DIBUJAR CIRCULO EN UBICACION ACTUAL.
  ellipseMode(CENTER); //COLOCACION DEL CIRCULO.
  ellipse(position.x, position.y, 2*radius, 2*radius);
  fill(0,0,255);
}
void elipseverde(){
  //DIBUJAR CIRCULO EN UBICACION ACTUAL.
  ellipseMode(CENTER); //COLOCACION DEL CIRCULO.
  ellipse(position.x, position.y, 2*radius, 2*radius);
  fill(0,255,0);
}
 
 void elipserojo(){
  //DIBUJAR CIRCULO EN UBICACION ACTUAL.
  ellipseMode(CENTER); //COLOCACION DEL CIRCULO.
  ellipse(position.x, position.y, 2*radius, 2*radius);
  fill(255,0,0);
  
}
 
 
 
void mousePressed() {
  if ( loop ) {
    noLoop();
    loop = false;
  }
  else {
    loop();
    loop = true;
  }
}

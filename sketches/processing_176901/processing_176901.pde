
float x=random(800); //ponemos randoma para que empieze donde quiera
float y=random(600);// ponemos random para que empieze donde quiera
float vx =2.5; // velocidad "no se puede poner comas"
float vy =2.5;// velocidad "no se puede poner comas
void setup() {
background(255);
size(800,600);//si ponemos la misma medida de el cuadro no se mobera mucho i ara como 1 cuadrado
}
 
void draw(){ 
 movimiento();
 fill(random(255),random(255),random(255));
 ellipse(x,y,20,20);
 
}

void movimiento(){
  x+=vx; //movimiento de la pelota
  y+=vy;
  if(x>width||x<0){ // si la pelota llega a la pared (anchura)
  vx=vx*-1; // cambio de dirección
  }
  if(y>height||y<0){// si la pelota llega a la pared (altura)
  vy=vy*-1;// cambio de dirección
  }
}





int posX=200,posY=100,altura=25,velocidadCaida=6,velocidadImpulso=9;
boolean movimiento=false,rebote=true;

void setup(){
  size(400,400);
  smooth();
  noStroke();
}

void draw(){
  background(200,200,200);
  fill(255,125,6);
  ellipse(posX,posY,50,50);
  if(movimiento){
    posX=mouseX;
    if(rebote){
      posY=posY+velocidadCaida;
    }else{
      posY=posY-velocidadImpulso;
    }
    if(posY>=375){
      rebote=false;
      altura=altura+50;
      velocidadImpulso--;
    }
    if(posY<=altura){
      rebote=true;
    }
  }
  if(altura>=375){
    movimiento=false;
  }
  
  // Consola
  println ("Tamaño de Ventana: "+width+"x"+height+" Mouse X: "+mouseX+" Mouse Y: "+mouseY+" Tecla: "+key+" FPS: "+frameRate+" Frames Totales: "+frameCount);
  println ("PosX: "+posX+" PosY: "+posY+" Altura: "+altura+" Velocidad de Caída: "+velocidadCaida+" Velocidad de Impulso: "+velocidadImpulso);
  println ("Movimiento="+movimiento+" Rebote="+rebote);
}

void mousePressed(){
  if(movimiento==false){
    if(dist(posX,posY,mouseX,mouseY)<=25){
      movimiento=true;
      altura=25;
      velocidadCaida=6;
      velocidadImpulso=9;
    }
  }
}


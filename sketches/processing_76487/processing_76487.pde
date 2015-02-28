

//float posX=30;
//float posY=30;
float posX=random(400); // para que la pelota empiece en cualquier punto cada vez que empieza, 400 es el valor de la ventana
float posY=random(800); // para que la pelota empiece en cualquier punto cada vez que empieza, 800 es el valor de la ventana
float sentidoX=4;
float sentidoY=8; // se ponen esos valores para aumentar la velocidad de la pelota

int buenas=0; // conatbilizar cuantas chocan con la raqueta y cuantas no
int malas=0;

void setup(){
  size(800,400);
  background(255);
  noStroke();
  smooth();
}


void draw(){
  background(255);
  
  //raqueta 
  fill(255,0,0);
  rect(mouseX-50,height-10,200,10);// para que no se vaya de la ventana en la derecha
  
  //pelota
  fill(180,0,252);
  ellipse(posX,posY,60,60);// variables float se ponen arriba
  
  //mover pelota
  //posY=posY+2; //incrementar valores para que la pelota baje, se pone 2 para que vaya más rápido en vertical
  posY=posY+sentidoY; // se reemplazan las variables para que funcione el if por las de sentidoY
 // posX=posX+1; // incrementar valores para que la pelota vaya horizontal
 posX=posX+sentidoX; //se reemplazan las variables para que funcione el if por las de sentidoX
  
  // que la pelota rebote abajo
  if(posY>=height-30){ // se pone -30 al height para que la peltoa no se esconda en la ventana y 30 es la mitad del tamaño de la pelota.
    sentidoY=- sentidoY; // para que rebote la pelota
    
    // determinar la distancia de la pelota con la raqueta, sacar la diferencia de mouseX-posX.
    // que la pelota pegue en la raqueta
     float distancia=abs(mouseX-posX); 
    if (distancia<=100) buenas=buenas+1;
    else malas=malas+1;
  }
  
  //peltoa rebote arriba
if(posY-30<=0){
    sentidoY=-sentidoY;
  }

  // para que la pelota no se vaya por las esquinas, lado derecho
  if(posX>=width-30){
    sentidoX=-sentidoX;
  }
// para que la pelota no se vaya pos las esquinas, lado izquierdo
if(posX-30<=0){
  sentidoX=-sentidoX;
}
text ("Buenas: "+ buenas,10,20);// para que salga el texto contabilizando las buenas y malas
text ("Malas: "+ malas, 10,50);
}




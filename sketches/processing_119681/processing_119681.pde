
//Nicolás Montes Vázquez

int colorOjo=color(0,255,0);
int narizIzquierdaX=255;
int narizIzquierdaY=400;
int narizDerechaX=285;
int narizDerechaY=400;
int tamanoNariz=15;
boolean lanzador=false;
int movimientoNariz = 1;
int alturaBoca=80;
boolean lanzador2=false;
int alturaOrejas=325;
int alturaCejas=295;
int movimientoOrejas=1;
int movimientoCejas=1;
int colorPelo=color(0,0,0);
void setup() {
  size(540, 720);
}
 
void draw() {
  background((mouseX/2.1),(mouseY/2.75),0);

  //Esto es la cara
  fill(#FFAF00);
  stroke(#000000);
  beginShape();
  vertex(135, 225);
  vertex(405, 225);
  vertex(405, 450);
  vertex(315, 540);
  vertex(225, 540);
  vertex(135, 450);
  vertex(135, 225);
  endShape();
  line(270, 540, 270, 517.5);
     
  //Estos son los ojos, izquierdo primero, derecho segundo
  stroke(#000000);
  fill(#FFFFFF);
  ellipse(202.5, 315, 78.75, 35);
  ellipse(337.5, 315, 78.75, 35);
 
  //Esta sección es el interior de los ojos
  fill(colorOjo);
  //Esto es el iris, izquierdo primero, derecho segundo
  ellipse(202.5, 315, 30, 30);
  ellipse(337.5, 315, 30, 30);
  
  //Color Aleatorio de los ojos
  if(lanzador==true){
    colorOjo=color(random(0,255),random(0,255),random(0,255));
  }else{
    colorOjo=color(0,255,0);
  }
  
  //Esto es la pupila, izquierda primera, derecha segunda
  fill(#000000); 
  ellipse(202.5, 315, 10, 15);
  ellipse(337.5, 315, 10, 15);
 
  
  //Esta sección son las cejas
  stroke(#000000);
  noFill();
  strokeWeight(7); //Cambiar tamaño grosor borde
  strokeCap(SQUARE); //Redondear las esquinas del borde
  //Ceja izquierda, primero parte izquierda, despues derecha
  arc(202, alturaCejas, 78.75, 35, TWO_PI-PI/2, TWO_PI);
  arc(203, alturaCejas, 78.75, 35, PI, TWO_PI-PI/2);
  //Ceja derecha, primero parte izquierda, despues derecha
  arc(337, alturaCejas, 78.75, 35, TWO_PI-PI/2, TWO_PI);
  arc(338, alturaCejas, 78.75, 35, PI, TWO_PI-PI/2);
  strokeWeight(1); //Cambiar tamaño grosor borde
   
   
  //Esta sección es la boca
  fill(#FF0000);
  arc(270, 450, 150, alturaBoca, 0, PI);
  
  //Cerrar la boca
  if(alturaBoca>0&&lanzador==true){
    alturaBoca=alturaBoca-1;  
  }else if (alturaBoca<80){
    alturaBoca=alturaBoca+1;
  }
  
 
  /*Esta sección es la nariz, primera linia la
  nariz entera, segunda y tercera linia los agujeros*/
  fill(#FFAF00);
  arc(270, 400, 60, 60, TWO_PI-PI, TWO_PI);
  frameRate(15); 
  fill(#000000);
  arc(narizIzquierdaX, narizIzquierdaY, tamanoNariz, tamanoNariz, TWO_PI-PI, TWO_PI);
  arc(narizDerechaX, narizDerechaY, tamanoNariz, tamanoNariz, TWO_PI-PI, TWO_PI);
  
  //Movimiento de la Nariz
  if(lanzador==true){
  tamanoNariz=tamanoNariz+movimientoNariz;
  }
  if(tamanoNariz >25&&lanzador==true) {
    movimientoNariz = -movimientoNariz ;
  } else if (tamanoNariz <= 15) {
    movimientoNariz = + 1;
  }
  

  
  //Esta sección son las orejas
  fill(#FFAF00);
  //Oreja izquierda, parte de arriba
  arc(135, alturaOrejas, 60, 112.5, PI, TWO_PI-PI/2); 
  //Oreja izquierda, parte de abajo
  arc(135, alturaOrejas, 60, 112.5, PI/2, PI);
  //Oreja derecha, parte de arriba
  arc(406, alturaOrejas, 60, 112.5, TWO_PI-PI/2, TWO_PI);
  //Oreja derecha, parte de abajo 
  arc(406, alturaOrejas, 60, 112.5, 0, PI/2);
  
  /*Esto son las lineas de las orejas,
  primero las de la izquierda y despues las de la derecha*/
  arc(130, alturaOrejas, 30, 70, PI, TWO_PI-PI/2); 
  arc(130, alturaOrejas, 30, 70, PI/2, PI);
  arc(125, alturaOrejas+23, 15, 15, TWO_PI-PI/2, TWO_PI);
  arc(125, alturaOrejas+23, 15, 15, 0, PI/2);
 
  arc(411, alturaOrejas, 30, 70, TWO_PI-PI/2, TWO_PI);
  arc(411, alturaOrejas, 30, 70, 0, PI/2); 
  arc(416, alturaOrejas+20, 15, 15, PI, TWO_PI-PI/2);
  arc(416, alturaOrejas+20, 15, 15, PI/2, PI);
   
  
  
 //Esta sección es el pelo
  fill(colorPelo);
  beginShape();
  vertex(120, 290);
  vertex(138, 170);
  vertex(162, 187);
  vertex(225, 145);
  vertex(250, 173);
  vertex(290, 155);
  vertex(313, 183);
  vertex(340, 165);
  vertex(357, 197);
  vertex(395, 177);
  vertex(420, 290);
  vertex(345, 240);
  vertex(295, 270);
  vertex(255, 234);
  vertex(200, 260);
  vertex(180, 230);
  vertex(120, 290);
  endShape();
  
  //Color pelo aleatorio
  if(lanzador==true){
    colorPelo=color(random(0,255),random(0,255),random(0,255));
  }else{
    colorPelo=color(0,0,0);    
  }
  
  //Movimiento de las Orejas
  if(lanzador2==true){
  alturaOrejas=alturaOrejas+movimientoOrejas;
  }
  if(alturaOrejas>340&&lanzador2==true) {
    movimientoOrejas = -(movimientoOrejas) ;
  } else if (alturaOrejas <= 315) {
    movimientoOrejas = + 1;
  }
  
  //Movimiento de las Cejas
  if(lanzador2==true){
    alturaCejas=alturaCejas+movimientoCejas;
  }
  if(alturaCejas>310&&lanzador2==true) {
    movimientoCejas = -(movimientoCejas) ;
  } else if (alturaCejas <= 285) {
    movimientoCejas = + 1;
  }
  
  
  //Texto mostrado por pantalla
  fill(0,0,0);
  text("Clica y aguanta con el mouse",350,50);
  text("Presiona una tecla y aguanta",350,670);
}

void keyPressed(){
lanzador2=true;
}

void keyReleased(){
lanzador2=false;
}


void mousePressed(){
  lanzador=true;
}
void mouseReleased(){
  colorOjo=color(0,0,255);
  lanzador=false;
}



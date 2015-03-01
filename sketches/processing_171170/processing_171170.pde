
int tamanyoLinea = 1;
int color1 = 0;
int color2 = 0;
int color3 = 0;
int inicio2 = 1;

boolean lineaRecta = true;
boolean boton1 = true;
boolean clickSuma = true;
boolean clickResta = true;
boolean inicio = true;
boolean carga = true;
boolean reset = true;
boolean primerClick = true;
boolean ellipseRandom = true;
boolean lienzoC = true;
boolean ellipseNoise = true;
boolean colorRojo = true;
boolean colorVerde = true;
boolean colorAzul = true;
boolean colorNegro = true;
boolean colorGoma = true;
boolean lineaE = true;

void setup(){
  size(1300, 700);
  background(255,255,255);
  //pantalla principal
  fill(0,0,0);
  textSize(15);
  text("Presiona la tecla que corresponde a cada lienzo.", 50, 50);
  text("Presiona la tecla m para regresar al menú principal.", 50, 70);
  text("Albert Esteve Lopez",1075,675);
  textSize(100);
  text("Be creative!",400, 150);
  textSize(50);
  text("Lienzo a", 550, 250);
  text("Lienzo b", 550, 350);
  text("Lienzo c", 550, 450);
  text("Lienzo d", 550, 550);
  text("Lienzo e", 550, 650);
    
}

void draw(){

  println(mouseX + " : " + pmouseY);
 //items del menu a b c d e 
  if (key == 'a') {
    
  //linea ejemplo
   strokeWeight(tamanyoLinea);
   line (10, 25, 100, 25);

  //Linea recta
   if (lineaRecta == false) {
     //linea para dibujar
       stroke(color1,color2,color3);
       strokeWeight(tamanyoLinea);
       strokeCap(ROUND);
       line (mouseX, mouseY, pmouseX, pmouseY);
       stroke(0,0,0);
    }

  //boton + 1 a la linea 
  fill(255,255,255);
  strokeWeight(1);
  rect(25,50,50,50);
  fill(0,0,0);
  rect(45,55,10,40);
  rect(30,70,40,10);
  
  if (clickSuma == false && mouseX > 25 && mouseY >50 && mouseX < 75 && mouseY < 100 ) {
     tamanyoLinea = tamanyoLinea + 1;
       clickSuma = true;
    }
    
    
  //boton - 1 a la linea 
  fill(255,255,255);
  strokeWeight(1);
  rect(25,125,50,50);
  fill(0,0,0);
  rect(30,145,40,10);
  
  
    
   if (clickResta == false && mouseX > 25 && mouseY >125 && mouseX < 75 && mouseY < 175 ) {
     tamanyoLinea = tamanyoLinea - 1;
       clickResta = true;
       noStroke();
       fill(255,255,255);
       rect(0,0,125,49);
       stroke(0,0,0);
    }
    //color rojo
    if (colorRojo == false && mouseX > 25 && mouseY >200 && mouseX < 75 && mouseY < 250 ) {
     
       //reset colores
       color1 = 0;
       color2 = 0;
       color3 = 0;
       //nuevo color
       color1 = 255;
       
    }
    //boton color rojo
      fill(255,0,0);
      strokeWeight(1);
      rect(25,200,50,50);
      fill(0,0,0);
      rect(30,145,40,10);
      
      //color verde
    if (colorVerde == false && mouseX > 25 && mouseY >275 && mouseX < 75 && mouseY < 325 ) {
     
       //reset colores
       color1 = 0;
       color2 = 0;
       color3 = 0;
       //nuevo color
       color2 = 255;
       
    }
    //boton color verde
      fill(0,255,0);
      strokeWeight(1);
      rect(25,275,50,50);
      fill(0,0,0);
      rect(30,145,40,10);
      
    //color azul
    if (colorAzul == false && mouseX > 25 && mouseY >350 && mouseX < 75 && mouseY < 400 ) {
     
       //reset colores
       color1 = 0;
       color2 = 0;
       color3 = 0;
       //nuevo color
       color3 = 255;
       
    }
    //boton color azul
      fill(0,0,255);
      strokeWeight(1);
      rect(25,350,50,50);
      fill(0,0,0);
      rect(30,145,40,10);
      
       //color negro
    if (colorNegro == false && mouseX > 25 && mouseY >425 && mouseX < 75 && mouseY < 475 ) {
     
       //reset colores
       color1 = 0;
       color2 = 0;
       color3 = 0;
       
       
    }
    //boton color negro
      fill(0,0,0);
      strokeWeight(1);
      rect(25,425,50,50);
      fill(0,0,0);
      rect(30,145,40,10);
      
       //color goma
    if (colorGoma == false && mouseX > 25 && mouseY >500 && mouseX < 75 && mouseY < 550 ) {
     
       ///reset colores
       color1 = 0;
       color2 = 0;
       color3 = 0;
       //nuevo color
       color1 = 255;
       color2 = 255;
       color3 = 255;
       
    }
    //boton color goma
      fill(255,255,255);
      strokeWeight(1);
      rect(25,500,50,50);
      fill(0,0,0);
      rect(30,145,40,10);
      
  }
   if (key == 'b') {
    if (ellipseRandom == false) {
     
       fill(random(255),random(255),random(255));
       line (mouseX, mouseY, 0, 0);
    }

  }
  
  if (key == 'c') {
    if (lienzoC == false) {
     
       fill(random(255),random(255),random(255));
       ellipse (mouseX, mouseY, mouseX, mouseY);
    }

  }
  if (key == 'd') {
    if (ellipseNoise == false) {
     
       fill(random(255),random(255),random(255));
       ellipse (mouseX, 350, noise(500),random(500));
    }

  }
    if (key == 'e') {
    if (lineaE == false) {
     
      line (mouseX, 0,0, mouseY);
      line (0, mouseY, mouseX,0);
      
    }

  }
  
}
void mousePressed() {
   lineaRecta = false;
   boton1 = false;
   clickSuma = false;
   clickResta = false;
   inicio = false;
   primerClick = false;
   ellipseRandom = false;
   lienzoC = false;
   ellipseNoise = false;
   colorRojo = false;
   colorVerde = false;
   colorAzul = false;
   colorNegro = false;
   colorGoma = false;
   lineaE = false;
}
 
void mouseReleased() {
    lineaRecta = true;
    boton1 = true;
    clickSuma = true;
    clickResta = true;
    ellipseRandom = true;
    lienzoC = true;
    ellipseNoise = true;
    colorRojo = true;
    colorVerde = true;
    colorAzul = true;
    colorNegro = true;
    colorGoma = true;
    lineaE = true;
}
void keyPressed() {
  if (key == 'r' || key == 'a' || key == 'b' || key == 'c' || key == 'd' || key == 'e'){
  background(255,255,255);
   
  }
  if(key == 'm'){
  background(255,255,255);
  fill(0,0,0);
  textSize(15);
  text("Presiona la tecla que corresponde a cada lienzo.", 50, 50);
  text("Presiona la tecla m para regresar al menú principal.", 50, 70);
  text("Albert Esteve Lopez",1075,675);
  textSize(100);
  text("Be creative!",400, 150);
  textSize(50);
  text("Lienzo a", 550, 250);
  text("Lienzo b", 550, 350);
  text("Lienzo c", 550, 450);
  text("Lienzo d", 550, 550);
  text("Lienzo e", 550, 650);
  }
  
  
}






//Nicolás Montes Vázquez

float tamanoCuadrado=5;
float tamanoCirculo=5;
float tamanoLinea=1;
float tamanoTriangulo1=1.5;
float tamanoTriangulo2=1;
float borde=1;
int colorFormas=#000000;
int rojo=#ff0000;
int verde=#00ff00;
int azul=#0000ff;
int amarillo=#ffff00;
int rosa=#ff00ff;
int celeste=#00ffff;
int naranja=#ff8000;
int verde2=#80ff00;
int azulVerdoso=#00ff80;
int morado=#8000ff;
int blanco=#ffffff;
int negro=#000000;
boolean lanzador=false;
int reflexion=0;

void setup() {
  size(1200, 675);
  background(#ffffff);
  frameRate(1000);
}

void draw() {

  //menu izquierdo
  //panel izquierdo
  fill(#A4A4A4);
  stroke(#000000);
  strokeWeight(1);
  rect(0, 0, 100, 674);
  //Cuadrado Rojo
  fill(#ff0000);
  rect(20, 50, 20, 20);
  //Cuadrado Verde
  fill(#00ff00);
  rect(60, 50, 20, 20);
  //Cuadrado Azul
  fill(#0000ff);
  rect(20, 100, 20, 20);
  //Cuadrado Amarillo
  fill(#ffff00);
  rect(60, 100, 20, 20);
  //Cuadrado Rosa
  fill(#ff00ff);
  rect(20, 150, 20, 20);
  //Cuadrado Celeste
  fill(#00ffff);
  rect(60, 150, 20, 20);
  //Cuadrado Naranja
  fill(#ff8000);
  rect(20, 200, 20, 20);
  //Cuadrado Verde 2
  fill(#80ff00);
  rect(60, 200, 20, 20);
  //Cuadrado Azul Verdoso
  fill(#00ff80);
  rect(20, 250, 20, 20); 
  //Cuadrado Morado
  fill(#8000ff);
  rect(60, 250, 20, 20);
  //Cuadrado Blanco
  fill(#ffffff);
  rect(20, 300, 20, 20); 
  //Cuadrado Negro
  fill(#000000);
  rect(60, 300, 20, 20);
  //Cuadrado Blanco
  fill(#ffffff);
  rect(20, 350, 20, 20); 
  //Cuadrado Negro
  fill(#000000);
  rect(60, 350, 20, 20);
  //Cuadrado con Borde
  fill(#ffffff);
  rect(20, 400, 20, 20); 
  //Cuadrado sin Borde
  fill(#000000);
  noStroke();
  rect(60, 400, 20, 20);

  //Hacer lineas
  if (mouseButton==LEFT && (key == 'w'  || key== 'q' || key== 'e')) {
    strokeWeight(tamanoLinea);
    stroke(colorFormas);
    line(mouseX,mouseY,mouseX,mouseY);  
    line(reflexion-mouseX,mouseY,reflexion-mouseX,mouseY); 
  }

  //Hacer cuadrados
  if (mouseButton==LEFT && (key == 's'  || key== 'a' || key== 'd')) {
    stroke(#000000);
    strokeWeight(borde);
    fill(colorFormas);
    rect(mouseX,mouseY,tamanoCuadrado,tamanoCuadrado);
    rect(reflexion-mouseX,mouseY,tamanoCuadrado,tamanoCuadrado);
  }

  //Hacer triangulos
  if (mouseButton==LEFT && (key == 'x' || key== 'z' || key== 'c')) {
    stroke(#000000);
    strokeWeight(borde);
    fill(colorFormas);
    triangle(pmouseX, pmouseY-(5*tamanoTriangulo2), pmouseX+(5*tamanoTriangulo1), pmouseY+(5*tamanoTriangulo2), pmouseX-(5*tamanoTriangulo1), pmouseY+(5*tamanoTriangulo2));
    }

  //Hacer redondas
  if (mouseButton==LEFT && (key == 't' || key== 'r' || key== 'y')) {
    stroke(#000000);
    strokeWeight(borde);
    fill(colorFormas);
    ellipse(pmouseX, pmouseY, tamanoCirculo, tamanoCirculo);
    ellipse(reflexion-pmouseX, pmouseY, tamanoCirculo, tamanoCirculo);
  }

  //Usar color rojo
  if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=50 && mouseY<=70) {
    colorFormas=rojo;
  }
  
  //Usar color Verde
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=50 && mouseY<=70) {
    colorFormas=verde;
  }

  //Usar color azul
  if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=100 && mouseY<=120) {
    colorFormas=azul;
  }

  //Usar color amarillo
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=100 && mouseY<=120) {
    colorFormas=amarillo;
  }


  //Usar color rosa
  if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=150 && mouseY<=170) {
    colorFormas=rosa;
  }

  //Usar color celeste
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=150 && mouseY<=170) {
    colorFormas=celeste;
  }

  //Usar color naranja
  if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=200 && mouseY<=220) {
    colorFormas=naranja;
  }

  //Usar color verde2
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=200 && mouseY<=220) {
    colorFormas=verde2;
  }

  //Usar color azulVerdoso
  if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=250 && mouseY<=270) {
    colorFormas=azulVerdoso;
  }

  //Usar color morado
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=250 && mouseY<=270) {
    colorFormas=morado;
  }
  
  //Usar color blanco
  if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=300 && mouseY<=320) {
    colorFormas=blanco;
  }

  //Usar color negro
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=300 && mouseY<=320) {
    colorFormas=negro;
  }
  
  //Activar reflexión
  if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=350 && mouseY<=370) {
    lanzador = true;
    reflexion=1200;
  }

  //Desactivar reflexión
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=350 && mouseY<=370) {
    lanzador = false;
    reflexion=0;
  }
  
  //Reducir borde
  if (borde<1.1) {
    borde=1;
  }else if (mouseButton==LEFT && mouseX>=20 && mouseX<=40 && mouseY>=400 && mouseY<=420) {
    borde=borde-0.1;
  }

  //Aumentar borde
  if (mouseButton==LEFT && mouseX>=60 && mouseX<=80 && mouseY>=400 && mouseY<=420) {
    borde=borde+0.1;
  }

  //Texto que se ve en el menú
  fill(#000000);
  stroke(#000000);
  text("Colores:",25,25);
  text("Reflexion:",25,345);
  text("Con      Sin",20,381);
  text("Borde:",35,397);
  text("Menos   Mas",15,431);
  text("Instrucciones:",10,465);
  text("Q - W - E",25,485);
  text("PUNTO",27,500);
  text("A - S - D",25,515);
  text("CUADRADO",16,530);
  text("Z - X - C",25,545);
  text("TRIANGULO",15,560);
  text("R - T - Y",25,575);
  text("CIRCULO",20,590);
  text("Q - A - Z - R",20,605);
  text("REDUCIR",18,620);
  text("R - D - C - Y",20,635);
  text("AUMENTAR",17,650); 
  text("B = LIMPIAR",17,670); 
  
}

void keyPressed() {
  //Aumentar tamaño de la linea
  if (key =='e') {
    tamanoLinea=tamanoLinea+1;
  }
  
  //Aumentar tamaño del cuadrado
  if (key =='d') {
    tamanoCuadrado=tamanoCuadrado+1;
  }
  
  //Aumentar tamaño del triangulo
  if (key =='c') {
    tamanoTriangulo1=tamanoTriangulo1+1.5;
    tamanoTriangulo2=tamanoTriangulo2+1;
  }
  
  //Aumentar tamaño del circulo
  if (key =='y') {
    tamanoCirculo=tamanoCirculo+1;
  }  
  
  //Disminuir tamaño del cuadrado
  if (tamanoCuadrado<2) {
    tamanoCuadrado=1;
  }else if (key =='a') {
    tamanoCuadrado=tamanoCuadrado-1;
  }

 //Disminuir tamaño de la linea
  if (tamanoLinea<2) {
    tamanoLinea=1;
  }else if (key =='q') {
    tamanoLinea=tamanoLinea-1;
  }
  
  //Disminuir tamaño del circulo
  if (tamanoCirculo<2) {
    tamanoCirculo=1;
  }else if (key =='r') {
    tamanoCirculo=tamanoCirculo-1;
  }

  //Disminuir tamaño del triangulo
  if (tamanoTriangulo2<1) {
      tamanoTriangulo2=0.5;
      tamanoTriangulo1=0.75; 
  }else if (key == 'z') {
      tamanoTriangulo2=tamanoTriangulo2-0.5;
      tamanoTriangulo1=tamanoTriangulo1-0.75;
  }

  //Borrar todo lo de la pantalla
  if (key=='b') {
    background(#ffffff);
    //menu izquierdo
    //panel izquierdo
    fill(#A4A4A4);
    stroke(#000000);
    rect(0, 0, 100, 674);
    //Quadrado Rojo
    fill(#ff0000);
    rect(20, 50, 20, 20);
    //Quadrado Verde
    fill(#00ff00);
    rect(60, 50, 20, 20);
    //Quadrado Azul
    fill(#0000ff);
    rect(20, 100, 20, 20);
    //Quadrado Amarillo
    fill(#ffff00);
    rect(60, 100, 20, 20);
    //Quadrado Rosa
    fill(#ff00ff);
    rect(20, 150, 20, 20);
    //Quadrado Celeste
    fill(#00ffff);
    rect(60, 150, 20, 20);
    //Quadrado Naranja
    fill(#ff8000);
    rect(20, 200, 20, 20);
    //Quadrado Verde 2
    fill(#80ff00);
    rect(60, 200, 20, 20);
    //Quadrado Azul Verdoso
    fill(#00ff80);
    rect(20, 250, 20, 20); 
    //Quadrado Morado
    fill(#8000ff);
    rect(60, 250, 20, 20);
  }
}



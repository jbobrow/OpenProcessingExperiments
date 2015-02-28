

int posX, posY, vX, vY;
//Els colors no funcionen amb RGB i he utilitzat aquest codi
int value=#FF0000;
//explicat mes tard
int midaMinima = 0;
int midaMaxima = 20;
float interval = 0.3;
boolean creixent = true;
float midaBola = 1;

void setup(){
  size(700,700);
  posX = width/2;
  posY = height/2;
  vX = 4;
  vY = 5;
}

void draw(){
  background(140, 218, 252);
  stroke(0);
  strokeWeight(5);
  
  //posicions
  posX = posX+vX;
  posY = posY+vY;
  
  //dibuix
  
  noStroke();
  fill(value);
  ellipse(posX, posY-70, 150, 116);
  fill(255);
  ellipse(posX-60, posY-70, 40, 116/2);
  ellipse(posX+60, posY-70, 40, 116/2);
  //outline barret
  noFill();
  stroke(5);
  ellipse(posX, posY-70, 155, 120);
 
  //cos
  fill(255);
  ellipse(posX, posY, 80, 40);
  //outline cos 2
  noFill();
  stroke(5);
  ellipse(posX,posY, 80, 40);
  //C1
  fill(255);
  rect(posX-40, posY-40, 80, 40);
 
  //ulls
  fill(0);
  ellipse(posX+15, posY-20, 6, midaBola);
  ellipse(posX-15, posY-20, 6, midaBola);
 
  //cap2
  noStroke();
  fill(255);
  ellipse(posX, posY-60, 50, 50);
 
  //outline cos 1
  noFill();
  stroke(5);
  rect(posX-40, posY-40, 80, 40);
 
  //Linia de "borrar"
  stroke(255);
  line(posX-35, posY, posX+35, posY);
  
  //límits
  if (posX + 75 > width) {
    vX = -vX;
    posX = width -75;
  } 
   if (posX-75 <0) { 
    vX = -vX;
    posX = 75;
  }
  //eix Y
    if (posY + 20 > height) {
    vY = -vY;
    posY = height -20;
  } 
   if (posY-128 <0) { 
    vY = -vY;
    posY = 128;
  }
   
//A partir del tutorial de la breathing ball http://processing.joan.cat/cat/s05_condicionals/index.html#5 introdueixo un condicional pel parpadeix dels ulls
//En un principi volia que tanques els ulls quan es dones conta la "paret" pero no he sapigut com fer ho aixi que he buscat una forma de que sembli que tanqui i obri els ulls 
//Codi original
/*
Tutorial de Processing
joan soler-adillon (www.joan.cat)
 
 Utilitzem un codicional para fer "respirar" la bola


int midaMinima = 20;
int midaMaxima = 175;
int interval = 3;
boolean creixent = true;
int midaBola = 2;

void setup(){
  size(200,200);
  smooth();
  strokeWeight(3);
}

void draw(){
  background(255,255,127); 
  //colors
  fill(255,127,255);
  stroke(127,255,255);

  //La mida de la bola ha de canviar segons estigui creixent o decreixent
  if(creixent==true){
    midaBola = midaBola + interval;
  } 
  else { //Ã©s a dir, si no estÃ  creixent
    midaBola = midaBola - interval;
  }

  ///////////////////////
  //I ara cal comprobar si ha arribat a una mida lÃ­mit
  //per canviar el cicle creixent/decreixent
  if(midaBola > midaMaxima){
    creixent = false;
  }
  if(midaBola < midaMinima){
    creixent = true;
  }

  //I finalment la dibuixem
  ellipse(width/2,height/2,midaBola,midaBola);
}
*/

//parpadeix
  if(creixent==true){midaBola = midaBola + interval;
  } 
  else {midaBola = midaBola - interval;
  }

  if(midaBola > midaMaxima){
    creixent = false;
  }
  if(midaBola < midaMinima){
    creixent = true;
  }

}

//Canvi de vermell a verd amb el ratoli
void mousePressed() {
  if (value == #FF0000) {
    value = #17D341;
  } else {
    value = #FF0000;
  }
}



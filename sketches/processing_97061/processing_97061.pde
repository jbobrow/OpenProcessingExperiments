
/*
Pràctica 3_b: CONDICIONALS
Ona Bombí Aymerich
Grup 02 
Informàtica 
2n GEDI 2012-2013
*/

// Declaració de les variables
PImage img;
int posX, posY, velX, velY, sz, forma; 
color color1, color2;

void mousePressed (){
  // Al prémer el ratolí, la figura es situa al mig de l'escenari.
  posX = width/2;
  posY = height/2;
  
  // La figura va creixent fins a un límit i torna a ser petita.
  sz = sz + 10;
    if (sz > 70){
      sz = 50;
  }
  
  // Canvi de forma. Si la figura és més gran o igual a 2, passa a ser la forma 1. 
  forma = forma + 1;
    if (forma >= 2){
      forma = 1;
  }   
}

void setup() {
  // Dimensions de l'escenari
  size (400,400); 
  
  // Importació d'una imatge per a definir-la com a fons d'escenari
  img=loadImage("fons.jpg");
  background(0);
  
  // Inicialització de les variables
  posX = width/2;
  posY = height/2;
  velX = 1;
  velY = 2;
  sz = 50;
  forma = 1;
  
  //Definició característiques del dibuix
  noStroke();
  noCursor();
}

void draw () {
  // Col·locació fons
  image(img,0,0,width,height);
  
  // Definició del color de les estrelles de mar
  color2 = color(205,210,100); 
  fill(color2);
  // Estrella 1
  pushMatrix();
  translate(width/6,3*height/4);
  for(int i=0; i<5; i++){
    rotate(10);
    triangle(0,0,3,25,6,0);
  }
  popMatrix();
 
  // Estrella 2
  pushMatrix();
  translate(width/4,4*height/6);
  for(int i=0; i<5; i++){
    rotate(5);
    triangle(0,0,3,25,6,0);
  }
  popMatrix();
  
  // Actualitza posició
  posX = posX + velX;
  posY = posY + velY;
  
  fill(color1); // Corregim el color per a les noves figures
  
  // Cranc
  if(forma == 1){
    ellipse(posX,posY,sz,sz*0.8); // Cos
    bezier(posX+25,posY,posX+28,posY-40,posX+10,posY-45,posX+5,posY-50); // Pinces
    bezier(posX-25,posY,posX-28,posY-40,posX-10,posY-45,posX-5,posY-50);
    fill(0); // Color ulls
    ellipse(posX-5,posY-(sz/3),sz/6,sz/6); // Ulls
    ellipse(posX+5,posY-(sz/3),sz/6,sz/6);  
  }
  
  // Medusa
  if(forma == 2){  
     arc(posX,posY,sz,3*sz/2, -PI, 0); // Cos
     bezier(posX+10,posY,posX+15,posY+20,posX+5,posY+25,posX+10,posY+50); // Tentacles
     bezier(posX-10,posY,posX-15,posY+20,posX-5,posY+25,posX-10,posY+50);
     bezier(posX,posY,posX-2,posY+30,posX-3,posY+35,posX+1,posY+60);
     bezier(posX+20,posY,posX+18,posY+5,posX+15,posY+10,posX+20,posY+30);
     bezier(posX-20,posY,posX-21,posY+2,posX-25,posY+10,posX-20,posY+30);
 }
 
  // Comprovar posició X
  if ((posX < 0 + sz/2) || (posX > width - sz/2)){
    velX = - velX; 
  }
  
  // Comprovar posició Y  
    if ( (posY < 0 + (3*sz/2)/2) || (posY > height - ((sz*0.8)/2))){
    velY = - velY;
  }
 
   //Canvi de forma. Forma 1 a la meitat inferior (platja) i forma 2 a la meitat superior (mar)  
   if (posY<height/2){
   forma = 2;   
  }
   else {
    forma = 1;   
  }  
  
   //Canvi de color al desplaçar la forma al l'espai   
   if (posY < height/2){ // Per sobre de la meitat és d'un color
      color1 = color(210,63,232);
      fill(color1);
  }
   else {
    color1 = color(252,10,18); // Per sota de la meitat és d'un altre color
    fill(color1);
  }
    
  }  




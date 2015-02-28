
/*
Pràctica 4_c: BUCLES I ARRAYS
Ona Bombí Aymerich
Grup 02 
Informàtica 
2n GEDI 2012-2013
*/

//DECLARACIÓ VARIABLES

// Fons estàtic
int distX = 25, distY = 25; // Espaiat
int szX = 18, szY = 18; // Dimensions quadrats
color color2 = color(205,210,100), color3 = color(200,230,120); // Color quadrats

// Elements que reboten amb la pantalla 
int sz = 50; // Mida crancs
int forma = 12; // Nombre de crancs
color color1; // Color cranc

// Matrius dels crancs
float[] posX = new float[forma]; // Matriu posicions X
float[] posY = new float[forma]; // Matriu posicions Y
float[] velX = new float[forma]; // Matriu velocitats X
float[] velY = new float[forma]; // Matriu velocitats Y

void setup() {
  
  // Seqüència de velocitats
  frameRate(10); 
  
  //Dimensions de la pantalla en funció del fons estàtic
  size(distX*szX+(distX-szX),distY*szY+(distY-szY));
  
  
  // Inicialització posicions i velocitats
  for(int i = 0; i < forma; i++){
    posX[i] = height/2;
    posY[i] = width/2; 
    velX[i] = random(5,15);
    velY[i] = random(5,15);
  }
  
  //Definició característiques del dibuix
  noStroke();

}

void draw () {
    
  // Fons estàtic 
  background(75,166,255);    
  for(int x=distX-szX; x < width; x+=distX)for(int y=distY-szY; y < height; y+=distY){    
    fill(color2);
    rect(x,y,szX,szY); 
    fill(color3);
    rect(x+2.5,y+2.5,szX-5,szY-5);
  }
  
  // Actualitzem posicions dels crancs
  for(int i = 0; i < forma; i++){    
    posX[i] += velX[i];
    posY[i] += velY[i];

    // Comprobem limits X
    if((posX[i] < (0 + sz/2))||(posX[i] > (width - sz/2))){
      velX[i] = -velX[i];
    } 
    
    // Comprobem limits Y
    if((posY[i] < sz)||(posY[i] > (height - sz*0.8/2)) ) {
      velY[i] = -velY[i];
    } 
    
      
    // Dibuix del cranc
    fill(color1);
    ellipse(posX[i],posY[i],sz,sz*0.8); // Cos
    bezier(posX[i]+25,posY[i],posX[i]+28,posY[i]-40,posX[i]+10,posY[i]-45,posX[i]+5,posY[i]-50); // Pinces
    bezier(posX[i]-25,posY[i],posX[i]-28,posY[i]-40,posX[i]-10,posY[i]-45,posX[i]-5,posY[i]-50);
    fill(0); // Color ulls
    ellipse(posX[i]-5,posY[i]-(sz/2-sz/6),sz/6,sz/6); // Ulls
    ellipse(posX[i]+5,posY[i]-(sz/2-sz/6),sz/6,sz/6);
   
    // Canvi de color al desplaçar la forma al l'espai      
    if (posY[i] < height/2){ 
      color1 = color(255,110,0);
      fill(color1);
    }
    
    else {
      color1 = color(252,10,18); // Si no compleix la condició és d'un altre color
      fill(color1);
    } 
  
  }

}

// Al clicar el ratolí es reinicialitzen la posició i les velocitats
void mousePressed(){
  for(int i = 0; i < forma; i++){    
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random(5,15);
    velY[i] = random(5,15);       
   } 
  
}

   
 
  

 





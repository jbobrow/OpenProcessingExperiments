
//denominamos la cantidad de pinguinos que queremos que aparezcan
int numPinguinos = 10;

int colorCuerpo = 0;

//creamos la matriz para la posición X
float[] posicionesX = new float[numPinguinos];
//creamos la matriz para la posición Y
float[] posicionesY = new float[numPinguinos];
//creamos la matriz para la velocidad X
float[] velocidadesX = new float[numPinguinos];
//creamos la matriz para la velocidad Y
float[] velocidadesY = new float[numPinguinos];


void setup(){

//Nombre y título del trabajo
println("Sergio González Sánchez. Grupo 3. Práctica 4: Pinguino walker");

//Dimensiones de la pantalla
size(600,600);

//iniciamos las posiciones y las velocidades de los pinguinos de forma random
for(int i=0; i<numPinguinos; i++){
  posicionesX[i] = random(width/2-100, width/2+100);
  posicionesY[i] = random(height/2-100, height/2+100);

//las velocidades son random
velocidadesX[i] = random(1,6);
velocidadesY[i] = random(1,6);
}

}

void draw(){
 
background(255); 

//iniciamos un bucle para que vaya repitiendo las acciones determinadas anteriormente

for(int i = 0; i<numPinguinos; i++){
  //actualizamos las posiciones
  posicionesX[i] += random(-3,3);
  posicionesY[i] += random(-3,3);
  
  //comprovamos los límites X
  if((posicionesX[i]<0)||(posicionesX[i]>width)){
    velocidadesX[i] = -velocidadesX[i];
  }
  
  //comprovamos los límites Y
  if((posicionesY[i]<0)||(posicionesY[i]>height)){
    velocidadesY[i] = -velocidadesY[i];
  }
  
  //y ahora introducimos el dibujo
  dibujarPinguino(posicionesX[i], posicionesY[i]);
}
}

void dibujarPinguino(float _x, float _y){
 
//cuerpo
noStroke();
fill(colorCuerpo);
ellipse(_x+80,_y+80,100,100);



//ojos blanco
fill(255,255,255);
ellipse(_x+65,_y+56,30,30);
ellipse(_x+95,_y+56,30,30);



//barriga
ellipse(_x+80,_y+102,75,52);



//ojos negro
fill(0,0,0);
ellipse(_x+66,_y+59,14,14);
ellipse(_x+94,_y+59,14,14);



//pico
fill(237,197,50);
strokeWeight(2);
stroke(250,150,0);
triangle(_x+68,_y+74,_x+92,_y+74,_x+80,_y+95);
    
  }

//Presionando el mouse fuera del bucle provoca el cambio de color en el cuerpo de los pinguinos
 void mousePressed()
 
 {
   
   colorCuerpo = color (mouseX,mouseY,0);
   
 }

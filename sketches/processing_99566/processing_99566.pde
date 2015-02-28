
//Joan Recasens
//Seminari 4
//definim les variables del programa
//inicialitzo els valors que utilitzare per fer la matriu i els bucles
 
var audioElement = document.createElement("audio");
 
int sz = 45;
int numrect = 3;
  
//fem una matriu de posicions i velocitats per "numrect"
float[] posicionsX = new float[numrect];
//posicionsY
float[] posicionsY = new float[numrect];
//velocitatsX
float[] velocitatsX = new float[numrect];
//velocitatsY
float[] velocitatsY = new float[numrect];
   
 
  
void setup(){
size(500,500);
  
//inicialitzem posicions (al extrem inferior dret) i velocitats dels rectangles:
for(int i = 0; i<numrect; i++){
posicionsX[i] = width;
posicionsY[i] = height;
velocitatsX[i] = random(7,10);
velocitatsY[i] = random(7,10);

}
//amb el frameRate fem el moviment aleatori de les ellipses i dels rectangles
frameRate(30);
}
  
void draw(){
 
//Creamos un objeto PImage, de nombre afoto
PImage afoto;
  //cargamos una foto en concreto en afoto
  //(que tiene que estar en el sketch folder, y moejor dentro de la carpeta data)
afoto = loadImage("nena.jpg");
//y dibujamos la foto
image(afoto, -250, -100);
 
fill(254,17,17);
//fem el fons estàtic que es paramètric
for (int i = 15; i < width; i = i+30) {
for (int j = 15; j < height; j = j+30) {
 
ellipse (i,j,10, 10);
  }
}
 
fill(252,8,249);
//Fem les ellipses
for (int i=0; i<100; i++); {
float posX = random(width);
float posY = random(height);
float tamano = random (60);
 
ellipse(posX, posY, tamano, tamano);
}
 
fill(58,28,131);
for (int i=0; i<100; i++) {
float posX = random(width);
float posY = random(height);
float tamanot= random (25);
  
 
 fill(255,235,13);
rect(posX,posY,tamanot,tamanot);
}
  
  
//iniciem un bucle creei les mateixes accions a tots els valors de les matrius
for(int i = 0; i<numrect; i++){
posicionsX[i] += velocitatsX[i];
posicionsY[i] += velocitatsY[i];
  
//delimitem que els rectangles només es moguin dins del límit i ho fem de forma paramètrica
if((posicionsX[i]<0)||(posicionsX[i]>width)){
velocitatsX[i] = -velocitatsX[i];
 audioElement.setAttribute("src", "whl.wav");
  audioElement.play();

}
if((posicionsY[i]<0)||(posicionsY[i]>height)){
velocitatsY[i] = -velocitatsY[i];
 audioElement.setAttribute("src", "whl.wav");
  audioElement.play();

}
    
//dibuixem els rectangles
fill(58,28,131);
    rect(posicionsX[i],posicionsY[i],sz,sz);
}
    
}




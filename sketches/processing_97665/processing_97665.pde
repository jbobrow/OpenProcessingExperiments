
//Joan Recasens
//Seminari 4
//definim les variables del programa
int sz = 45;
int numrect = 45;

//fem una matriu de posicions i velocitats per "numrect" 
float[] posicionsX = new float[numrect];
//posicionsY
float[] posicionsY = new float[numrect];
//velocitatsX
float[] velocitatsX = new float[numrect];
//velocitatsY
float[] velocitatsY = new float[numrect];

void setup(){
size(500, 500);

//inicialitzem posicions (al extrem inferior dret) i velocitats dels rectangles:
for(int i = 0; i<numrect; i++){
posicionsX[i] = width;
posicionsY[i] = height;
velocitatsX[i] = random(1,10);
velocitatsY[i] = random(1,10);
}
//amb el frameRate fem el moviment aleatori de les ellipses i dels rectangles
frameRate(10);
}

void draw(){
//definim un fons
background(78,222,218);

//fem el fons estàtic que es paramètric 
for (int i = 0; i < width; i = i+30) {
for (int j = 0; j < height; j = j+30) {
fill(254,17,17);
ellipse (i,j,10, 10);
  }
}

//Fem les ellipses
for (int i=0; i<100; i++); {
float posX = random(width);
float posY = random(height);
float tamano = random (60);
fill(252,8,249);
ellipse(posX, posY, tamano, tamano);
}

for (int i=0; i<100; i++) {
float posX = random(width);
float posY = random(height);
float tamanot= random (25);

fill(58,28,131);

rect(posX,posY,tamanot,tamanot);
}


//iniciem un bucle creei les mateixes accions a tots els valors de les matrius
for(int i = 0; i<numrect; i++){
posicionsX[i] += velocitatsX[i];
posicionsY[i] += velocitatsY[i];

//delimitem que els rectangles només es moguin dins del límit i ho fem de forma paramètrica 
if((posicionsX[i]<0)||(posicionsX[i]>width)){
velocitatsX[i] = -velocitatsX[i];
}  
if((posicionsY[i]<0)||(posicionsY[i]>height)){
velocitatsY[i] = -velocitatsY[i];
} 
  
//dibuixem els rectangles
   fill(252,241,8);
    rect(posicionsX[i],posicionsY[i],sz,sz);
}
  
}








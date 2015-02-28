
//Nil Pastor Seminari 4
int sz = 30;
int numBoles = 10;

//Primer fem la matriu per a determinar la posició i la velocitat de les boles
//amb les components X,Y de posició
float[] posX = new float[numBoles];

float[] posY = new float[numBoles];
//i les components X,Y de velocitat
float[] velX = new float[numBoles];

float[] velY = new float[numBoles];

/* A continuació en el setup determinem la mida de la pantalla i els valors 
inicials per a posicio i velocitat en els eixos X,Y*/
void setup(){

  size(500,400);
  
  for(int i = 0; i<numBoles; i++){
    posX[i] = width/2;
    posY[i] = height/2;
    velX[i] = random(1,10);
    velY[i] = random(1,10);
  }
}

/* En el draw iniciem amb els bucles la construcció d'un mosaic fons de
de pantalla*/
void draw(){
  for(int x=0; x<width;x+=10){
  for(int y=0; y<height;y+=5){
  fill(250,150,0);
  rect(x,y,8,4);
}
}
 
/* Tot seguit iniciem un bucle que ompli els valors de la matriu inicial
i que per tant determina la posició i velocitat de les Boles*/
  for(int i = 0; i<numBoles; i++){
// la posicio incrementa amb la suma de la velocitat
    posX[i] += velX[i];
    posY[i] += velY[i];

/* en funció de la posició a la pantalla invertim la velocitat per a efectuar
el rebot*/
    if((posX[i]<0)||(posX[i]>width)){
      velX[i] = -velX[i];
    } 
    
    if((posY[i]<0)||(posY[i]>height)){
      velY[i] = -velY[i];
    } 
  
// Finalment dibuixem l'elipse
   fill(0,140,250);
   stroke(0,140,250);
   
   ellipse(posX[i],posY[i],sz,sz);
  }

}






/*DIA DE PLATJA
 Autor: Rut Diaz Palacios
Elisava GEDI - 3r trimestre
Grup 03
 
 
Es tracta de dos nens jugant a pilota durant l'aposta de sol a Cuba.
Els núvols van rebotant pels límits que se li ha marcat mentre l'aigua del mar va fent les onades
i en el ,oment en que passes el ratolí per sobre de l'aiua apareixen unes bombolles/espuma.
*/


//SO
var audioElement = document.createElement("audio");
var audioElement2 = document.createElement("audio");


//DECLARACIÓ DE VARIABLES
float y=1, velX, velY,posX,posY,vX,vY;  //float per decimals
int numNuvols=5; //número de nñuvols que hi hauran
int n, sz=20;
PImage foto; //creem un objecte PImage de nom "foto"

//creem una matriu de posicionsX amb "numNuvols" elements:
float[] posiX = new float[numNuvols];
//el mateix per posicionsY:
float[] posiY = new float[numNuvols];
//matriu per velocitatsX:
float[] veloX = new float[numNuvols];
//matriu per les velocitatsY:
float[] veloY = new float[numNuvols];
 
//INICIALITZACIONS
void setup(){
size (600,200);
//carreguem l'arxiu de la imatge anomenada "puestasol"
foto = loadImage ("puestasol.jpg");  

frameRate(3); //serveix x la VELOCITAT --> frames per segon (el que fico en parentesis son els frames/segon)
velX = random(1,6); //velocitats entre 1 i 6 frames declarades per la velocitat de la pilota
velY = random(1,6);
vX=random(6,15);
vY=vX;

    audioElement2.setAttribute ("src","mar.mp3");
audioElement2.play();


   for(int n = 0; n<numNuvols; n++){
    posiX[n] = random(sz,width-sz); 
    posiY[n] = random(sz,height/3);
    veloX[n] = vX;
    veloY[n] = vY;
  }
}

 
//A EXECUTAR
void draw() {
 
image(foto,0,0,600,200);  //dibuixem i fixem la imatge al fons amb la mida que la volem

//inicialitzem un bucle per tal que realitzi l'acció per tots els elements (núvols) de la matiru en les direccions corresponents
for(n=0; n<numNuvols; n++){
   //actualitzem posicions 
    posiX[n] += veloX[n]; //per la posició de la de X a la matriu la velocitat es positiva al igual que per la posició Y
    posiY[n] += veloY[n];
     
//indiquem els límits del rebot dels núvols. 
    if((posiX[n]<sz+5)||(posiX[n]>width-(15+sz))){
    veloX[n] = - veloX[n]; //Posem la condició de canvi del sentit de la velocitat al arribar als límits de la finestra.
audioElement.setAttribute ("src","rebot2.mp3");
audioElement.play();    
}
     
    if((posiY[n]<sz)||(posiY[n]>height/3)){
    veloY[n] = - veloY[n];
audioElement.setAttribute ("src","rebot2.mp3");
audioElement.play();  
}
   
    //dibuix del núvol. Només cal que dibuixi un ja que he definit al principi que es repeteixi 10 vegades.
    noStroke();
    fill(#FAFCFC);   
    ellipse(posiX[n],posiY[n],sz*2,sz);
    ellipse(posiX[n]+5,posiY[n]+3,sz,sz);
    ellipse(posiX[n]+10,posiY[n]+5,sz,sz);

}
     //MAR

stroke(#2B53A5);
for(int i=0; i<height; i++){ // l'interlineat que formin les muntanyes serà d'1 (distància entre coordenades)
  y+=.02; //distància en y que variara el nivell del mar
  int x = i*(width/height); //el fet de ficar-ho en funció de l'amplada i alçada de la  mida de la finestra, fa indepene
  float nY = noise(y/2)* height; //amb el noise genero una seqüència aleatòria i succesiva, en aquest cas de y. el valor de "y" no és important ja que com es treballa dins d'unespai infinit, la distància entre coordenades és l'únic important
  line(x,height,x,nY);
 }
    
    //SORRA = FONS ESTATIC

 for(int x=0; x<=width; x+=10){
    for(int y=180; y<=height; y+=10){
    noStroke();
      fill(#897134);
    ellipse(x,y,5,5); //deixara de funcionar si li fic o lo que va asota xqe executa lo altre
   }
 }
 
//quan incideixes el ratoli per sota del nivell del mar, surten bombolles
if(( mouseX > 600 || mouseY > 100)||( mouseY > width || mouseX <0)) {
 
   //BOMBOLLETES AIGUA
for(int i=0; i<100; i++){
     float posX = random(width); //fins a on farà la funció
     //si x ex. fico en posXi i posY radom(250); executarà la funció en el 1r quadrant
     float posY = random(height/2,height);
     float mida = random(12); //mida de les bombolletes que coma màxim seran de 12 (aniran de 0-12)
     fill(#639FEA);
     ellipse(posX,posY,mida,mida); }
}
 
//dibuix ninots i pilota
fill(#EACE85);
noStroke();
ellipse(20,170,15,15);
ellipse(20*10,170,15,15);
rect(15,170,5,200);
rect(200,170,5,200);
quad(20,190,20,180,60,160,60,160);
quad(20*10,190,20*10,180,60+100,160,60+100,160);
fill(#FA001D);
posX=50+velX;
posY=150+velY;
ellipse(posX,posY,20,20);
 
//PILOTA amb moviment
if((posX<100)&&(posX>300)){
    velX = -velX; //perquè retorni a la seva posició inicial
}
  //comprovem posicio Y
  if((posY<200)&&(posY>100)){
    velY = -velY;
}
}



